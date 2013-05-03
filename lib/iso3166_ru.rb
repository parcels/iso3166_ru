require "iso3166_ru/version"
require "iso3166_ru/country"

module Iso3166Ru
  def self.find_by(query)
    countries = File.open(File.expand_path("../iso3166_ru/data/countries.dat", __FILE__)) { |f| Marshal.load f }
    query = query.to_a.flatten
    countries.select { |e| e.send(query[0]) == query[1] }.first
  end
end
