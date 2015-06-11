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
end
