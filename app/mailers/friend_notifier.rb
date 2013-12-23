class FriendNotifier < ActionMailer::Base
  default from: "from@example.com"

  def added_to_game(friend, game)
    @friend = friend
    @game = game
    mail to: friend.email, subject: "#{ @game.user.name } created an invisible friend game"
  end
end
