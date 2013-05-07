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
      k, q = prepare_query(query)
      countries[indexes[k][q]] rescue nil
    end

    
    private

    def prepare_query(query)
      key = query.keys.first
      value = key == :iso ? "%03d" % query[key].to_i : query[key]

      [key, value]
    end
  end
end
