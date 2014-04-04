collection @states, :root => "states"
attributes :state_name

node(:id) { |state| state.statefips }