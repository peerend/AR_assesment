class Ship < ActiveRecord::Base

  before_save :capitalize_name

  has_many :grunts

  validates :name, presence: true

  def grunt_names
    grunt_arr = []
    self.grunts.each do |grunt|
      grunt_arr << "Rank: #{grunt.rank}, Name: #{grunt.name}"
    end
    grunt_arr
  end

private

  def capitalize_name
    self.name = self.name.capitalize
  end

end