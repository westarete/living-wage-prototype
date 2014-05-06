class StatesController < ApplicationController
  def index
    @geography = State.all
  end

  def show
    @geography = State.find_by_statefips(params[:id])
    gon.contributions = @geography.aggregations.select("familycomposition, house_cost, childcare_cost, health_cost, food_cost, trans_cost, other_cost")

  end
end