class ChangePolyTypeForAggregations < ActiveRecord::Migration
  def change
    change_column(:aggregations, :explainable_type, :string)
  end
end
