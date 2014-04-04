object @state

node :state do |u|
  { :id => u.statefips, 
    :state_name => u.state_name, 
    :aggregations => u.aggregations.map { |a| a.id },
    :metros => u.metros.map { |a| a.cbsa },
    :counties => u.counties.map { |a| a.countyfips }
  } 
end

child :aggregations, :object_root => false do
  attributes  :id,
              :explainable_id,
              :explainable_type,
              :familycomposition,
              :familysize,
              :house_cost,
              :childcare_cost,
              :health_cost,
              :food_cost,
              :trans_cost,
              :other_cost,
              :income,
              :income_pretax,
              :tax,
              :poverty,
              :minwage_hrly,
              :minwage,
              :income_hrly,
              :income_pretax_hrly,
              :poverty_hrly
end


child :metros, :object_root => false do
  attributes :cbsa => :id, :cbsa_name => :cbsa_name
end

child :counties, :object_root => false do
  attributes :countyfips => :id, :countyname => :countyname
end