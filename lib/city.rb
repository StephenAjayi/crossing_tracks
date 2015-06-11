class City

  attr_reader(:name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    cities = []
    found_cities = DB.exec("SELECT * FROM cities;")
    found_cities.each() do |found_city|
      name = found_city.fetch("name")
      cities.push(City.new(:name => "name"))
    end
    cities
  end
end
