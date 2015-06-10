class Train

  attr_reader(:line)

  define_method(:initialize) do |attributes|
    @line = attributes.fetch(:line)
  end
end
