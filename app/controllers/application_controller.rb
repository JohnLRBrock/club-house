class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def log_in(user)
    user.new_remember_digest
    user.save
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def log_out(user)
    cookies.permanent.signed[:user_id] = nil
    cookies.permanent[:remember_token] = nil
  end

  def current_user
    return nil unless cookies.signed[:user_id]
    return nil unless user = User.find_by(id: cookies.permanent.signed[:user_id])
    return nil unless user.authenticated?(cookies.permanent[:remember_token])
    user
  end

  def logged_in?
    !!current_user
  end
end
