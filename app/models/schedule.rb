class Schedule < ApplicationRecord

  # title, start, finish, all_day は必ず存在する
  validates :title, presence: true
  validates :start, presence: true
  validates :finish, presence: true
  # all_day は必ずtrueかfalseの値をとる
  validates :all_day, inclusion: { in: [true, false] }

  # 関数のvalidationを追加
  validate :finish_more_than_start

  # 終わり時間は開始時間よりも遅くないといけない
  def finish_more_than_start
    if start > finish
      errors.add(:finish, "finish time must be more than start time.")
    end
  end
end
