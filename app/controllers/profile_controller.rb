class ProfileController < ApplicationController
  def index
    @states = State.all
  end
end
