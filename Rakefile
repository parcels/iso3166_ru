$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require "bundler/gem_tasks"
require "rake/testtask"

require "net/http"

require "iso3166_ru/country"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb', 'test/*/*_test.rb']
end

namespace :countries do
  task :update do
    doc       = Net::HTTP.get("www.artlebedev.ru", "/tools/country-list/tab/").force_encoding("UTF-8")
    raw_data  = doc.split("\n")[1..-1].map { |c| c.split("\t") }
    countries = raw_data.reduce([]) { |a, e| a << Iso3166Ru::CountryFactory.build(e) }
    
    indexes   = Iso3166Ru::Country.members.reduce({}) { |a, e| a.merge(e => {}) }
    a = []
    countries.each_with_index do |e, i|
      Iso3166Ru::Country.members.each do |k|
        indexes[k] = indexes[k].merge({e[k] => i})
      end
    end

    File.open(File.expand_path("../lib/iso3166_ru/data.dat", __FILE__), "w") do |f|
      f.write Marshal.dump([countries, indexes])
    end
  end
end

task :default => :test
