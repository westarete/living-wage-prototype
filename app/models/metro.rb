class Metro < ActiveRecord::Base
	attr_accessible  :state_id,
                   :name,
                   :census_id

  belongs_to :state
  has_many :aggregations, :as => :explainable
  has_many :occupations, :as => :explainable
  has_and_belongs_to_many :counties

  validates :state_id, presence: true, numericality: { less_than_or_equal_to: 56, greater_than: 0 }
  validates :name,
            :census_id,
             presence: true

  def coordinates
    Geocoder.search(cbsa_name).first.coordinates
  end

end
