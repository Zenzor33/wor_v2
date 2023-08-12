class AddAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean, default: false
  end
end

# q: Will this file create an admin column in the users table?
# a: No, it will not. It will change the admin column to a boolean type and set the default value to false.
# q: What about now? 
# a: Yes, it will. The change method will create a new column in the users table called admin and set the default value to false.