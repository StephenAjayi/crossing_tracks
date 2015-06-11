class Train

  attr_reader(:line, :id)

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
    self.line().==(another_task.line()).&(self.id().==(another_task.id()))
  end

  define_singleton_method(:find) do |id|
    found_train = nil
    train = DB.exec("SELECT * FROM trains WHERE id = #{id};")
    line = train.first.fetch("line")
    id = train.first.fetch("id").to_i()
    found_train = Train.new(:line => line, :id => id)
  end

  define_method(:delete) do
    id = self.id()
    train_to_delete = DB.exec("DELETE FROM trains * WHERE id = #{@id};")
  end

  define_method(:update) do |updated_line|
    train_to_update = DB.exec("UPDATE trains SET line = '#{updated_line}' WHERE id = #{@id} RETURNING line;")
    @line = train_to_update.first().fetch("line")
  end
end
