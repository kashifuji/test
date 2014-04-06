class Con1Controller < ApplicationController
  def index
    begin
      _user = User.find(1)
      @name = _user.name
    rescue ActiveRecord::RecordNotFound
      @name = "guest"
    end
  end
  def error
    render :nothing => true, :status => 404
  end
end
