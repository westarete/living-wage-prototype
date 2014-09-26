class ProfileController < ApplicationController

  autocomplete :geography, :name, :display_value => :full_name, :extra_data => [:geography_type, :census_id], :full => true
  before_filter :set_geography, :only => [:show]

  def index
    @contact = Contact.new

    @geography = State.first
    @geography.name = "National Landscape"
  end

  def show
    @contact = Contact.new

    gon.contributions = @geography.aggregations.select("familycomposition, house_cost, childcare_cost, health_cost, food_cost, trans_cost, other_cost, minwage_hrly, income_pretax_hrly, poverty_hrly, income, tax, income_hrly")
    gon.occupations = @geography.occupations.order("OCC_SALARY ASC");
    gon.census_id = @geography.id
    gon.census_type = @geography.class.name.downcase
    
    respond_to do |format|
      format.html
      format.csv { render text: @geography.to_csv }
    end
  end

  def update
    @geography = GeographyFactory.geography(params[:geography][:geography_type].to_s, 
                                            params[:geography][:census_id])

    case @geography.class.name.downcase.to_s
    when 'metro'
      redirect_to metro_path(@geography)
    when 'state'
      redirect_to state_path(@geography)
    when 'county'
      redirect_to county_path(@geography)
    end
  end

  private 
    def set_geography
      @geography = GeographyFactory.geography(params[:type], params[:id])
    end
end
