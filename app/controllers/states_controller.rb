class StatesController < ApplicationController
  def index
    @states = State.all
  end

  def show
    @state = State.find_by_statefips(params[:id])
    gon.state = @state.aggregations
  end
end