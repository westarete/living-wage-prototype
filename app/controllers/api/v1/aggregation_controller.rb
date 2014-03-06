class Api::V1::AggregationController < ApplicationController
	respond_to :json

  def index
    respond_with Aggregation.all
  end

  def show
    respond_with Aggregation.find(params[:id])
  end
end
