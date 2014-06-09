class ApplicationController < ActionController::Base

  def index
  end

  def show
  end

  def form
  end

before_filter :get_menu_items
  def get_menu_items
      @states = State.all
     
  end

end
