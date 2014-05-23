class StatesController < ApplicationController

  autocomplete :geography, :name, :extra_data => [:census_id, :geography_type]

  def index
    @geography = State.all
  end

  def show
    @geography = State.find_by_statefips(params[:id])
    gon.contributions = @geography.aggregations.select("familycomposition, house_cost, childcare_cost, health_cost, food_cost, trans_cost, other_cost")
    gon.coordinates = @geography.coordinates
  end
end