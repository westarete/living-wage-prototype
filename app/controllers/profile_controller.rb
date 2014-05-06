class ProfileController < ApplicationController
  def index
    @geography = State.first
    @geography.name = "National Landscape"
  end
end
