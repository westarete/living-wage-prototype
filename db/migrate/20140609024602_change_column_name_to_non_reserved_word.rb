class ChangeColumnNameToNonReservedWord < ActiveRecord::Migration
  def change
    rename_column(:geographies, :type, :geography_type)
  end
end
