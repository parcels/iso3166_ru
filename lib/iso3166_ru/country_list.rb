require "iso3166_ru/country"
require 'singleton'

module Iso3166Ru
  class CountryList
    include Singleton
    
    attr_reader :countries, :indexes

    def initialize
      File.open(File.expand_path("../data.dat", __FILE__)) do |f|
        @countries, @indexes = Marshal.load(f)
      end
    end

    def find_by(query)
      k, q = prepare_query(query)
      countries[indexes[k][q]] rescue nil
    end

    
    private

    def prepare_query(query)
      key, value = query.first
      value = "%03d" % value.to_i if key == :iso

      [key, value]
    end
  end
end
