class Con1Controller < ApplicationController
  def index
    begin
      _user = User.find(1)
      @name = _user.name
    rescue ActiveRecord::RecordNotFound
      @name = "guest"
    end
  end
  def form
    _request = params[:user]
    if _request != nil
      logger.debug("_name = " + _request['name'])
      # save DB
      _user = User.new(:name => _request['name'])
      _user.save
      redirect_to :controller=>"con1", :action => "result"
    end
    @user = User.new
  end
  def result
  end
  def error
    render :nothing => true, :status => 404
  end
end
