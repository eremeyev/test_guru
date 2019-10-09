class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  has_many :questions, through: :test
  belongs_to :current_question, class_name: 'Question', optional: true
  serialize :answer_ids
  before_save :set_current_question

  def next_question
    questions.where('questions.id > ?', current_question.id).first
  end

  def previous_question
    questions.where('questions.id < ?', current_question.id).last
  end
  
  def set_current_question
    current_question ||= test.questions.first
  end
end
