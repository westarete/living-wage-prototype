class Api::V1::StatesController < ApplicationController
	respond_to :json

  def index
    respond_with State.all
  end

  def show
    respond_with(State.find_by_statefips(params[:id]), :root => false)
  end
end
