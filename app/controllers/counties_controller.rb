class CountiesController < ApplicationController
  def index
    @counties = County.all
  end

  def show
    @county = County.find_by_countyfips(params[:id])
  end
end