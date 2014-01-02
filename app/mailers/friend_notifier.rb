class FriendNotifier < ActionMailer::Base
  default from: "from@example.com"

  def added_to_game(friend, game)
    @friend = friend
    @game = game
    mail to: friend.email, subject: "#{ @game.user.name } created an invisible friend game"
  end

  def notify_assignment(friend_assignment)
    @giver = friend_assignment.giver
    @receiver = friend_assignment.receiver
    @game = friend_assignment.game
    mail to: @giver.email, subject: "You are #{ @receiver.name }'s Invisible Friend!"
  end
end
