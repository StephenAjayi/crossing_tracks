class Stop

  attr_reader(:city_id, :train_id)

  define_method(:initialize) do |attributes|
    @city_id = attributes.fetch(:city_id)
    @train_id = attributes.fetch(:train_id)
  end
end
