class LoginController < ApplicationController
  def login_form
  end

  def login_submit
    expected_username = ENV['admin_username'] || 'kyle'
    expected_password = ENV['admin_password'] || 'test'

    if params[:username] != expected_username
      flash[:error] = "<img src='/images/dementors.png' /> We don't recognize you, \"Professor\".  Perhaps you're the new Professor of the Dark Arts?".html_safe
      session[:user_id] = nil
      return redirect_to :action => :login_form
    end

    if params[:password] != expected_password
      flash[:error] = "<img src='/images/dementors.png' /> You must say the magic word, professor.  Eat some chocolate and try again.".html_safe
      session[:user_id] = nil
      return redirect_to :action => :login_form
    end

    session[:user_id] = 'fuck yes'

    return redirect_to :controller => :professor, :action => :new_delta_form
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "logged out successfully"
    return redirect_to :action => :login_form
  end

end
