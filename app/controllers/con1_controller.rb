class Con1Controller < ApplicationController
  def index
  end
  def error
    render :nothing => true, :status => 404
  end
end
