module SessionsHelper

  def sign_in(user, remember_me)
    if remember_me == '1'
  	    cookies.permanent[:remember_token] = user.remember_token
  	    self.current_user = user
  	else
  		cookies[:remember_token] = user.remember_token
  	    self.current_user = user
  	end
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def current_user?(user)
    user == current_user
  end

  def is_admin?
    signed_in? && current_user.admin?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
      redirect_to(root_path) unless is_admin?
  end

end