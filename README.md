# pnd_server_calendar

## 環境
- ruby 2.5.3
- rails 5.2.1 ~

## データスキーマ

### スケジュールテーブル
```
 - Schedule
  - id      :integer
  - title   :string
  - start   :datetime
  - finish  :datetime
  - all_day :boolean
  - memo    :string
  - place   :string
```

## 注意事項
 bundle update は絶対にしないで
