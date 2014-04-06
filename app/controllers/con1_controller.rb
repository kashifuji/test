class Con1Controller < ApplicationController
  def index
    u = User.find(1)
    @name = u.name
  end
  def error
    render :nothing => true, :status => 404
  end
end
