class Question < ApplicationRecord
  belongs_to :test
  has_many :gists
  has_many :answers
  has_many :correct_answers, -> { where(correct: true) }, class_name: "Answer"
  validates :body, presence: true
  
  def first?
    id == test.questions.first.id
  end

  def last?
    id == test.questions.last.id
  end
  
  def correct_answer_ids
    correct_answers.ids
  end

end
