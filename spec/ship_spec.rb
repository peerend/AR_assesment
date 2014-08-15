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
    grunt = Grunt.create(:name => "piCaRd", :ship_id =>ship.id)
    grunt = Grunt.create(:name => "Riker", :ship_id =>ship.id)
    grunt = Grunt.create(:name => "Data", :ship_id =>ship.id)
    ship2 = Ship.create({:name => 'Voyager'})
    expect(ship.grunt_names).to eq ['Picard', 'Riker', 'Data']
  end
end