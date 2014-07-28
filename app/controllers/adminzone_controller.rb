class AdminzoneController < ApplicationController
  before_action :authenticate_user!
  def index
    
  end
  def userlist
    @users = User.all
  end
end
