class Game < ActiveRecord::Base

  belongs_to :user
  has_many :game_invitations, dependent: :destroy
  has_many :friends, through: :game_invitations, source: :user
  has_many :friend_assignments, dependent: :destroy


  validates :name, :user, presence: true
  validates :scheduled_on, date: {
    after:   Proc.new { Time.now },
    message: 'must be a future date'
  }

end
