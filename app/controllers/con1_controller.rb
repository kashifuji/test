class Con1Controller < ApplicationController
  def index
    u = User.find(1)
    if u.name = nil
      @name = "guest"
    else
      @name = u.name
    end
  end
  def error
    render :nothing => true, :status => 404
  end
end
