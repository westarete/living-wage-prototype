class AggregationsController < ApplicationController
  def index
    @aggregations = Aggregation.all
  end

  def show
    @aggregation = Aggregation.find(params[:id])
  end
end