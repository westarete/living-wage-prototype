# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

def states
  CSV.foreach('db/fixtures/LW_Alldata_2814.csv', headers: true) do |row|

    region_id = row['censusregion']
    statefips = row['statefips']
    state_name = row['state']

    # begin
    #   record = State.find()
    # rescue ActiveRecord::RecordNotFound

    record = State.find_by_statefips(statefips)

    if record.nil?
      record = State.create( region_id: region_id,
                             statefips: statefips,
                             state_name: state_name)
      puts record.inspect
    end
  end
end

def counties
  CSV.foreach('db/fixtures/LW_Alldata_2814.csv', headers: true) do |row|

    region_id = row['censusregion']
    statefips = row['statefips']
    state_name = row['state']

    # begin
    #   record = State.find()
    # rescue ActiveRecord::RecordNotFound

    # Active Record retuns .where methods as arrays because it's possible it's a list. must use .first

    if geography == "County"
      record = State.where(statefips: statefips).where(familycomposition: familycomposition)
      record = State.counties.create( region_id: region_id,
                             statefips: statefips,
                             state_name: state_name)
    # ensure
      puts record.inspect
    end
  end
end

states