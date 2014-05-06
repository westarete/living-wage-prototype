class CountiesController < ApplicationController
  def index
    @geographies = County.all
  end

  def show
    @geography = County.find_by_countyfips(params[:id])
    gon.contributions = @geography.aggregations.select("familycomposition, house_cost, childcare_cost, health_cost, food_cost, trans_cost, other_cost")
  end
end