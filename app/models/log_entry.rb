# Log Entry model class.
class LogEntry < ApplicationRecord
  validates :user, presence: true,
                   length: { minimum: 3 },
                   uniqueness: { scope: :for_date, message: 'One daily entry per user.' }
end
