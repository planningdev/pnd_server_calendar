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
    # startがfinishより大きいときエラーを追加
    if start > finish
      errors.add(:finish, "finish time must be more than start time.")
    end
  end

  # パラメータの前後6ヶ月分のイベントを返す
  def self.search_around_6_months(param)
    # パラメータをDateTime型にパース
    date = DateTime.parse(param)
    # 検索の上限
    upper = dateo + 6.month
    # 検索の下限
    lower = date - 6.month
    # 上限と下限を用い、範囲内のイベントを返す
    self.where("start < ? and start > ?", upper, lower)
  end

  # パラメータの年分のイベントを返す
  def self.search_for_year_of(param)
    # パラメータを数字にしてDateTime型を生成
    date = DateTime.new(param.to_i)
    # dateから年だけの情報を取得
    year = date.year
    # scheduleモデルからyearで始まるイベントを返す
    self.where('start like ?', "#{year}%")
  end
end
