module TestsHelper
  def progress_message(test, user)
    percents = test.percents_of_success(user)
    return content_tag :span, t(".success_message", percents: percents), style: 'color: green;' if test.success?(user)
    
    content_tag :span, t(".fail_message", percents: percents), style: 'color: red;'
  end
end
