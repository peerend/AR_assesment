require 'active_record'
ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["development"])


require './lib/grunt'
require './lib/ship'

def header
  system 'clear'
  puts "*" * 50
  puts "Federation Grunt Tracker"
  puts "*" * 50
  puts "\n\n"
end
loop do
  def menu
    header
    puts "Welcome Starfleet Administrator!"
    puts "Press 'a' to add a new grunt, 'l' to list grunts, or 's' to list fleet ships."
    puts "Type 'as' to add a new ship"
    puts "Type 'staff' to list grunts by ship"
    puts "Type 'd' to destroy a grunt!"
    puts "Type 'x' to exit"
    choice = gets.chomp.downcase
    case choice
    when 'a'
      add_grunt
    when 'l'
      list_grunts
    when 'd' 
      destroy_grunt
    when 'x'
      exit
    when 'ds'
      destroy_ship
    when 'staff'
      ship_grunts
    when 'as'
      add_ship
    when 's'
      list_ships
    else
      puts "Please enter a valid option."
      menu
    end
  end

  def add_ship
    header
    puts "Input a ship"
    name = gets.chomp
    new_ship = Ship.create({:name => name})
    puts 'Enter to continue'
    gets
  end


  def list_ships
    header
    Ship.all.each do |ship|
      puts "ID: #{ship.id} Name: #{ship.name}"
    end
    puts "Press enter to continue"
    gets
  end

  def ship_grunts
    Ship.all.each do |ship|
      puts "ID: #{ship.id} Name: #{ship.name}"
    end
    puts "For which ship would you like to view the crew?"
    crew = gets.chomp.to_i
    ship = Ship.find(id = crew)
    puts ship.grunt_names
    puts "press enter to continue"
    gets
  end

  def add_grunt
    header
    puts "Enter the grunts name"
    name = gets.chomp
    puts "Enter rank"
    rank = gets.chomp
    list_ships
    puts "Enter the grunt's assigned ship by ID"
    id = gets.chomp.to_i
    new_grunt = Grunt.create({:name => name, :rank => rank, :ship_id => id})
    puts "New grunt #{name} added (Press enter to return to menu)"
    puts "press enter to continue"
    gets
  end

  def list_grunts
    header
    Grunt.all.each do |grunt|
      puts "#{grunt.name} Rank: #{grunt.rank}, ID: #{grunt.id}"
    end
    puts "Press enter to continue"
    gets
  end

  def destroy_grunt
    Grunt.all.each do |grunt|
      puts "#{grunt.name} Rank: #{grunt.rank}, ID: #{grunt.id}"
    end

    puts "please enter the id of the grunt you would like to destroy."
    id_grunt = gets.chomp.to_i
    Grunt.destroy(id_grunt)
  end

  def destroy_ship
    Ship.all.each do |ship|
      puts "ID: #{ship.id} Name: #{ship.name}"
    end
    puts "please enter the id of the ship you would like to destroy."
    id_ship = gets.chomp.to_i
    Ship.destroy(id_ship)
  end
  menu
end
