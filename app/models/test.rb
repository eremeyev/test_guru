class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :title, :level, presence: true
  
  def self.by_category(category_title)
    Category.find_by(title: category_title).tests.order(:desc)
  rescue 
    []
  end
end
