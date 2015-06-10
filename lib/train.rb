class Train

  attr_reader(:line,:id)

  define_method(:initialize) do |attributes|
    @line = attributes.fetch(:line)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    all_trains = DB.exec("SELECT * FROM trains;")
    trains = []
    all_trains.each do |train|
      line = train.fetch("line")
      id = train.fetch("id").to_i()
      trains.push(Train.new(:line => line, :id => id))
    end
    trains
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO trains (line) VALUES ('#{@line}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_task|
    self.line().==(another_task.line())
  end
end
