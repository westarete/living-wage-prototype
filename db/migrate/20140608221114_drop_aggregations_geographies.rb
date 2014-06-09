class DropAggregationsGeographies < ActiveRecord::Migration
  def change
    drop_table :aggregations
    drop_table :geographies
  end

end
