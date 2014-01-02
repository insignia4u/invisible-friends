class CreateFriendAssignments < ActiveRecord::Migration
  def change
    create_table :friend_assignments do |t|
      t.belongs_to :game, index: true
      t.references :giver, index: true
      t.references :receiver, index: true

      t.timestamps
    end
  end
end
