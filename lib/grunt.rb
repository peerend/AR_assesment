class Grunt < ActiveRecord::Base

  before_create :capitalize_name
  before_create :capitalize_rank

  belongs_to :ship

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