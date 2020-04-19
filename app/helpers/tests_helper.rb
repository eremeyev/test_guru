module TestsHelper
  def progress_message(test_passage, user)
    percents = test_passage.percents_of_success
    return content_tag :span, t(".success_message", percents: percents), style: 'color: green;' if test_passage.success?
    
#    return content_tag :span, t(".did_not_started") if user.test_passages.where(test_id: test.id).blank?
    
    content_tag :span, t(".fail_message", percents: percents), style: 'color: red;'
  end
end
