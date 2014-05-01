collection @counties, :root => "counties"
attributes :countyname

node(:id) { |county| county.countyfips } 