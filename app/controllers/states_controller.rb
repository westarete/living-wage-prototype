class StatesController < ApplicationController
  def index
    @states = State.all
  end

  def show
    @state = State.find_by_statefips(params[:id])
  end
end