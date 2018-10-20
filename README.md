# README

## 最終課題アプリ
メルカリ(フリーマーケットアプリ)

## 実装機能予定
### 一般機能
→ユーザー情報登録(ニックネーム、紹介文、フルネーム、住所、e-mail、電話番号、パスワード、生年月日など)、サインイン、サインアウト、クレジットカード登録、取引評価(出品者と購入者双方)、商品に対するコメント、メッセージ機能(各ユーザーに商品ステータスの変更などを通知)、Todo機能(売買フロー内のTodoを通知・管理)、商品検索機能(商品や説明文、ブランドなどと一致する商品をテキストでサーチ)、商品絞りこみ機能(カテゴリー、ブランド、地域などで商品を絞り込み)

### 出品側機能
→商品情報登録機能(名前、画像、説明、カテゴリー、サイズ、ブランド、配送方法、配送料、発送地域、商品状態、価格、売買状況など)、出品機能、売上管理(売上計上、売上金振込・口座登録)、取引評価(購入者　に対して)

### 購入側機能
→いいね機能(商品に対して)、取引評価(出品者に対して)、ポイント管理(ポイント計上、有効期限管理)


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|introduction|text|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_code|string|null: false|
|area_id|references|null: false, foreign_key: true|
|city|string|null: false|
|address1|string|null: false|
|address2|string||
|telephone|integer|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|birthday|date|null: false|

### Association
- has_many :points, dependent: :destroy
- has_one :transfer, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_many :user_evaluations
- belongs_to :area
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :personal_comments, dependent: :destroy
- has_many :allocations, dependent: :destroy
- has_many :messages, through: :allocations
- has_many :todos, dependent: :destroy
- has_many :items, dependent: :destroy


## transfersテーブル

|Column|Type|Options|
|------|----|-------|
|bank_name|string|null: false|
|account_type|string|null: false|
|branch_code|integer|null: false|
|account_num|integer|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|address_fullname|string|null: false|
|birthdate|date|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to : user


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|text|null: false, index: true|
|text|text||
|image_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|size_id|integer|foreign_key: true|
|brand_id|integer|foreign_key: true|
|price|integer|null: false|
|condition|integer|null: false|
|shipping_payer|integer|null: false|
|shipping_method_id|integer|null: false, foreign_key: true|
|area_id|integer|null: false, foreign_key: true|
|days_to_ship|string|null: false|
|likes_count|integer|null: false|
|trading_status|integer|null: false|
|shipping_fee|integer|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|foreign_key: true|
|created_at|datetime|null: false|
|updeated_at|datetime|null: false|

### Association
- has_many :images
- belongs_to :category
- belongs_to :size
- belongs_to :brand
- belongs_to :shipping_method
- belongs_to :area
- belongs_to :seller, class_name: "User"
- has_one :buyer, class_name: "User"
- has_many :likes, dependent: :destroy
- has_many :comments
- has_many :personal_comments
- has_many :messages, dependent: :destroy
- has_many :todos, dependent: :destroy
- has_many :user_evaluations
- has_one :transaction


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string||
|img_num|integer||
|created_at|datetime||
|updated_at|datetime||

### Association
- belongs_to :item


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|category|text||

### Association
- has_many :items


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|brand|text||

### Association
- has_many :items


## sizesテーブル

|Column|Type|Options|
|------|----|-------|
|size|text||

### Association
- has_many :items


## shipping_methodsテーブル

|Column|Type|Options|
|------|----|-------|
|method|text||

### Association
- has_many :items


## areasテーブル

|Column|Type|Options|
|------|----|-------|
|area|text||

### Association
- has_many :items
- has_many :users


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- has_many :users
- has_many :items


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text||
|appropriateness|integer||
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## personal commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text||
|item_id|integer|null: false, foreign_key: true|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :seller, class_name: "User", through: :items
- belongs_to :buyer, class_name: "User", through: :items


## sales_accountsテーブル
|Column|Type|Options|
|------|----|-------|
|type|integer|null: false|
|sales|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to : user


## user_evaluationsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|rate|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to : user
- belongs_to : item


## transactionsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to : item
- belongs_to : user


## pointsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|point|integer|null: false|
|limits|date||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to : user


## allocationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|message_id|references|null: false, foreign_key: true|

### Association
- belongs_to : user
- belongs_to : message


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|string|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|created_at|datetime||
|updated_at|datetime||

### Association
- has_many : allocations
- has_many : users, through: :allocations
- belongs_to : item


## todosテーブル

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|string|null: false|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|created_at|datetime||
|updated_at|datetime||

### Association
- belongs_to : item
- belongs_to : user

