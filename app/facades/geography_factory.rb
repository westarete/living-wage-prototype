class GeographyFactory
    def self.geography(geography_type, census_id)
      geography_type = geography_type.downcase
      case geography_type 
      when 'metro'
        Metro.find(census_id)
      when 'state'
        State.find(census_id)
      when 'county'
        County.find(census_id)

    end
  end 
end