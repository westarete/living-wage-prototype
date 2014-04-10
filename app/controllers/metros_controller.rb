class MetrosController < ApplicationController
  def index
    @metros = State.find_by_statefips(params[:state_id]).metros
  end

  def show
    @metro = Metro.find_by_cbsa(params[:id])
  end
end