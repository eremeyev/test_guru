module QuestionsHelper
  def question_header(question)
    content_tag :h2, 
      "#{question.new_record? ? 'Create New' : 'Edit'} Question for test: #{question.test.title}"
  end
end
