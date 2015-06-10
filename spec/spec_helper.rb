require('rspec')
require('pg')
require('city')
require('train')
require('pry')
DB = PG.connect(:dbname =>"crossing_tracks_test")

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM cities *;")
    DB.exec("DELETE FROM trains *;")
    DB.exec("DELETE FROM Stops *;")
  end
end
