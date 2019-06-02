class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users
  validates :title, :level, presence: true
  
  def self.by_category(category_title)
    Category.find_by(title: category_title).tests.order(:desc)
  rescue 
    []
  end
end
