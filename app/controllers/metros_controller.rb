class MetrosController < ApplicationController

  autocomplete :geography, :name, :extra_data => [:census_id, :geography_type]

  def index
    @geographies = Metro.all
  end

  def show
    @geography = Metro.find(params[:id])
    gon.contributions = @geography.aggregations.select("familycomposition, house_cost, childcare_cost, health_cost, food_cost, trans_cost, other_cost, minwage_hrly, income_hrly, poverty_hrly, income")
    gon.occupations = @geography.occupations.order("OCC_SALARY DESC");

    # gon.coordinates = @geography.coordinates
  end
end