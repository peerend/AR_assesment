require 'spec_helper'

describe Ship do
  it "validates the presence of name" do
    ship = Ship.create({:name => ''})
    expect(Ship.all).to eq []
  end

  it "validates capitalizes a ship name" do
    ship = Ship.create({:name => 'voyAgER'})
    expect(ship.name).to eq 'Voyager'
  end

  it "lists grunts assigned to a ship" do
    ship = Ship.create({:name => 'Enterprise'})
    grunt = Grunt.create(:rank => 'captain', :name => "piCaRd", :ship_id =>ship.id)
    grunt = Grunt.create(:rank => 'first officer', :name => "Riker", :ship_id =>ship.id)
    grunt = Grunt.create(:rank => 'badass', :name => "Data", :ship_id =>ship.id)
    ship2 = Ship.create({:name => 'Voyager'})
    expect(ship.grunt_names).to eq ["Rank: Captain, Name: Picard", "Rank: First officer, Name: Riker", "Rank: Badass, Name: Data"]
  end
end