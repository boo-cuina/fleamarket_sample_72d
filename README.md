# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false,unique: true|
|password|string|null: false|
|phone_number|string|unique: true|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|postcode|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||

### Association
- has_many :items
- has_many :orders
- belongs_to :card


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_id|string|null: false|
|customer_id|string|null: false|
|user_id|references|foreign_key: true|

### Association
- belongs_to :user
- has_many :orders


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|about|text|null: false|
|size|string|null: false|
|status|string|null: false|
|price|integer|null: false|
|shipping_fee|integer|null: false|
|shipping_fee_cost|string|null: false|
|shipping_days|integer|null: false|
|user_id|references|foreign_key: true|
|category_id|references|foreign_key: true|

### Association
- belongs_to :order
- has_many :photos
- belongs_to :category


## photosテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|foreign_key: true|

### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items


## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|last_name_kana|string|null: false|
|first_name|string|null: false|
|first_name_kana|string|null: false|
|postcode|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|user_id|references|foreign_key: true|
|card_id|references|foreign_key: true|
|item_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :card
- has_many :items
