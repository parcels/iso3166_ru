require "iso3166_ru/country"

module Iso3166Ru
  class CountryList
    attr_reader :countries

    def initialize
      File.open(File.expand_path("../data.dat", __FILE__)) do |f|
        @countries = Marshal.load(f)
      end
    end

    def find_by(source_query)
      query = source_query.to_a.flatten
      countries.select { |e| e.send(query[0]) == query[1] }.first
    end
  end
end
