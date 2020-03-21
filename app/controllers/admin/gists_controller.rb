class Admin::GistsController < Admin::BaseController
  layout 'admin'
  
  def index
    @gists = Gist.all
  end
end
