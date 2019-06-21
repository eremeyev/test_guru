class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions
  has_and_belongs_to_many :users
  validates :title, :level, presence: true
  validates :level, numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
  scope :by_level, -> (level) { where(level: level) }
  scope :simple, -> { by_level(0..1) }
  scope :middle, -> { by_level(2..4) }
  scope :hard,   -> { bylevel(5..Float::INFINITY) }
  
  def self.titles_by_category(category_title)
    Test.joins(:category).where("categories.title = ?", category_title).pluck(:title).sort
  end
end
