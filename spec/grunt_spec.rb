require 'spec_helper'

describe Grunt do

  it { should belong_to :ship }

  it "validates presence of name" do
    grunt = Grunt.create({:rank => 'captain', :name => '', :ship_id =>1})
    expect(Grunt.all).to eq []
  end

  it 'validates a ship_id' do
    grunt = Grunt.create({:rank => 'captain', :name => 'Picard'})
    expect(Grunt.all).to eq []
  end

  it 'capitalizes the name' do
    grunt = Grunt.create(:name => "piCaRd", :ship_id =>1, :rank => 'captain')
    grunt.name.should eq "Picard"
  end
end
