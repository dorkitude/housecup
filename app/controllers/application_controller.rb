class ApplicationController < ActionController::Base
  # commenting out because i don't think we want this, since not all forms are generated -KW
  # protect_from_forgery
  
  

  # this will give views access to the action and controller name
  before_filter :instantiate_controller_and_action_names
  def instantiate_controller_and_action_names
    @current_action = action_name
    @current_controller = controller_name
  end

  # this will give views access to the user
  before_filter :instantiate_user

  def instantiate_user
    if session[:user_id]
      @user = session[:user_id]
    else
      @user = nil
    end
  end


  
  
end
