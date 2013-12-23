class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

  has_many :games
  has_many :game_invitations
  has_many :games_where_invited, through: :game_invitations, source: :game

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider         = auth.provider
      user.uid              = auth.uid
      user.name             = auth.info.name
      user.email            = auth.info.email
      user.oauth_token      = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save
    end
  end

end
