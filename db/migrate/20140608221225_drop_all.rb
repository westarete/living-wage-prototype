class DropAll < ActiveRecord::Migration
  def change
    drop_table :counties_metros
    drop_table :metros_counties
    drop_table :occupations
    drop_table :users
  end
end
