class AddRolesToUserGroups < ActiveRecord::Migration
  def change
    change_table :user_groups do |t|
      t.references :role
    end
  end
end
