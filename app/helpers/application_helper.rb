module ApplicationHelper

  def dynamic_title(user_name)
    t(".title", :name => (user_name ? "#{user_name}'s airport - " : nil))
  end

end
