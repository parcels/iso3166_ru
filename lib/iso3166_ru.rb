require "iso3166_ru/version"
require "iso3166_ru/country_list"

module Iso3166Ru
  def self.find_by(query)
    CountryList.new.find_by(query)
  end
end
