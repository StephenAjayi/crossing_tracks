require('spec_helper')

describe(City) do
  describe('#name') do
    it('returns the name of an instance of city') do
      test_city = City.new(:name => "Portland", :id => nil)
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
      test_city = City.new(:name => "Boston", :id => nil )
      test_city.save()
      expect(City.all()).to(eq([test_city]))
    end
  end

  describe('#==') do
    it('evaluates two instances of City as equal if they have the same name') do
      test_city = City.new(:name => "Denver", :id => nil)
      test_city2 = City.new(:name => "Denver", :id => nil)
      expect(test_city).to(eq(test_city2))
    end
  end

  describe('#id') do
    it("ascribes an instance of City an id number") do
      test_city = City.new(:name => "Seattle", :id => nil)
      test_city.save()
      expect(test_city.id).to(be_an_instance_of(Fixnum))
    end
  end
end
