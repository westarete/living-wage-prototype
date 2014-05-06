class MetrosController < ApplicationController
  def index
    @geographies = Metro.all
  end

  def show
    @geography = Metro.find_by_cbsa(params[:id])
    gon.contributions = @geography.aggregations.select("familycomposition, house_cost, childcare_cost, health_cost, food_cost, trans_cost, other_cost")
  end
end