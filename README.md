# テーブル設計

## usersテーブル
| column             | type   | options                  |
| ------------------ | ------ | ------------------------ |
| email              | string | null:false, unique: true |
| encrypted_password | string | null:false               |
| nickname           | string | null:false               |
| last_name          | string | null:false               |
| first_name         | string | null:false               |
| last_name_kana     | string | null:false               |
| first_name_kana    | string | null:false               |
| birthday           | date   | null:false               |

### association
- has_many :items
- has_many :order

## itemsテーブル
| column       | type    | options                      |
| ------------ | ------- | ---------------------------- |
| image        | string  | null:false                   |
| name         | string  | null:false                   |
| info         | text    | null:false                   |
| category     | text    | null:false                   |
| sales_status | text    | null:false                   |
| shipping_fee | string  | null:false                   |
| ship_from    | string  | null:false                   |
| days_to_ship | string  | null:false                   |
| price        | integer | null:false                   |
| seller_id    | integer | null:false,foreign_keys:true |

### association
- belongs_to :user
- has_one :order

## ordersテーブル
| column       | type    | options           |
| ------------ | ------- | ----------------- |
| item_id      | integer | foreign_keys:true |
| purchaser_id | integer | foreign_keys:true |

### association
- belongs_to :items
- belongs_to :users
- has_one :ship_to_address

## ship_to_addressesテーブル
| column        | type    | options                      |
| ------------- | ------- | ---------------------------- |
| postal_code   | string  | null:false                   |
| prefecture    | string  | null:false                   |
| city          | string  | null:false                   |
| address       | string  | null:false                   |
| building_name | string  |                              |
| phone_number  | integer | null:false                   |
| order_id      | integer | null:false,foreign_keys:true |

### association
- belongs_to :order
