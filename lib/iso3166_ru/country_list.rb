require "iso3166_ru/country"

module Iso3166Ru
  class CountryList
    attr_reader :data, :countries, :indexes

    def initialize
      File.open(File.expand_path("../data.dat", __FILE__)) do |f|
        @data = Marshal.load(f)
      end

      @countries = data[0]
      @indexes   = data[1]
    end

    def find_by(query)
      k = query.keys[0]
      q = query[k]
      countries[indexes[k][q]]
    end
  end
end
