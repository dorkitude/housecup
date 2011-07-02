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

  # this filter is to be used by specific controllers
  def login_required
    if session[:user_id]
      return true
    end

    flash[:error] = "gotta login first mang."
    return redirect_to :controller => :login, :action => :login_form
  end


  # This will set @facebook_app_id and @facebook_app_secret, either
  # from Heroku config, or to the dev app's values
  def assign_facebook_stuff
    @facebook_app_id = ENV['facebook_app_id'] || '204767346236408'
    @facebook_app_secret = ENV['facebook_app_secret'] || '1c952891190a07f032db2a6869289a06'
  end

  before_filter :assign_facebook_stuff

  
  
end
