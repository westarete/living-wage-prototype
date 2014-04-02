class MetrosController < ApplicationController
  def index
    @metros = Metro.all
  end

  def show
    @metro = Metro.find_by_cbsa(params[:id])
  end
end