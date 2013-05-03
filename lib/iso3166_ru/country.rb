module Iso3166Ru
  Country = Struct.new(:name, :full_name, :english, :alpha2, :alpha3, :iso,
    :location, :location_precise)

  module CountryFactory
    def self.build(country_config)
      Country.new(*country_config)
    end
  end
end
