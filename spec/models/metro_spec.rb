require 'spec_helper'

describe Metro do

  before { @metro = Metro.new( region_id: 1,
                               statefips: 1,
                               state_name: "Alabama",
                               geography: "State",
                               familycomposition: "2A1LF0C",
                               familysize: 2,
                               house_cost: 6626,
                               childcare_cost: 0,
                               health_cost: 4560,
                               food_cost: 5381,
                               trans_cost: 8693,
                               other_cost: 4201,
                               income: 29460,
                               income_pretax: 24888,
                               tax: 4572,
                               poverty: 14937,
                               minwage_hrly: 7.25,
                               minwage: 15080,
                               income_hrly: 14.16,
                               income_pretax_hrly: 14.16,
                               poverty_hrly: 7.1799998
                       ) }

  subject { @metro }

  it { should be_valid }
end
