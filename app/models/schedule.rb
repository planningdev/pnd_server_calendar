# frozen_string_literal: true

class Schedule < ApplicationRecord
  before_validation :assign_all_day_time, if: :all_day?

  # title, start, finish, all_day は必ず存在する
  validates :title, presence: true, length: { maximum: 128 }
  validates :start, presence: true
  validates :finish, presence: true
  # all_day は必ずtrueかfalseの値をとる
  validates :all_day, inclusion: { in: [true, false] }
  # memoとplaceの最大文字数を指定
  validates :memo, length: { maximum: 1024 }
  validates :place, length: { maximum: 128 }

  # 関数のvalidationを追加
  validate :finish_more_than_start

  # パラメータの前後6ヶ月分のイベントを返す
  def self.search_around_6_months(param)
    # パラメータをDateTime型にパース
    date = Time.zone.parse(param)
    # 検索の上限
    upper = date + 6.months
    # 検索の下限
    lower = date - 6.months
    # 上限と下限を用い、範囲内のイベントを返す
    where('start < ? and start > ?', upper, lower)
  end

  # パラメータの年分のイベントを返す
  def self.search_for_year_of(param)
    # scheduleモデルからyearで始まるイベントを返す
    where('start like ?', "#{param}%")
  end

  private

  # validationの直前に行われる処理
  # all_dayがtrueの時startとfinishを日の始まりと終わりに設定する
  def assign_all_day_time
    # startかfinishのどちらかが空だとreturn
    return unless [start, finish].all?

    self.start = start.beginning_of_day
    self.finish = finish.end_of_day
  end

  # 終わり時間は開始時間よりも遅くないといけない
  def finish_more_than_start
    return unless [start, finish].all?

    # startがfinishより大きいときエラーを追加
    errors.add(:finish, 'finish time must be more than start time.') if start > finish
  end
end
