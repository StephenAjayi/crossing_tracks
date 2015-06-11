class Stop

  attr_reader(:city_id)

  define_method(:initialize) do |attributes|
    @city_id = attributes.fetch(:city_id)
  end
end
