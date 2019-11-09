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
    content_tag :div, (
      link_to t('title'), root_path
    ),
    class: "logo"
  end
  
  def display_flash
    flash.map do |k, v|
      (content_tag :h3, v, class: "flash.#{k}")
    end.join(' ').html_safe if flash.present?
  end
  
  def greating
    content_tag :div, (
      content_tag :span, t('welcome', name: current_user.first_name), class: "greating"
    ),
    class: "greating"
  end
  
  def login
    content_tag :div, (
      link_to t("login"), new_user_session_path, method: :get
    ),
    class: 'login'
  end
  
  def logout
    content_tag :div, (
      link_to t("logout"), destroy_user_session_path, method: :delete
    ),
    class: 'logout'
  end
  
  def nav
    content_tag :div, (
      link_to_unless_current t("Tests"), tests_path(user_id: current_user.id)
    ),
    class: 'nav'
  end
  
  def signup
    content_tag :div, (
      link_to t('sign_up'), new_user_registration_path, method: :get
    ),
    class: 'signup'
  end  
end
