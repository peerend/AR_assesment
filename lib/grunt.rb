class Grunt < ActiveRecord::Base

  has_many :projects
  belongs_to :ship

  before_create :capitalize_name
  before_create :capitalize_rank



  validates :name, presence: true
  validates :rank, presence: true
  validates :ship_id, presence: true

private

  def capitalize_name
    self.name = self.name.capitalize
  end

  def capitalize_rank
    self.rank = self.rank.capitalize
  end
end