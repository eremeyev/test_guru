class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  has_many :questions, through: :test
  belongs_to :current_question, class_name: 'Question', optional: true
  serialize :answer_ids
  after_save :set_next_question
  
  def set_next_question
    current_question = next_question
  end
  
  def next_question
    questions.where('questions.id > ?', current_question.id).first
  end

  def previous_question
    questions.where('questions.id < ?', current_question.id).last
  end
end
