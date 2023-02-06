class AddDueDateToSpreeUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :spree_users, :due_date, :datetime
  end
end
