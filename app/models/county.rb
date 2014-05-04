class County < ActiveRecord::Base
  attr_accessible  :state_id,
                   :countyfips,
                   :countyname

  belongs_to :state
  has_and_belongs_to_many :metros
  has_many :aggregations, :as => :explainable
  
  validates :state_id, presence: true, numericality: { less_than_or_equal_to: 56, greater_than: 0 }
  validates  :countyfips,
             :countyname, presence: true

  alias_attribute :name, :countyname
  alias_attribute :census_id, :countyfips
  
end
