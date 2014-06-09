class State < ActiveRecord::Base
	attr_accessible :census_id,
                  :name

  has_many :metros
  has_many :counties
  has_many :aggregations, :as => :explainable
  has_many :occupations, :as => :explainable

  validates :census_id, presence: true, numericality: { less_than_or_equal_to: 56, greater_than: 0 }
  validates :name,
             presence: true

  def coordinates
    Geocoder.search(state_name).first.coordinates
  end
  
end
