class Schedule < ApplicationRecord

  # title, start, finish, all_day は必ず存在する
  validates :title, presence: true
  validates :start, presence: true
  validates :finish, presence: true
  # all_day は必ずtrueかfalseの値をとる
  validates :all_day, inclusion: { in: [true, false] }
end
