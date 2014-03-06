class Api::V1::MetroController < ApplicationController
	respond_to :json

  def index
    respond_with Metro.all
  end

  def show
    respond_with Metro.find(params[:id])
  end
end
