module SessionHelper
  def sign_in(user)
    cookies[:remember_token] = user.remember_token
    self.current_user = user
  end



  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def signed_in?
    return true if @current_user.nil?
    #current_user.nil?
    #TBD
  end

  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
  end
end
