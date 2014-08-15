class Grunt < ActiveRecord::Base

  before_save :capitalize_name

  belongs_to :ships

  validates :name, presence: true
  validates :ships_id, presence: true

private

  def capitalize_name
    self.name = self.name.capitalize
  end
end