class CreateMetrosCountiesJoinTable < ActiveRecord::Migration
  def change
   create_table :metros_counties do |t|
      t.belongs_to :metro
      t.belongs_to :county
    end

    add_index :metros_counties, [:metro_id, :county_id]
  end
end
