# work together

## アプリケーション情報

### アプリケーション概要
企業が、事業のパートナーになってくれる企業を探すことができるアプリケーションです。

- 接続先情報
  - URL
  - ID/PASS
    - ID:
    - Pass:
  - テスト用アカウント 等
    - パートナーシップ打診者用
      - メールアドレス:
      - パスワード:
    - 企業掲載者用
      - メールアドレス:
      - パスワード:
- Githubリポジトリ
  - https://github.com/sekikazuya/work_together

### 開発状況

- 開発環境
  - Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code

### 利用方法

- WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
  - ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
- 接続先およびログイン情報については、上記の通りです.
- 同時に複数の方がログインしている場合に、ログインできない可能性があります。
- 企業掲載方法
  - テストアカウントでログイン→トップページから「新しく会社を登録」ボタンを押す→企業情報を入力→企業登録
- 企業への問い合わせ方法
  - テストアカウントでログイン→トップページから企業を選択→企業ページから「お問い合わせ」ボタンを押す→問い合わせ内容入力→「送信」ボタンを押す。
- 確認後、ログアウト処理をお願いします。

### 目指した課題解決

- パートナー企業探しをもっと簡単に
  - ペルソナ
    - 中小印刷会社勤務 営業担当（協力会社選択権あり）
    - 男性
    - 30代
    - 趣味：オンラインゲーム
  - 課題
    - 少し変わった加工が必要な案件の相談を受けた際に、毎度対応可能な協力会社を探すのに時間がかかってしまうので、簡単にすばやく探す方法がないか
    - 自社HP以外で新規開拓の営業活動を自動で行えないか。
  - 課題解決のための機能
    - 多種多様な企業が掲載されており、探している技術を持った企業をキーワードなどで簡単に検索できる機能
    - 掲載することで、自社が得意とする技術を必要としている企業が向こうから探してきてくれるような機能

### 洗い出した要件

- ユーザー登録機能
  - 目的
    - 登録されているユーザーのみが企業の掲載・編集や、掲載されている企業への問い合わせをできるようにするため
  - 詳細
    - 名前、メールアドレス、所属企業名、役職、所属企業の所在地を入力すれば登録できる。
    - 企業HPも入力できるが登録は任意
    - ユーザー登録すれば、気になった企業に対しての問い合わせができるようになる
  - ストーリー（ユースケース）
    - 基本手打ち入力のみ
- ユーザー詳細情報表示機能
  - 目的
    - 登録されているユーザー情報を閲覧できるようにするため
  - 詳細
    - 登録されているユーザー情報を閲覧できるようにするため。自身のユーザー詳細ページでしか表示されない情報もある
  - ストーリー（ユースケース）
    - ブラウザ上に表示される名前をクリックすると詳細ページに遷移できる
- ユーザー情報編集機能
  - 目的
    - 登録されているユーザー情報を編集・更新できるようにするため
  - 詳細
    - 登録されているユーザーが、自身のユーザー詳細ページから登録内容を編集・更新できるようにする
  - ストーリー（ユースケース）
    - ユーザー登録した本人のみが、自身のユーザー詳細ページにのみ表示される編集ボタンをクリックすることで、編集ページに遷移できる
- ユーザー退会機能
  - 目的
    - 登録されているユーザー情報の削除ができるようにするため
  - 詳細
    - ユーザーの登録を削除できるようにする。
    - 退会するとそのユーザーに紐づく情報も全て消えるようにする
  - ストーリー（ユースケース）
    - 退会ボタンから退会確認ページに遷移、必要事項を記入後、退会ボタンで退会手続きが完了できる
- 企業情報掲載機能
  - 目的
    - ユーザーが企業をPRするページを作成できるようにするため
  - 詳細
    - 企業名、所在地、事業内容、得意なこと、実績紹介(画像、説明文)を登録できる
    - 企業に対しての問い合わせフォームページへ遷移するためのボタンがある
  - ストーリー（ユースケース）
    - 企業名などは掲載企業が手打ち入力
    - ユーザーが企業情報を閲覧でき、その企業の問い合わせフォームに遷移できる
- 掲載企業一覧表示機能
  - 目的
    - 掲載されている企業を一覧形式で表示できるようにするため
  - 詳細
    - 複数の企業が登録されていることが前提
    - 掲載されている企業の企業名、画像、事業内容が一覧形式で表示されるようにする
  - ストーリー（ユースケース）
    - 掲載されている企業の画像と企業名、事業内容をトップページ、もしくは検索結果で一覧形式で見ることができる
- 企業詳細表示機能
  - 目的
    - 登録されている企業の詳細情報を閲覧できるようにするため
  - 詳細
    - 掲載されている企業情報を閲覧できるようにするため。自身で作成した企業情報ページには、編集ページへ遷移できるボタンが表示される。他のユーザーが作成した企業詳細ページには問い合わフォームを表示させるためのボタンが表示される。
  - ストーリー（ユースケース）
    - 表示されている企業の画像、企業名をクリックすることで企業詳細ページへ遷移できる
- 企業情報編集機能
  - 目的
    - 登録されている企業情報を編集・更新・削除できるようにするため
  - 詳細
    - 企業情報を掲載したユーザーが、自身で掲載した企業情報を編集・更新できる
  - ストーリー（ユースケース）
    - 自身で掲載した企業情報詳細ページから編集ボタンをクリックすることで、編集ページへ遷移できる
- 問い合わせ機能
  - 目的
    - 気になった企業へ連絡できるようにするため
  - 詳細
    - フォームを入力し、送信ボタンを押すとチャットルームが開設され、企業情報掲載者とメッセージのやりとりができるようになる。
  - ストーリー（ユースケース）
    - 企業詳細ページの問い合わせボタンを押し、表示された問い合わせフォームに必要情報を入力し、送信ボタンをクリックすると、フォームに入力した内容が反映されたチャットルームが開設され、以降はこのチャットルームでメッセージのやりとりができる。
- キーワード検索機能
  - 目的
    - ユーザーが簡単にデータ検索できるようにするため
  - 詳細
    - 複数条件を指定した上で企業の検索を可能にする
  - ストーリー（ユースケース）
    - 企業が複数登録されていることが前提
    - 手打ち入力のみ

### 実装予定の機能
  - ユーザー登録機能
  - ユーザー詳細情報表示機能
  - ユーザー情報編集機能
  - ユーザー退会機能
  - 企業情報掲載機能
  - 掲載企業一覧表示機能
  - 企業詳細表示機能
  - 企業情報編集機能
  - 問い合わせ機能
  - キーワード検索機能


# テーブル設計

## users テーブル

| Column             | Type   | Option      |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| company            | string | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |

### Association

- has_many :companies
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :inquiries

## companies テーブル

| Column         | Type          | Option                         |
| -------------- | ------------- | ------------------------------ |
| name           | string        | null: false                    |
| name_kana      | string        | null: false                    |
| image          | ACtiveStorage | null: false                    |
| sector_id      | integer       | null: false                    |
| industry_id    | integer       | null: false                    |
| profile        | text          | null: false                    |
| prefecture_id  | integer       | null: false                    |
| city           | string        | null: false                    |
| building_name  | string        |                                |
| phone          | string        | null: false                    |
| business_hours | text          |                                |
| user           | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :rooms
- has_many :inquiries
- has_many :achievements

## rooms テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| company | references | null: false, foreign_key: true |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- belongs_to :company
- has_many :inquiries

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room

## inquiries テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| message | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| company | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :company
- belongs_to :room

## achievements テーブル

| Column       | Type          | Option                         |
| ------------ | ------------- | ------------------------------ |
| title        | string        | null: false                    |
| introduction | text          | null: false                    |
| image        | ActiveStorage |                                |
| company      | references    | null: false, foreign_key: true |

### Association

- belongs_to :company