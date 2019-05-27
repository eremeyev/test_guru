class Test < ApplicationRecord
  belongs_to :category
  validates :title, :level, presence: true
end
