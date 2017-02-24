module ApplicationHelper
  def page_title(title = '')
    title.empty? ? 'Clubhouse' : title
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
