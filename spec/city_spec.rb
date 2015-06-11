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

  describe('.find') do
    it("returns an instance of City by it's id") do
      test_city = City.new(:name => "Miami")
      test_city.save()
      test_city2 = City.new(:name => "Los Angles")
      test_city.save()
      expect(City.find(test_city.id())).to(eq(test_city))
    end
  end

  describe('delete') do
    it('removes an instance of City from an array of saved instances') do
      test_city = City.new(:name => "Portland", :id => nil)
      test_city.save()
      test_city2 = City.new(:name => "Salem", :id => nil)
      test_city2.save()
      test_city.delete
      expect(City.all()).to(eq([test_city2]))
    end
  end

  describe('#update') do
    it('updates the name of an instance of City') do
      test_city = City.new(:name => "Portland", :id => nil)
      test_city.save()
      test_city.update(:name => "Boston")
      expect(test_city.name()).to(eq("Boston"))
    end


    it('lets you add a train to a city') do
      test_city = City.new(:name => "Portland", :id => nil)
      test_city.save()
      test_train = Train.new(:line => "Red", :id => nil)
      test_train.save()
      test_train2 = Train.new(:line =>"Black", :id => nil)
      test_train2.save()
      test_city.update(:train_ids => [test_train.id(), test_train.id()])
      expect(test_city.trains).to(eq([test_train, test_train2]))
    end
  end
end
