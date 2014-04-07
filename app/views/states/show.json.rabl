object @state
attributes :state_name

node(:id) { |state| state.statefips } 

node :links do |state|
  { :aggregations =>  "/states/#{state.statefips}/aggregations",
    :metros => "/states/#{state.statefips}/metros",
    :counties => "/states/#{state.statefips}/counties"
  } 
end