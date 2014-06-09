class County < ActiveRecord::Base
  attr_accessible  :state_id,
                   :census_id,
                   :name

  belongs_to :state
  has_and_belongs_to_many :metros
  has_many :aggregations, :as => :explainable
  has_many :occupations, :as => :explainable
  
  validates :state_id, presence: true, numericality: { less_than_or_equal_to: 56, greater_than: 0 }
  validates  :census_id,
             :name, presence: true

  def coordinates
    Geocoder.search(countyname).first.coordinates
  end

end
