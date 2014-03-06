class StateSerializer < ActiveModel::Serializer
  attributes :id, :state_name, :statefips
end
