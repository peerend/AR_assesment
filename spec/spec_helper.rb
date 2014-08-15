require 'active_record'
require 'rspec'
require 'pry'
require 'shoulda-matchers'
require 'ship'
require 'grunt'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.after(:each) do
    Grunt.all.each { |task| task.destroy }
    Ship.all.each { |task| task.destroy }
  end
end
