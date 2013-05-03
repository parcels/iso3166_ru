# ISO 3166-1 Country List in English and Russian

[![Build Status](https://travis-ci.org/artemshitov/iso3166_ru.png?branch=master)](https://travis-ci.org/artemshitov/iso3166_ru)[![Code Climate](https://codeclimate.com/github/artemshitov/iso3166_ru.png)](https://codeclimate.com/github/artemshitov/iso3166_ru)

## Installation

Add this line to your application's Gemfile:

    gem 'iso3166_ru'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iso3166_ru

## Usage

### Simple ActiveRecord-alike finders

    Iso3166Ru.find_by(alpha2: "RU")
    Iso3166Ru.find_by(alpha3: "RUS")
    Iso3166Ru.find_by(name: "Россия")
    Iso3166Ru.find_by(full_name: "Российская Федерация")
    Iso3166Ru.find_by(english: "Russian Federation")
    Iso3166Ru.find_by(iso: "643")

### Performant finding

If you don't want to load country data for each request, you can initialize `Iso3166Ru::CountryList` and use it:

    country_list = Iso3166Ru::CountryList.new

    country_list.find_by(alpha2: "RU")
    country_list.find_by(alpha3: "RUS")
    country_list.find_by(name: "Россия")
    country_list.find_by(full_name: "Российская Федерация")
    country_list.find_by(english: "Russian Federation")
    country_list.find_by(iso: "643")

All finders return an `Iso3166Ru::Country` struct.

### Country

    country = Iso3166Ru.find_by(alpha2: "RU")

    country.alpha2             #=> "RU"
    country.alpha3             #=> "RUS"
    country.name               #=> "Россия"
    country.full_name          #=> "Российская Федерация"
    country.english            #=> "Russian Federation"
    country.iso                #=> "643"
    country.location           #=> "Европа"
    country.location_precise   #=> "Восточная Европа"


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
