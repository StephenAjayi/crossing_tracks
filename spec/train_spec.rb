require('spec_helper')

describe(Train) do
  describe('#line') do
    it('returns the line of an instance of train') do
      test_train = Train.new(:line => "Blue")
      expect(test_train.line()).to(eq("Blue"))
    end
  end

  describe('.all') do
    it('returns an array of saved instances of Train, it is empty at first') do
      expect(Train.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('pushes an instance of Train into an array of saved Train insrances') do
      test_train = Train.new(:line => "Yellow")
      test_train.save()
      expect(Train.all()).to(eq([test_train]))
    end
  end

  describe('#==') do
    it('evaluates two instances of Train as equal if they have the same line') do
      test_train = Train.new(:line => "Blue")
      test_train2 = Train.new(:line => "Blue")
      expect(test_train).to(eq(test_train2))
    end
  end
end
