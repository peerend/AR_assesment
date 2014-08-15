require 'spec_helper'

describe Grunt do
  it "validates presence of name" do
    grunt = Grunt.create({:name => '', :ships_id =>1})
    expect(Grunt.all).to eq []
  end
  it 'validates a ship_id' do
    grunt = Grunt.create({:name => 'Picard'})
    expect(Grunt.all).to eq []
  end
end
