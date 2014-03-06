class Api::V1::CountyController < ApplicationController
	respond_to :json

  def index
    respond_with County.all
  end

  def show
    respond_with County.find(params[:id])
  end
end
