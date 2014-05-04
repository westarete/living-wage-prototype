class Metro < ActiveRecord::Base
	attr_accessible  :state_id,
                   :cbsa,
                   :cbsa_name

  belongs_to :state
  has_many :aggregations, :as => :explainable
  has_and_belongs_to_many :counties

  validates :state_id, presence: true, numericality: { less_than_or_equal_to: 56, greater_than: 0 }
  validates :cbsa,
            :cbsa_name,
             presence: true

   alias_attribute :name, :cbsa_name
   alias_attribute :census_id, :cbsa

end
