class Api::V1::StateController < ApplicationController
	respond_to :json

  def index
    respond_with State.all
  end

  def show
    respond_with State.find(params[:id])
  end
end
