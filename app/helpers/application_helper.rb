module ApplicationHelper
  def path_to_back(options)
    case options[:action]
    when 'edit'
      tests_path
    else
      tests_path
    end
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
    link_to "Tests", tests_path
  end
end
