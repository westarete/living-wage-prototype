class ProfileController < ApplicationController
  def index
    @states = State.all
    gon.states = State.all
  end
end
