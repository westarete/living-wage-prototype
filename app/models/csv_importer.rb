require 'csv'

# A class that knows how to import the raw data from CSV files. This class
# isn't used in the normal operation of the app. It's just used in the
# "csv:import" rake task.
class CSVImporter

  # Import all the data from the CSVs. This assumes that we're starting with
  # an empty database.
  def import_all
    states
    counties
    metros
    aggregations
    occupations
    geographies
  end

  def states
    CSV.foreach(Rails.root.join('db/fixtures/states.csv'), headers: true) do |row|

      census_id = row['census_id']
      name = row['name']

      record = State.where(census_id: census_id)

      if record.empty?
        record = State.create( census_id: census_id,
                               name: name)
        puts record.inspect
      end
    end
  end

  def counties
    CSV.foreach(Rails.root.join('db/fixtures/counties.csv'), headers: true) do |row|

      state_id = row['state_id']
      census_id = row['census_id']
      name = row['name']

      record = County.where(census_id: census_id)

      if record.empty?
        state = State.find(state_id)
        record = state.counties.create( census_id: census_id,
                                        name: name)
        puts record.inspect
      end
    end
  end

  def metros
    CSV.foreach(Rails.root.join('db/fixtures/metros.csv'), headers: true) do |row|

      census_id = row['census_id']
      name = row['name']
      state_id = row['state_id']

      record = Metro.where(census_id: census_id)

      if record.empty?
        state = State.find(state_id)
        record = state.metros.create( name: name,
                                      census_id: census_id)
        puts record.inspect
      end
    end
  end

  def aggregations

    model_names = %w( State County Metro )

    CSV.foreach(Rails.root.join('db/fixtures/aggregations.csv'), headers: true) do |row|
      census_id = row['census_id']
      familycomposition = row['familycomposition']
      familysize = row['familysize']
      geography = row['geography']
      house_cost = row['house_cost']
      childcare_cost = row['childcare_cost']
      health_cost = row['health_cost']
      food_cost = row['food_cost']
      trans_cost = row['trans_cost']
      other_cost = row['other_cost']
      income = row['income']
      income_pretax = row['income_pretax']
      tax = row['tax']
      poverty = row['poverty']
      minwage_hrly = row['minwage_hrly']
      minwage = row['minwage']
      income_hrly = row['income_hrly']
      income_pretax_hrly = row['income_pretax_hrly']
      poverty_hrly = row['poverty_hrly']

      record = Aggregation.where(explainable_id: census_id, familycomposition: familycomposition, explainable_type: geography)

      if record.empty?
        model_names.each do |model_name|
          model = Module.const_get model_name
          if model.name == geography
            geography = model.find(census_id)
            geography.aggregations.create(  familycomposition: familycomposition,
                                            familysize: familysize,
                                            house_cost: house_cost,
                                            childcare_cost: childcare_cost,
                                            health_cost: health_cost,
                                            food_cost: food_cost,
                                            trans_cost: trans_cost,
                                            other_cost: other_cost,
                                            income: income,
                                            income_pretax: income_pretax,
                                            tax: tax,
                                            poverty: poverty,
                                            minwage_hrly: minwage_hrly,
                                            minwage: minwage,
                                            income_hrly: income_hrly,
                                            income_pretax_hrly: income_pretax_hrly,
                                            poverty_hrly: poverty_hrly)
          end
        end
      end
    end
  end

  def occupations
    model_names = %w( State Metro )

    CSV.foreach(Rails.root.join('db/fixtures/occupations.csv'), headers: true) do |row|

      census_id = row['census_id']
      geography = row['geography']
      occ_type = row['occ_type']
      occ_salary = row['occ_salary']


      record = Occupation.where(explainable_id: census_id, occ_type: occ_type, explainable_type: geography)

      if record.empty?
        model_names.each do |model_name|
          model = Module.const_get model_name
          if model.name == geography
            geography = model.find(census_id)
            geography.occupations.create(occ_type: occ_type, occ_salary: occ_salary)
          end
        end
      end
    end
  end

  def geographies
    CSV.foreach(Rails.root.join("db/fixtures/geographies.csv"), headers: true) do |row|
      name = row['name']
      geography = row['geography']
      census_id = row['census_id']

      record = Geography.where(name: name, census_id: census_id)

      if record.empty?
        record = Geography.create(name: name, census_id: census_id, geography_type: geography)
        puts record.name
      end
    end
  end

end