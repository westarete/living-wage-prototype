class CreateCountiesMetrosJoinTable < ActiveRecord::Migration
  def change
  	create_table :counties_metros do |t|
      t.belongs_to :county
      t.belongs_to :metro
    end

    add_index :counties_metros, [:county_id, :metro_id]

  end

end
