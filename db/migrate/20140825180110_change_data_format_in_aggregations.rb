class ChangeDataFormatInAggregations < ActiveRecord::Migration
  def up
    change_column :aggregations, :house_cost, :decimal, :precision => 10
    change_column :aggregations, :childcare_cost, :decimal, :precision => 10
    change_column :aggregations, :health_cost, :decimal, :precision => 10
    change_column :aggregations, :food_cost, :decimal, :precision => 10
    change_column :aggregations, :trans_cost, :decimal, :precision => 10
    change_column :aggregations, :other_cost, :decimal, :precision => 10
    change_column :aggregations, :income, :decimal, :precision => 10
    change_column :aggregations, :income_pretax, :decimal, :precision => 10
    change_column :aggregations, :tax, :decimal, :precision => 10
    change_column :aggregations, :poverty, :decimal, :precision => 10
    change_column :aggregations, :minwage_hrly, :decimal, :precision => 10
    change_column :aggregations, :minwage, :decimal, :precision => 10
    change_column :aggregations, :income_hrly, :decimal, :precision => 10
    change_column :aggregations, :income_pretax_hrly, :decimal, :precision => 10
end

  def down
    change_column :aggregations, :house_cost, :integer
    change_column :aggregations, :childcare_cost, :integer
    change_column :aggregations, :health_cost, :integer
    change_column :aggregations, :food_cost, :integer
    change_column :aggregations, :trans_cost, :integer
    change_column :aggregations, :other_cost, :integer
    change_column :aggregations, :income, :integer
    change_column :aggregations, :income_pretax, :integer
    change_column :aggregations, :tax, :integer
    change_column :aggregations, :poverty, :integer
    change_column :aggregations, :minwage_hrly, :integer
    change_column :aggregations, :minwage, :integer
    change_column :aggregations, :income_hrly, :integer
    change_column :aggregations, :income_pretax_hrly, :integer
  end
end
