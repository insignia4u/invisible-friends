class NotificationResender

  def initialize(game)
    @game = game
  end

  def resend_notifications
    @game.friend_assignments.each do |fa|
    FriendNotifier.notify_assignment(fa).deliver
    end

  end

end
