class Book < ApplicationRecord
  belongs_to :user
  belongs_to :room
   validates :check_in, presence: true
   validate :check_before_in
    def check_before_in
    errors.add(:check_in, "は今日以降のものを選択してください") if
    check_in < Date.today
    end
   validates :check_out, presence: true
   validate :check_before_out
    def check_before_out
    errors.add(:check_out, "はチェックイン以降のものを選択してください") if
    check_out < check_in
    end
   validates :people, numericality: true
end
