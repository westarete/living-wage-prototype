class DropMetros < ActiveRecord::Migration
  def change
    drop_table :metros
  end
end
