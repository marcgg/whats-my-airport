module ApplicationHelper

  def dynamic_title(user_name)
    t("application.title", :name => (user_name ? "#{user_name.titleize}'s airport - " : nil))
  end

end
