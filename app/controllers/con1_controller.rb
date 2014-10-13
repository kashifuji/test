class Con1Controller < ApplicationController
  protect_from_forgery :except => ["form2"]
  def index
    begin
      _user = User.find(1)
      @name = _user.name
    rescue ActiveRecord::RecordNotFound
      @name = "guest"
    end
  end
  def form2
    personal = [{'name' => 'taro', 'old' => 44},{'name' => 'jiro', 'old' => 40}]
    if params[:parse] != nil && params[:parse] == 'json'
      render :json => personal
    else
      render :xml => personal
    end
  end
  def form
    _request = params[:user]
    if _request != nil && _request['name'] != nil
      logger.debug("_name = " + _request['name'])
      # save DB
      _user = User.new(:name => _request['name'])
      if _user.save
        redirect_to :controller=>"con1", :action => "result"
      else
        logger.debug("save error")
      end
    end
    @user = User.new
  end
  def result
  end
  def error
    render :nothing => true, :status => 404
  end
end
