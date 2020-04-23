module BadgesHelper
  
  def badges_helper(user)
    user.badges.map do |badge|
      badge_helper(badge)
    end.join.html_safe
  end
  
  def badge_helper(badge)
    content_tag :span,
      octicon(
        badge.image, 
        height: 30, 
        width: 35, 
        style: "color: #{badge.color};", 
      ),
      title: badge.name, 
      data: { 
        toggle: "tooltip", 
        placement: "top" 
      }
  end
end
