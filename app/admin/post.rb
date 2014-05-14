ActiveAdmin.register Post do
  permit_params :title, :body, :link, :user_id, :weekly_theme_id  
end
