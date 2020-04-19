class Rule < ApplicationRecord
  validates_presence_of :content
  validates_uniqueness_of :content
  serialize :content, Array
  validate :presence, :content
  validate :validate_content_consists_of_three_parts
  validate :validate_content_consists_only_permitted_things #, { message: "Not permitted parts of sentence" }
  
  IMAGES = %w[star rocket mortar-board flame light-bulb verified]
  COLORS = %w[red orange green blue darkblue purple]
  
  
  def self.all_tests_of_category_front_end_are_successful(test_passages=[])
    cond1 = Category.front_end_tests.ids - test_passages.map(&:test_id) == []
    cond2 = test_passages.select{|test_passage| test_passage.category == Category.front_end}.all?{|tp| tp.success?}
    cond1 && cond2
  end

  
  def self.list
    {
      "test_passage.test.title"          => { values: Test.pluck(:title), type: "string", operations: %w[==] },
      "test_passage.test.level"          => { values: Test::LEVELS, type: "string", operations: %w[==] },
      "test_passage.percents_of_success" => { values: (5..10).map{|i| i * 10}, type: "integer", operations: %w[== >= >] },
      "test_passage.success?"            => { values: [true, false], type: "boolean", operations: %w[== !=] },
      "test_passages.attempts_qty"       => { values: [1,2,3], type: "integer", operations: %w[== < <=] },
      "test_passage.category.title"      => { values: Category.pluck(:title), type: "string", operations: %w[== !=] },
      "(Category.front_end_tests.ids - currrent_user.test_passages.map(&:test_id)).size" => { values: [0], operations: %w[== !=] },
      
      "all_simple_tests?" => { values: [true], operations: %w[==]},
      "all_middle_tests?" => { values: [true], operations: %w[==]},
      "all_hard_tests?" => { values: [true], operations: %w[==]},
      "all_successful?" => { values: [true], operations: %w[==]}
    }
  end
  
  
  

  
  private
  
  def validate_content_consists_of_three_parts
    return false unless content.any?
    content.size == 3
  end
  
  def validate_content_consists_only_permitted_things
    return false unless content.any?
    attr, operation, value = content
    permitted_attributes.include?(attr) &&
    permitted_operations.include?(operation) &&
    permitted_values.include?(value)
  end
  
  def permitted_attributes
    Category.allowed_methods.keys +
    TestPassage.allowed_methods.keys
  end
  
  def permitted_operations
    OPERATIONS
  end

  def permitted_values
    Category.allowed_methods.values.map{|v| v[:values]} +
    TestPassage.allowed_methods.values.map{|v| v[:values]}
  end
end
