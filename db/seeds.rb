# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

def states
  CSV.foreach('db/fixtures/LW_Alldata_2814.csv', headers: true) do |row|

    region_id = row['censusregion']
    statefips = row['statefips']
    state_name = row['state']

    record = State.find_by_statefips(statefips)

    if record.nil?
      record = State.create( region_id: region_id,
                             statefips: statefips,
                             state_name: state_name)
      puts record.inspect
    end
  end
end

def counties
  CSV.foreach('db/fixtures/LW_Alldata_2814.csv', headers: true) do |row|

    statefips = row['statefips']
    countyfips = row['countyfips']
    countyname = "placeholder"

    record = County.find_by_countyfips(countyfips)

    if record.nil? && countyfips.present?
      state = State.find_by_statefips(statefips)
      record = state.counties.create( countyfips: countyfips,
                                      countyname: countyname)
    # ensure
      puts record.inspect
    end
  end
end

def metros
  CSV.foreach('db/fixtures/LW_Alldata_2814.csv', headers: true) do |row|

    statefips = row['statefips']
    cbsa = row['cbsa']
    cbsa_name = row['cbsa_name']

    record = Metro.find_by_cbsa(cbsa)

    if record.nil? && cbsa.present?
      state = State.find_by_statefips(statefips)
      record = state.metros.create( cbsa: cbsa,
                                    cbsa_name: cbsa_name)
    # ensure
      puts record.inspect
    end
  end
end

def aggregations
  CSV.foreach('db/fixtures/LW_Alldata_2814.csv', headers: true) do |row|

    familycomposition = row['familycomposition']
    familysize = row['familysize']
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
    aggregation_id = row['aggregation_id']

    geography = row['geography']
    statefips = row['statefips']
    cbsa = row['cbsa']
    countyfips = row['countyfips']

    begin
      record = Aggregation.find(aggregation_id)
    rescue ActiveRecord::RecordNotFound
      if record.nil?
        if geography == "State"
          state = State.find_by_statefips(statefips)
          record = state.aggregations.create( familycomposition: familycomposition,
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
        
        if geography == "Metro"
          metro = Metro.find_by_cbsa(cbsa)
          record = metro.aggregations.create( familycomposition: familycomposition,
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

        if geography == "County"
          county = County.find_by_countyfips(countyfips)
          record = county.aggregations.create( familycomposition: familycomposition,
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
    ensure
        puts record.inspect
    end    
  end
end

# states
# counties
# metros
aggregations