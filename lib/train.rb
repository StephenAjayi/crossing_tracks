class Train

  attr_reader(:line)

  define_method(:initialize) do |attributes|
    @line = attributes.fetch(:line)
  end

  define_singleton_method(:all) do
    all_trains = DB.exec("SELECT * FROM trains;")
    trains = []
    all_trains.each do |train|
      line = train.fetch("line")
      trains.push(Train.new(:line => line))
    end
    trains
  end
end
