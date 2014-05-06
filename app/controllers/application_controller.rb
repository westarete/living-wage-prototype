class ApplicationController < ActionController::Base

  def index

  end

  def show

  end

  def form
    @state = State.find_by_state_name(params[:id].titleize)
    if @state 
      redirect_to state_path(@state)
    else
      redirect_to root_path
    end
  end

before_filter :get_menu_items
  def get_menu_items
      @states = State.all
     
  end

end
