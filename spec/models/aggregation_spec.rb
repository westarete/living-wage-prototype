require 'spec_helper'

describe Aggregation do

  before { @aggregation = Aggregation.new( explainable_id: "1",
                         explainable_type: "State",
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

  subject { @aggregation }

  it { should be_valid }

  describe "when familycomposition is not present" do
    before { @aggregation.familycomposition = " " }
    it { should_not be_valid }
  end

  describe "when familysize is not present" do
    before { @aggregation.familysize = " " }
    it { should_not be_valid }
  end  

  describe "when house_cost is not present" do
    before { @aggregation.house_cost = " " }
    it { should_not be_valid }
  end  

  describe "when childcare_cost is not present" do
    before { @aggregation.childcare_cost = " " }
    it { should_not be_valid }
  end  

  describe "when health_cost is not present" do
    before { @aggregation.health_cost = " " }
    it { should_not be_valid }
  end  

  describe "when food_cost is not present" do
    before { @aggregation.food_cost = " " }
    it { should_not be_valid }
  end  

  describe "when trans_cost is not present" do
    before { @aggregation.trans_cost = " " }
    it { should_not be_valid }
  end  

  describe "when other_cost is not present" do
    before { @aggregation.other_cost = " " }
    it { should_not be_valid }
  end  

  describe "when income is not present" do
    before { @aggregation.income = " " }
    it { should_not be_valid }
  end  

  describe "when income_pretax is not present" do
    before { @aggregation.income_pretax = " " }
    it { should_not be_valid }
  end  

  describe "when tax is not present" do
    before { @aggregation.tax = " " }
    it { should_not be_valid }
  end  

  describe "when poverty is not present" do
    before { @aggregation.poverty = " " }
    it { should_not be_valid }
  end  

  describe "when minwage_hrly is not present" do
    before { @aggregation.minwage_hrly = " " }
    it { should_not be_valid }
  end  

  describe "when minwage is not present" do
    before { @aggregation.minwage = " " }
    it { should_not be_valid }
  end  

  describe "when income_hrly is not present" do
    before { @aggregation.income_hrly = " " }
    it { should_not be_valid }
  end  

  describe "when income_pretax_hrly is not present" do
    before { @aggregation.income_pretax_hrly = " " }
    it { should_not be_valid }
  end  

  describe "when poverty_hrly is not present" do
    before { @aggregation.poverty_hrly = " " }
    it { should_not be_valid }
  end  
end
