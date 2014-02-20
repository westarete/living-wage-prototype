class State < ActiveRecord::Base
	attr_accessible :region_id,
                  :statefips,
              		:state_name,
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

  has_many :metros
  has_many :counties

  validates :region_id, presence: true, numericality: { less_than_or_equal_to: 4, greater_than: 0 }
  validates :statefips, presence: true, numericality: { less_than_or_equal_to: 56, greater_than: 0 }
  validates :state_name,
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
