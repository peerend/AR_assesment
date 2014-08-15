class Grunt < ActiveRecord::Base

  before_save :capitalize_name

  belongs_to :ship

  validates :name, presence: true
  validates :ship_id, presence: true

private

  def capitalize_name
    self.name = self.name.capitalize
  end
end