object @state
attributes :state_name

node(:id) { |state| state.statefips } 

node :links do |state|
  { :metros => "/states/#{state.statefips}/metros",
    :aggregations =>  "/states/#{state.statefips}/aggregations",
    :counties => "/states/#{state.statefips}/counties"
  } 
end