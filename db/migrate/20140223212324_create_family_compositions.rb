class CreateFamilyCompositions < ActiveRecord::Migration
  def change
    create_table :family_compositions do |t|
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
  end
end
