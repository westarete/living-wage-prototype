class Metro < ActiveRecord::Base
	attr_accessible  :state_id,
                   :cbsa,
                   :cbsa_name,
                   :geography,
                   :familycomposition,
                   :familysize,
                   :house_cost,
                   :childcare_cost,
                   :health_cost,
                   :food_cost,
                   :trans_cost,
                   :other_cost,
                   :income,
                   :income_pretax,
                   :tax,
                   :poverty,
                   :minwage_hrly,
                   :minwage,
                   :income_hrly,
                   :income_pretax_hrly,
                   :poverty_hrly

  belongs_to :state
  has_and_belongs_to_many :counties

  validates :state_id, presence: true, numericality: { less_than_or_equal_to: 56, greater_than: 0 }
  validates :state_id,
                   :cbsa,
                   :cbsa_name,
                   :geography,
                   :familycomposition,
                   :familysize,
                   :house_cost,
                   :childcare_cost,
                   :health_cost,
                   :food_cost,
                   :trans_cost,
                   :other_cost,
                   :income,
                   :income_pretax,
                   :tax,
                   :poverty,
                   :minwage_hrly,
                   :minwage,
                   :income_hrly,
                   :income_pretax_hrly,
                   :poverty_hrly,
                    presence: true

end
