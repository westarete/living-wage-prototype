class MenuController < ApplicationController
  def index 
  end

  def show
    @state = State.find_by_statefips(params[:id])
  end

end
