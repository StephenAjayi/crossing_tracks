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

  define_method(:save) do
    DB.exec("INSERT INTO trains (line) VALUES ('#{@line}');")
  end

  define_method(:==) do |another_task|
    self.line().==(another_task.line())
  end
end
