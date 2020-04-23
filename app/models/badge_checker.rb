class BadgeChecker < ApplicationRecord
  belongs_to :user
  belongs_to :badge
  has_and_belongs_to_many :test_passages
end
