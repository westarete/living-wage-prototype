class CreateMetros < ActiveRecord::Migration
  def change
    create_table :metros do |t|

	    t.integer :state_id
      t.integer :cbsa
      t.string :cbsa_name
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
	    t.string :state2
	    t.string :state3
	    t.string :state4

      t.timestamps
    end

    add_index :metros, :state_id
  end
end
