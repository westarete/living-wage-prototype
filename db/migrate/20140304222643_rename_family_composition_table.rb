class RenameFamilyCompositionTable < ActiveRecord::Migration
  def change
  	rename_table :family_compositions, :aggregations
  end
end
