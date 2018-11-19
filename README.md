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
## リクエストサンプル

### GET /schedules?year=2018

yearで年の指定したイベントを取得します

レスポンス例
```
{
  "status": 200,
  "data": [
    {
      "id": 1,
      "title": "サンプル1",
      "start": "2018-11-19T05:31:19.008Z",
      "finish": "2018-11-19T05:31:19.008Z",
      "all_day": false,
      "memo": "",
      "place": "",
      "created_at": "2018-11-19T05:31:19.029Z",
      "updated_at": "2018-11-19T05:31:19.029Z"
    },
    {
      "id": 2,
      "title": "サンプル2",
      "start": "2018-11-19T05:31:21.123Z",
      "finish": "2018-11-19T05:31:21.123Z",
      "all_day": false,
      "memo": "",
      "place": "",
      "created_at": "2018-11-19T05:31:21.127Z",
      "updated_at": "2018-11-19T05:31:21.127Z"
    },
    {
      "id": 3,
      "title": "サンプル3",
      "start": "2018-11-19T05:31:26.557Z",
      "finish": "2018-11-19T05:31:26.557Z",
      "all_day": false,
      "memo": "",
      "place": "",
      "created_at": "2018-11-19T05:31:26.558Z",
      "updated_at": "2018-11-19T05:31:26.558Z"
    }
  ]
}
```

### POST /schedules

イベントを新規作成します

リクエスト例
```
{
	 "schedule": {
		  "title": "サンプルイベント",
		  "start": "1997-01-01 18:00:00",
		  "finish": "1997-01-01 20:00:00",
    "all_day": "false"
		  "memo": "筆記用具必須",
    "place": "日本"
	 }
}
```

レスポンス例
```
{
    "status": 201,
    "message": "event was made successfully."
}
```

### PUT /schedules/:id


イベントの情報を更新します

リクエスト例
```
{
	 "schedule": {
		  "title": "サンプルイベント",
		  "start": "1997-01-01 18:00:00",
		  "finish": "1997-01-01 20:00:00",
    "all_day": "false"
		  "memo": "筆記用具必須",
    "place": "日本"
	 }
}
```

レスポンス例
```
{
    "status": 201,
    "message": "event was updated successfully."
}
```
### DELETE /schedules/:id

1つのイベントを削除します

レスポンス例
```
{
    "status": 204,
    "message": "event was deleted successfully."
}
```
