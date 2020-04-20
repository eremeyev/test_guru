module ActiveRecord
  class Relation
    
    extend ActiveSupport::Concern
    
    def all_for(args)
      Test.where(args).ids - select_successful.pluck(:test_id) == []
    end
    
    def all_success?
      return false if empty?
      all?{ |record| record.success? }
    end
    
    def select_successful
      select{ |record| record.success? }
    end
    
    def is_successful?(args)
      group_by(&:test_id)[last.test_id].send(args).success?
    end
  end
end
