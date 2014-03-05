class ChangeStatesColumnType < ActiveRecord::Migration
  def self.up
  	change_column :states, :state_name, :string
  end

  def self.down
  	change_column :states, :state_name, :integer
  end
end
