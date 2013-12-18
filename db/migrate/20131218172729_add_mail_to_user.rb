class AddMailToUser < ActiveRecord::Migration
  def change
    add_column :users, :mail, :string
  end
end
