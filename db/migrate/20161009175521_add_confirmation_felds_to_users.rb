class AddConfirmationFeldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_token, :string
  end
end
