class Api::V1::CountiesController < ApplicationController
	respond_to :json

  def index
    respond_with County.all
  end

  def show
    respond_with County.find_by_countyfips(params[:id])
  end
end
