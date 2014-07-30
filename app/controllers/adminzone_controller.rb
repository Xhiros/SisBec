class AdminzoneController < ApplicationController
  before_action :authenticate_user!
  layout 'management'
  def index
    
  end
  def userlist
    @users = User.all
  end
end
