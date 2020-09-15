class AddUserRefToLogins < ActiveRecord::Migration[6.0]
  def change
    add_reference :logins, :user, null: false, foreign_key: true
  end
end
