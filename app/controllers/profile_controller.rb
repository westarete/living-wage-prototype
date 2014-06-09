class ProfileController < ApplicationController

  autocomplete :geography, :name, :extra_data => [:census_id, :geography_type]
  before_filter :set_geography, only: :show

  def index
    @geography = State.first
    @geography.name = "National Landscape"
  end

  def show
    gon.contributions = @geography.aggregations.select("familycomposition, house_cost, childcare_cost, health_cost, food_cost, trans_cost, other_cost, minwage_hrly, income_hrly, poverty_hrly, income")
    gon.occupations = @geography.occupations.order("OCC_SALARY DESC");
  end

  private 
  def set_geography
    @geography = State.find(params[:id]) if params[:type] == "State"
    @geography = Metro.find(params[:id]) if params[:type] == "Metro"
    @geography = County.find(params[:id]) if params[:type] == "County"
  end
end
