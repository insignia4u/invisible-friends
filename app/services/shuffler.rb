class Shuffler
  def initialize(game)
    @game = game
  end

  def shuffle!
    participants = Array.new(@game.friends)
    participants << @game.user
    participants.shuffle!

    for i in 0..participants.count-2 do
      friend_assignment = FriendAssignment.new(giver: participants[i], receiver: participants[i+1])
      @game.friend_assignments << friend_assignment
      FriendNotifier.notify_assignment(friend_assignment).deliver

    end
    friend_assignment = FriendAssignment.new(giver: participants.last, receiver: participants.first)
    @game.friend_assignments << friend_assignment
    FriendNotifier.notify_assignment(friend_assignment).deliver

  end
end
