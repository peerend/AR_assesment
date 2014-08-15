require 'spec_helper'

describe Grunt do
  it "validates presence of name" do
    grunt = Grunt.create({:name => ''})
    expect(Grunt.all).to eq []
  end
end
