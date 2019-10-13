class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  has_many :questions, through: :test
  has_many :correct_answers, through: :questions
  belongs_to :current_question, class_name: 'Question', optional: true
  serialize :answer_ids

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
