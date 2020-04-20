module ActiveRecord
  class Relation
    
    extend ActiveSupport::Concern
    
    def all_for(args)
      Test.where(args).ids - pluck(:test_id) == []
    end
    
    def all_success?
      all?{ |record| record.success? }
    end
    
    def count_eq(args)
      count == args
    end
  end
end
