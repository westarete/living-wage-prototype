class CountiesController < ApplicationController
  def index
    @geographies = County.all
  end

  def show
    @geography = County.find_by_countyfips(params[:id])
  end
end