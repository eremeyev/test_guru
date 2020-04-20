class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  has_one :category, through: :test
  has_many :questions, through: :test
  has_many :correct_answers, through: :questions
  belongs_to :current_question, class_name: 'Question', optional: true
  serialize :answer_ids
  has_and_belongs_to_many :badge_checkers

  def level
    test.level
  end

  def title
    test.title
  end

  def attempts_qty
    test_passage.level
  end

  def next_question
    self.questions.where('questions.id > ?', self.current_question.id).first
  end

  def previous_question
    questions.where('questions.id < ?', current_question.id).last
  end
  
  def prepare_start!
    self.correct_questions = 0
    self.current_question = test.questions.first
    save!
  end
  
   def percents_of_success
    correct_percents = 100.0 / test.correct_answers.size * self.correct_questions
    return correct_percents.round(0) if test.correct_answers.present?
    0
  end
  
  def success?
    percents_of_success >= Test::PERCENTS_OF_SUCCESS
  end

  def set_next_question!
    self.current_question = self.next_question
    save!
  end
  
  def accept!(answer_ids)
    #answer_ids is a array
    if (answer_ids.map(&:to_i) - correct_answers.ids).empty?
      self.update!(correct_questions: self.correct_questions += 1 * answer_ids.size)
    end
  end
end
