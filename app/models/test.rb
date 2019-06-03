class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users
  validates :title, :level, presence: true
  
  def self.titles_by_category(category_title)
    Test.joins(:category).where("categories.title = ?", category_title).pluck(:title)
  end
end
