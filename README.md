# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false,unique: true|
|password|string|null: false|
|phone_number|string|unique: true|
|last_name|string|null: false|
|last_name_reading|string|null: false|
|first_name|string|null: false|
|first_name_reading|string|null: false|
|birthday|date|null: false|



### Association
- has_many :items
- has_many :addresses
- has_one :card

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|last_name_reading|string|null: false|
|first_name|string|null: false|
|first_name_reading|string|null: false|
|postcode|string|null: false|
|prefecture|active_hash|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string||
|phone_number|string|null: false|
|user|references|null: false,foreign_key: true|

### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_token|string|null: false|
|customer_id|string|null: false|
|user|references|null: false,foreign_key: true|

### Association
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|size|string|null: false|
|status|integer|null: false|
|price|integer|null: false|
|shipping_fee|integer|null: false|
|shipping_fee_cost|string|null: false|
|shipping_days|integer|null: false|
|buyer|references|foreign_key: { to_table: :users }|
|seller|references|null: false,foreign_key: { to_table: :users }|
|category|references|null: false,foreign_key: true|

### Association
- belongs_to :user
- has_many :photos
- belongs_to :category



## photosテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|null: false,foreign_key: true|

### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :items

