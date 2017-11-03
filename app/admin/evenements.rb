ActiveAdmin.register Evenement do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :address, :zipcode, :date  # etc...

  index do
    selectable_column
    column :name
    column :address
    column :zipcode
    column :date
    column :created_at
    actions
  end

end
