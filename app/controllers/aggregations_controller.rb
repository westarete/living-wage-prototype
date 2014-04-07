class AggregationsController < ApplicationController
  def index
  	@aggregations = State.find_by_statefips(params[:state_id]).aggregations
  end

  def show
    @aggregation = Aggregation.find(params[:id])
  end
end