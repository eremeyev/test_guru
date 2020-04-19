class BadgeChecker < ApplicationRecord
  belongs_to :user
  belongs_to :badge
  has_and_belongs_to_many :test_passages
  
  def got_result_for_badge?
    binding.pry
    test_passages.each do |test_passage|
      test_passage.instance_eval(badge.combined_rule)
    end    
  end
end
