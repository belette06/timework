# frozen_string_literal: true

ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :role
  #
  # or
  #
  permit_params do
    permitted = %i[email encrypted_password reset_password_token reset_password_sent_at remember_created_at
                   role]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end

  # Create sections on the index screen
  # scope :all, default: true

  # Customize columns displayed on the index screen in the table
  index do
    selectable_column
    id_column
    column :email
    column :role, as: :select
    actions
  end

  # Filterable attributes on the index screen

  filter :email, as: :select
  filter :role, as: :select

  form do |f|
    f.inputs do
      f.input :email
      f.input :role, as: :select
    end
    f.actions
  end
end
