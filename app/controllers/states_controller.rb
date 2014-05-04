class StatesController < ApplicationController
  def index
    @geography = State.all
  end

  def show
    @geography = State.find_by_statefips(params[:id])
    gon.geography = @geography.aggregations
  end
end