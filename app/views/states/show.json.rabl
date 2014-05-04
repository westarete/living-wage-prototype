object @geography
attributes :geography_name

node(:id) { |geography| geography.census_id } 

child :metros do
  attributes :cbsa, :cbsa_name
end

child :counties do
  attributes :countyfips, :countyname
end