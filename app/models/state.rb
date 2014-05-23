class State < ActiveRecord::Base
	attr_accessible :region_id,
                  :statefips,
              		:state_name

  has_many :metros
  has_many :counties
  has_many :aggregations, :as => :explainable
  has_many :occupations, :as => :explainable

  validates :statefips, presence: true, numericality: { less_than_or_equal_to: 56, greater_than: 0 }
  validates :state_name,
            :region_id,
             presence: true

  alias_attribute :name, :state_name
  alias_attribute :census_id, :statefips

  def coordinates
    Geocoder.search(state_name).first.coordinates
  end
  
end
