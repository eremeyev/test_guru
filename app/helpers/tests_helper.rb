module TestsHelper
  def progress_message(test, user)
    percents = test.percents_of_success(user) 
    return content_tag :span, "#{percents}% Successful.", style: 'color: green;' if percents >= 85
    content_tag :span, "#{percents}% Failed.", style: 'color: red;'
  end
end
