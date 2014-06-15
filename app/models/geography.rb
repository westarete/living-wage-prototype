class Geography < ActiveRecord::Base
  attr_accessible :census_id, :name, :geography_type
  # self.abstract_class = true
  def full_name
    "#{self.name}, #{get_related_geography_name} (#{self.geography_type.camelize})" 
  end

  private 
    def get_related_geography_name
      "" if  self.geography_type == "state"
      Metro.find(self.census_id).state.name if self.geography_type == "metro"
      County.find(self.census_id).state.name if self.geography_type == "county"
    end
end
