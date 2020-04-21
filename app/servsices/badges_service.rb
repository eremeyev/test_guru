class BadgesService
  def initialize(user, test_passage)
    @user = user
    @test_passage = test_passage
  end  
  
  def apply
    Badge.all.each do |badge|
      badge_checker = @user.badge_checkers.where(badge_id: badge.id).first_or_create
      badge_checker.test_passages << @test_passage
      
      if badge_checker.test_passages.send(badge.method, eval("#{badge.args}"))
        @user.badges << badge
        badge_checker.test_passages = []
      end
    end
  end
end
