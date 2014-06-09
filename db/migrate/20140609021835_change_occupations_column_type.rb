class ChangeOccupationsColumnType < ActiveRecord::Migration
  def change
    change_column(:occupations, :explainable_type, :string)
    remove_column(:occupations, :geography)
  end
end
