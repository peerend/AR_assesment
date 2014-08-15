class Grunt < ActiveRecord::Base

  validates :name, presence: true

  belongs_to :ships

end