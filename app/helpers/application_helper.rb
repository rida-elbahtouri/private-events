module ApplicationHelper
  def auth_links
    if session[:current_user]
      render '/layouts/username_log_out'
    else
      render '/layouts/sign_in_sign_up'
    end
  end

  def my_events
    render '/layouts/my_events_link' if session[:current_user]
  end
end
