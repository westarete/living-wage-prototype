object @metro
attributes :id, :cbsa_name

child :aggregations do
  attributes :explainable_id,
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

child :state do
  attributes :state_name, :statefips
  node(:url) { '...' }
end
