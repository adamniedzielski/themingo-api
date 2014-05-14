ActiveAdmin.register User do

  permit_params :email,:encrypted_password, :reset_password_token, :reset_password_sent_at,
                :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at,
                :current_sign_in_ip, :last_sign_in_ip, :created_at, :updated_at,
                :nickname, :first_name, :last_name, :description, :age, :location

  index do
    selectable_column
    column :id
    column :email
    column :nickname
    actions
  end
  
end
