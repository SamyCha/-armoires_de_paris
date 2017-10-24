ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :description, :user_id  # etc...

  index do
    selectable_column
    column :id
    column :name
    column :user
    column :created_at
    actions
  end

end
