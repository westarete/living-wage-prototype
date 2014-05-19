class CreateOccupations < ActiveRecord::Migration
  def change
    create_table :occupations do |t|
      t.string :occ_type
      t.integer :occ_salary
      t.string :geography
      t.references :explainable, :polymorphic => true
    end
  end
end
