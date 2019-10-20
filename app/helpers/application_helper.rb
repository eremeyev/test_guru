module ApplicationHelper
  def path_to_back(options)
    tests_path
  end
  
  def current_year
    Date.today.strftime("%Y")
  end
  
  def github_url(author, repo)
    link_to 'Github repo', "https://github.com/#{author}/#{repo}", target: "_blank"
  end
  
  def separator
    content_tag :span, " &middot; ".html_safe
  end
  
  def nav
    link_to "Tests", user_tests_path(user_id: @current_user.id)
  end
end
