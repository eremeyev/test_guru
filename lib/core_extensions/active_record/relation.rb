module ActiveRecord
  class Relation
    
    extend ActiveSupport::Concern
    
    def all_for(condition)
      Test.where(condition).ids - pluck(:test_id) == []
    end

    def all_for_level(level)
      Test.where(level: level).ids - pluck(:test_id) == []
    end

    def all_simple_tests?
      Test.where(level: 'simple').ids - pluck(:test_id) == []
    end
    
    def all_middle_tests?
      Test.where(level: 'middle').ids - pluck(:test_id) == []
    end
    
    def all_hard_tests?
      Test.where(level: 'hard').ids - pluck(:test_id) == []
    end
    
    def all_successful?
      all?{|record| record.success? }
    end
  end
end
