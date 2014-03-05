class Metro < ActiveRecord::Base
	attr_accessible  :state_id,
                   :cbsa,
                   :cbsa_name,
                   :geography

  belongs_to :state
  has_many :aggregations, :as => :explainable
  has_and_belongs_to_many :counties

  validates :state_id, presence: true, numericality: { less_than_or_equal_to: 56, greater_than: 0 }
  validates :state_id,
            :cbsa,
            :cbsa_name,
            :geography,
             presence: true

end
