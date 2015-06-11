require('spec_helper')

describe(City)
describe('#name') do
  it('returns the name of an instance of city') do
    test_city = City.new(:name => "Portland")
    expect(test_city.name()).to(eq("Portland"))
  end
end
