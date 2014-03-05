class AddAssocationsOnAggregations < ActiveRecord::Migration
  def self.up
  	change_table :aggregations do |t|
  		t.references :explainable, :polymorphic => true
  	end
  end

  def down
  	change_table :aggregations do |t|
  		t.remove_references :explainable, :polymorphic => true
  	end
  end
end
