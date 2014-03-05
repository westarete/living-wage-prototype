class ChangeStatesColumnTypeForRegion < ActiveRecord::Migration
  def self.up
  	change_column :states, :region_id, :string
  end

  def self.down
  	change_column :states, :region_id, :integer
  end
end
