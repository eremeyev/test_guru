class Category < ApplicationRecord
  has_many :tests
  has_many :test_passages, through: :tests
  validates :title, presence: true
  default_scope { order(title: :asc) }

  class << self
    Category.all.each do |category|
      define_method category.title.parameterize(separator: "_", preserve_case: false)+'_tests' do
        category.tests
      end
      
      define_method category.title.parameterize(separator: "_", preserve_case: false) do
        category
      end
    end
  end
end
