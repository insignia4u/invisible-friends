class FriendAssignment < ActiveRecord::Base
  belongs_to :game
  belongs_to :giver, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :game, :giver, :receiver, presence: true
end
