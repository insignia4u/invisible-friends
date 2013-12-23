class Game < ActiveRecord::Base

  belongs_to :user
  has_many :game_invitations
  has_many :friends, through: :game_invitations, source: :user


  validates :name, :user, presence: true
  validates :scheduled_on, date: {
    after:   Proc.new { Time.now },
    message: 'must be a future date'
  }

end
