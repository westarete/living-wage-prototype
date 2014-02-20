class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|

	    t.integer :region_id
	    t.integer :statefips
	    t.integer :state_name
	    t.string :geography
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
	    
      t.timestamps
    end

    add_index :states, :region_id
  end
end
