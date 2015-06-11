require('spec_helper')

describe(Stop) do
  describe('#city_id') do
    it("returns the id of a stops city") do
      test_stop = Stop.new(:city_id => 1)
      expect(test_stop.city_id()).to(eq(1))
    end
  end
end
