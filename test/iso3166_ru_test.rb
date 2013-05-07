# encoding: utf-8

require "minitest_helper"
require "iso3166_ru"

class Iso3166RuTest < MiniTest::Unit::TestCase
  RUSSIA = Iso3166Ru::Country.new("Россия", "Российская Федерация", 
    "Russian Federation", "RU", "RUS", "643", "Европа", "Восточная Европа")

  ANTARCTICA = Iso3166Ru::Country.new("Антарктида", "", "Antarctica", "AQ", "ATA", "010", "Антарктика", " ")

  def test_find_by_alpha2
    assert_equal RUSSIA, Iso3166Ru.find_by(alpha2: "RU")
  end

  def test_find_by_alpha3
    assert_equal RUSSIA, Iso3166Ru.find_by(alpha3: "RUS")
  end

  def test_find_by_name
    assert_equal RUSSIA, Iso3166Ru.find_by(name: "Россия")
  end

  def test_find_by_full_name
    assert_equal RUSSIA, Iso3166Ru.find_by(full_name: "Российская Федерация")
  end

  def test_find_by_english
    assert_equal RUSSIA, Iso3166Ru.find_by(english: "Russian Federation")
  end

  def test_find_by_iso
    assert_equal RUSSIA, Iso3166Ru.find_by(iso: "643")
    assert_equal ANTARCTICA, Iso3166Ru.find_by(iso: "010")
    assert_equal ANTARCTICA, Iso3166Ru.find_by(iso: 10)
  end
end
