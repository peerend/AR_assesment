class Grunt < ActiveRecord::Base

  belongs_to :ships

  validates :name, presence: true
  validates :ships_id, presence: true

end