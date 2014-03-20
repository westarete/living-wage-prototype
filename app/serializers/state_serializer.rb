class StateSerializer < ActiveModel::Serializer
  attributes :id, :state_name, :statefips, :url

  has_many :aggregations, include: true
  has_many :metros, serializer: MetroShortSerializer
  has_many :counties, serializer: CountyShortSerializer

  def url
  	state_url(object)
  end

end
