ActiveAdmin.register Evenement do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :address  # etc...

  index do
    selectable_column
    column :name
    column :address
    column :created_at
    actions
  end

end
