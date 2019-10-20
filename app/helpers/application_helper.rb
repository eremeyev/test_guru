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
      link_to "Test GURU", root_path
    ),
    class: "logo"
  end
  
  def display_flash
    flash.map do |k,v|
      (content_tag :h3, v, style: "color:green;")
    end.join(' ').html_safe if flash.present?
  end
  
  def greating
    content_tag :div, (
      content_tag :span, "Welcome, #{current_user.first_name}!", class: "greating"
    ),
    class: "greating"
  end
  
  def login
    content_tag :div, (
      button_to "Login", login_path, method: :get
    ),
    class: 'login'
  end
  
  def logout
    content_tag :div, (
      link_to "Logout", logout_path
    ),
    class: 'logout'
  end
  
  def nav
    content_tag :div, (
      link_to "Tests", user_tests_path(user_id: current_user.id)
    ),
    class: 'nav'
  end
  
  def signup
    content_tag :div, (
      button_to "Sign up", signup_path, method: :get
    ),
    class: 'signup'
  end  
end
