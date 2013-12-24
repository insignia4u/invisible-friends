class InvitationManager
  include Virtus.model
  include ActiveModel::Model

  attr_accessor :game

  attribute :name,  String
  attribute :email, String

  validates :name, :email, presence: true
  validate :user_hasnt_been_invited_to_the_game

  def invite
    return false unless valid?
    game.friends << user
    #FriendNotifier.added_to_game(user, game).deliver
  end

protected
  def user
    @user ||= User.where(email: attributes[:email]).first_or_initialize.tap do |user|
      user.name = attributes[:name]
      user.save
    end
  end

  def user_hasnt_been_invited_to_the_game
    if game.friends.include?(user)
      errors.add(:base, "User #{name} (#{email}) is already invited to the game")
    end
  end

end
