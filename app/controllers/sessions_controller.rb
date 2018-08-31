class SessionsController < ApplicationController
  def new; end

  def create
    return flash_danger unless params[:session].present?
    session = params[:session]
    user = User.find_by email: session[:email].downcase
    if user&.authenticate(session[:password])
      if user.admin?
        log_in user
        remember_me user
        redirect_to backend_path
      else
        redirect_to root_path
      end
    else
      flash_danger
    end
  end

  def flash_danger
    flash.now[:danger] = t ".invalid_email_password"
    render :new
  end

  def remember_me user
    if params[:session][:remember_me] == Settings.sessions.is_remember
      remember user
    else
      forget user
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end