class ApplicationController < ActionController::Base
  def index
  	gon.states = State.all.uniq.map { |s| s.state_name  }
  	gon.familycompositions = State.first.aggregations.uniq.map { |a| a.familycomposition }
  end

  def show
  end
end
