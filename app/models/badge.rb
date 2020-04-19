class Badge < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :rules
  has_many :badge_checkers
  validates_uniqueness_of :name
  validates_presence_of :name
  serialize :rules, Hash
  
  def check(test_passage)
    combined_rule = self.rules.pluck(:content).map{|c| c.join(' ')}.join(' and ')
    test_passage.instance_eval(combined_rule)
  end
  
  def combined_rule
    rules.pluck(:content).map{|c| c.join(' ')}.join(' and ')
  end
  
  BADGES = %w[
    all_simple_tests?
    all_middle_tests?
    all_hard_tests?
    all_rails_tests?
    first_attempt_is_successful?
  ]
  
  def satisfy?(test_passages)
    
#    combined_rule = self.rules.pluck(:content).map{|c| c.join(' ')}.join(' and ')
#    test_passages
#    test_passage.instance_eval(combined_rule)

    test_passages.all_simple_tests? && test_passages.all_successful?
  end
end
