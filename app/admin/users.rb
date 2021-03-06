ActiveAdmin.register User do

  form do |f|
    f.inputs "Identity" do
      f.input :email
    end
    f.inputs "Role" do
      f.input :role
    end
    f.inputs "Admin" do
      f.input :admin
    end
    f.actions
  end

  permit_params :email, :role, :admin

  index do
    selectable_column
    column :id
    column :email
    column :created_at
    column :role
    column :admin
    actions
  end
end
