object @aggregation

node :aggregation do |u|
  { :id => u.id,
    :explainable_id => u.explainable_id,
    :explainable_type => u.explainable_type,
    :familycomposition => u.familycomposition,
    :familysize => u.familysize,
    :house_cost => u.house_cost,
    :childcare_cost => u.childcare_cost,
    :health_cost => u.health_cost,
    :food_cost => u.food_cost,
    :trans_cost => u.trans_cost,
    :other_cost => u.other_cost,
    :income => u.income,
    :income_pretax => u.income_pretax,
    :tax => u.tax,
    :poverty => u.poverty,
    :minwage_hrly => u.minwage_hrly,
    :minwage => u.minwage,
    :income_hrly => u.income_hrly,
    :income_pretax_hrly => u.income_pretax_hrly,
    :poverty_hrl => u.poverty_hrly
  } 
end