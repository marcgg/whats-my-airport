module ApplicationHelper

  def dynamic_title(user_name)
    t("application.title", :name => (user_name ? "#{user_name}'s airport - " : nil))
  end

end
