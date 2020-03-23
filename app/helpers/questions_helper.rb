module QuestionsHelper
  def question_header(question)
    content_tag :h2, 
      "#{question.new_record? ? t('create') : t('edit')} #{t('.question_for_test')}: #{question.test.title}"
  end
end