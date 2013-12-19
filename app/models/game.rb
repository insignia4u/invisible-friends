class Game < ActiveRecord::Base
  belongs_to :user

  validates :name, :user, presence: true
  validates :scheduled_on, date: {
    after:   Proc.new { Time.now },
    message: 'must be a future date'
  }
end
