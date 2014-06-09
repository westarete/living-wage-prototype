class CreateStatesCountiesMetrosAggregationsGeographiesOccupations < ActiveRecord::Migration
  def change
    create_table :states, id: false do |t|
      t.primary_key :census_id
      t.string :name

      t.timestamps
    end

    create_table :counties, id: false do |t|
      t.primary_key :census_id
      t.integer :state_id
      t.string :name

      t.timestamps
    end

    create_table :metros, id: false do |t|
      t.primary_key :census_id
      t.integer :state_id
      t.string :name

      t.timestamps
    end

    create_table :aggregations do |t|
      t.string :familycomposition 
      t.integer :familysize 
      t.integer :house_cost 
      t.integer :childcare_cost 
      t.integer :health_cost 
      t.integer :food_cost 
      t.integer :trans_cost 
      t.integer :other_cost 
      t.integer :income 
      t.integer :income_pretax 
      t.integer :tax  
      t.integer :poverty 
      t.integer :minwage_hrly 
      t.integer :minwage 
      t.integer :income_hrly 
      t.integer :income_pretax_hrly 
      t.integer :poverty_hrly 
      t.integer :explainable_id 
      t.integer :explainable_type

      t.timestamps
    end

    create_table :occupations do |t|
      t.string :occ_type
      t.integer :occ_salary
      t.string :geography
      t.integer :explainable_id
      t.integer :explainable_type

      t.timestamps
    end

    create_table :geographies do |t|
      t.string :name
      t.string :type
      t.integer :census_id

      t.timestamps
    end
  end
end
