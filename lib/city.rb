class City

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    cities = []
    found_cities = DB.exec("SELECT * FROM cities;")
    found_cities.each() do |found_city|
      name = found_city.fetch("name")
      cities.push(City.new(:name => name))
    end
    cities
  end

  define_method(:save) do
    saved_city = DB.exec("INSERT INTO cities (name) VALUES ('#{@name}') RETURNING id;")
    @id = saved_city.first.fetch("id").to_i()
  end

  define_method(:==) do |another_city|
    self.name().==(another_city.name())
  end

  define_singleton_method(:find) do |id|
    found_city = nil
    city = DB.exec("SELECT * FROM cities WHERE id = #{id}")
    name = city.first().fetch("name")
    id = city.first().fetch("id")
    found_city = City.new(:name => name, :id => id)
  end

  define_method(:delete) do
    city_to_delete = DB.exec("DELETE FROM cities * WHERE id = #{@id};")
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    city_to_update = DB.exec("UPDATE cities SET name = '#{@name}' WHERE id = #{@id} RETURNING name;")
  end
end
