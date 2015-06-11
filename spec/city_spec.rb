require('spec_helper')

describe(City) do
  describe('#name') do
    it('returns the name of an instance of city') do
      test_city = City.new(:name => "Portland")
      expect(test_city.name()).to(eq("Portland"))
    end
  end

  describe(".all") do
    it('returns all saved instances of City in an array, it starts out empty at first') do
      expect(City.all()).to(eq([]))
    end
  end

  describe("#save") do
    it('saves an instance of City to an array') do
      test_city = City.new(:name => "Boston")
      test_city.save()
      expect(City.all()).to(eq([test_city]))
    end
  end

  describe('#==') do
    it('evaluates two instances of City as equal if they have the same name') do
      test_city = City.new(:name => "Denver")
      test_city2 = City.new(:name => "Denver")
      expect(test_city).to(eq(test_city2))
    end
  end
end
