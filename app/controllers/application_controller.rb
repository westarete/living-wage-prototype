class ApplicationController < ActionController::Base
  def index
  	gon.states = State.all.uniq.map { |s| [s.state_name, s.statefips]  }
  end

  def show
  end
end
