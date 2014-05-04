class MetrosController < ApplicationController
  def index
    @geographies = Metro.all
  end

  def show
    @geography = Metro.find_by_cbsa(params[:id])
  end
end