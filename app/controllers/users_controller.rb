class UsersController < ApplicationController
# before_filter :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
    
    respond_to do |format|
        format.html # show.html.erb
        format.xml { render :xml => @user }
    end
  end
end