class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_and_belongs_to_many :users
  validates :title, :level, presence: true
  validates :level, numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
  validates :level, :title, uniqueness: true
  scope :simple, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard,   -> { where(level: 5..Float::INFINITY) }
  scope :by_level, -> (level) { where(level: level) }
  
  def self.titles_by_category(category_title)
    Test.joins(:category).where("categories.title = ?", category_title).pluck(:title)
  end
end
