class Game < ActiveRecord::Base

  belongs_to :user
  has_many :game_invitations
  has_many :friends, through: :game_invitations, source: :user


  validates :name, :user, presence: true
  validates :scheduled_on, date: {
    after:   Proc.new { Time.now },
    message: 'must be a future date'
  }

  def add_friend(user)
    if self.friends.find_by(id: user.id).nil?
      self.friends << user
      FriendNotifier.added_to_game(user, self).deliver
      return true
    end
    return false
  end

end
