class RemoveAggregationColumnsFromStatesCountiesMetros < ActiveRecord::Migration
  def self.up
  	          remove_column :states, :familycomposition
              remove_column :states, :familysize
              remove_column :states, :house_cost
              remove_column :states, :childcare_cost
              remove_column :states, :health_cost
              remove_column :states, :food_cost
              remove_column :states, :trans_cost
              remove_column :states, :other_cost
              remove_column :states, :income
              remove_column :states, :income_pretax
              remove_column :states, :tax
              remove_column :states, :poverty
              remove_column :states, :minwage_hrly
              remove_column :states, :minwage
              remove_column :states, :income_hrly
              remove_column :states, :income_pretax_hrly
              remove_column :states, :poverty_hrly

              remove_column :counties, :familycomposition
              remove_column :counties, :familysize
              remove_column :counties, :house_cost
              remove_column :counties, :childcare_cost
              remove_column :counties, :health_cost
              remove_column :counties, :food_cost
              remove_column :counties, :trans_cost
              remove_column :counties, :other_cost
              remove_column :counties, :income
              remove_column :counties, :income_pretax
              remove_column :counties, :tax
              remove_column :counties, :poverty
              remove_column :counties, :minwage_hrly
              remove_column :counties, :minwage
              remove_column :counties, :income_hrly
              remove_column :counties, :income_pretax_hrly
              remove_column :counties, :poverty_hrly

  	          remove_column :metros, :familycomposition
              remove_column :metros, :familysize
              remove_column :metros, :house_cost
              remove_column :metros, :childcare_cost
              remove_column :metros, :health_cost
              remove_column :metros, :food_cost
              remove_column :metros, :trans_cost
              remove_column :metros, :other_cost
              remove_column :metros, :income
              remove_column :metros, :income_pretax
              remove_column :metros, :tax
              remove_column :metros, :poverty
              remove_column :metros, :minwage_hrly
              remove_column :metros, :minwage
              remove_column :metros, :income_hrly
              remove_column :metros, :income_pretax_hrly
              remove_column :metros, :poverty_hrly
  end

  def self.down
  	  	      add_column :states, :familycomposition, :string
              add_column :states, :familysize, :integer
              add_column :states, :house_cost, :integer
              add_column :states, :childcare_cost, :integer
              add_column :states, :health_cost, :integer
              add_column :states, :food_cost, :integer
              add_column :states, :trans_cost, :integer
              add_column :states, :other_cost, :integer
              add_column :states, :income, :integer
              add_column :states, :income_pretax, :integer
              add_column :states, :tax, :integer
              add_column :states, :poverty, :integer
              add_column :states, :minwage_hrly, :integer
              add_column :states, :minwage, :integer
              add_column :states, :income_hrly, :integer
              add_column :states, :income_pretax_hrly, :integer
              add_column :states, :poverty_hrly, :integer

              add_column :counties, :familycomposition, :string
              add_column :counties, :familysize, :integer
              add_column :counties, :house_cost, :integer
              add_column :counties, :childcare_cost, :integer
              add_column :counties, :health_cost, :integer
              add_column :counties, :food_cost, :integer
              add_column :counties, :trans_cost, :integer
              add_column :counties, :other_cost, :integer
              add_column :counties, :income, :integer
              add_column :counties, :income_pretax, :integer
              add_column :counties, :tax, :integer
              add_column :counties, :poverty, :integer
              add_column :counties, :minwage_hrly, :integer
              add_column :counties, :minwage, :integer
              add_column :counties, :income_hrly, :integer
              add_column :counties, :income_pretax_hrly, :integer
              add_column :counties, :poverty_hrly, :integer

  	          add_column :metros, :familycomposition, :string
              add_column :metros, :familysize, :integer
              add_column :metros, :house_cost, :integer
              add_column :metros, :childcare_cost, :integer
              add_column :metros, :health_cost, :integer
              add_column :metros, :food_cost, :integer
              add_column :metros, :trans_cost, :integer
              add_column :metros, :other_cost, :integer
              add_column :metros, :income, :integer
              add_column :metros, :income_pretax, :integer
              add_column :metros, :tax, :integer
              add_column :metros, :poverty, :integer
              add_column :metros, :minwage_hrly, :integer
              add_column :metros, :minwage, :integer
              add_column :metros, :income_hrly, :integer
              add_column :metros, :income_pretax_hrly, :integer
              add_column :metros, :poverty_hrly, :integer
  end
end
