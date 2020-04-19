class BadgesService

  def initialize(user, test_passage)
    @user = user
    @test_passage = test_passage
  end  
  
  def apply
    
    
    
    
    
    Badge.all.each do |badge|
      badge_checker = @user.badge_checkers.find_by(badge_id: badge.id)
      
      badge_checker.test_passages << @test_passage if badge.check(@test_passage) and badge_checker.test_passages.exclude?(@test_passages)
#      give(badge) if badge_checker.got_result_for_badge?
      
#      if Category.front_end_tests.ids - @user.test_passages.map{|tp| tp.test_id}     
#      @user.badges << badge if badges_checker(@test_passage)
      
#      if @user.test_passages.select{|test_passage| instance_eval(combined_rule)}.any?
#        @user.badges << badge
#      end
    end
  end
  
  def give(badge)
    @user.badges << badge
  end
  
#  def badges_checker(test_passage)
#    @user.badges_storage
#  end
  
  private
end
