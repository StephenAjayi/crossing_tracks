require('spec_helper')

describe(Train) do
  describe('#line') do
    it('returns the line of an instance of train') do
      test_train = Train.new(:line => "Blue")
      expect(test_train.line()).to(eq("Blue"))
    end
  end
end
