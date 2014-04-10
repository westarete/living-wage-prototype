class CountiesController < ApplicationController
  def index
    @counties = State.find_by_statefips(params[:state_id]).counties
  end

  def show
    @county = County.find_by_countyfips(params[:id])
  end
end