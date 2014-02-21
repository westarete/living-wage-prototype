require 'spec_helper'

describe County do

  before { @county = County.new( state_id: 13,
                                 countyfips: 17980,
                                 countyname: "Columbus",
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

  subject { @county }

  it { should be_valid }

  describe "when state_id is not present" do
    before { @county.state_id = " " }
    it { should_not be_valid }
  end

  describe "when state_id is not a correct id" do
    before { @county.state_id = 57 }
    it { should_not be_valid }
  end

  describe "when countyfips is not present" do
    before { @county.countyfips = nil }
    it { should_not be_valid }
  end

  describe "when countyname is not present" do
    before { @county.countyname = " " }
    it { should_not be_valid }
  end

  describe "when geography is not present" do
    before { @county.geography = " " }
    it { should_not be_valid }
  end

  describe "when familycomposition is not present" do
    before { @county.familycomposition = " " }
    it { should_not be_valid }
  end

  describe "when familysize is not present" do
    before { @county.familysize = " " }
    it { should_not be_valid }
  end  

  describe "when house_cost is not present" do
    before { @county.house_cost = " " }
    it { should_not be_valid }
  end  

  describe "when childcare_cost is not present" do
    before { @county.childcare_cost = " " }
    it { should_not be_valid }
  end  

  describe "when health_cost is not present" do
    before { @county.health_cost = " " }
    it { should_not be_valid }
  end  

  describe "when food_cost is not present" do
    before { @county.food_cost = " " }
    it { should_not be_valid }
  end  

  describe "when trans_cost is not present" do
    before { @county.trans_cost = " " }
    it { should_not be_valid }
  end  

  describe "when other_cost is not present" do
    before { @county.other_cost = " " }
    it { should_not be_valid }
  end  

  describe "when income is not present" do
    before { @county.income = " " }
    it { should_not be_valid }
  end  

  describe "when income_pretax is not present" do
    before { @county.income_pretax = " " }
    it { should_not be_valid }
  end  

  describe "when tax is not present" do
    before { @county.tax = " " }
    it { should_not be_valid }
  end  

  describe "when poverty is not present" do
    before { @county.poverty = " " }
    it { should_not be_valid }
  end  

  describe "when minwage_hrly is not present" do
    before { @county.minwage_hrly = " " }
    it { should_not be_valid }
  end  

  describe "when minwage is not present" do
    before { @county.minwage = " " }
    it { should_not be_valid }
  end  

  describe "when income_hrly is not present" do
    before { @county.income_hrly = " " }
    it { should_not be_valid }
  end  

  describe "when income_pretax_hrly is not present" do
    before { @county.income_pretax_hrly = " " }
    it { should_not be_valid }
  end  

  describe "when poverty_hrly is not present" do
    before { @county.poverty_hrly = " " }
    it { should_not be_valid }
  end  
end
