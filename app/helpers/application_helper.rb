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
  
  def logo
    link_to t('title'), root_path, class: 'navbar-brand'
  end
  
  def greating
    content_tag :span, t('welcome', name: current_user.first_name), class: "greating"
  end
  
  def login
    link_to t("login"), new_user_session_path, method: :get
  end
  
  def logout
    link_to t("logout"), destroy_user_session_path, method: :delete
  end
  
  def nav
    link_to_unless_current t(".tests"), tests_path(user_id: current_user.id)
  end
  
  def signup
    link_to t('sign_up'), new_user_registration_path, method: :get
  end  
end
