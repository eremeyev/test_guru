module TestsHelper
  def progress_message(test, user)
    percents = test.percents_of_success(user)
    return content_tag :span, "Successful. #{percents}% ", style: 'color: green;' if test.success?(user)
    content_tag :span, "Failed. #{percents}%", style: 'color: red;'
  end
end
