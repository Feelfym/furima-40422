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
- has_many :orders

## itemsテーブル
| column          | type       | options                      |
| --------------- | ---------- | ---------------------------- |
| name            | string     | null:false                   |
| info            | text       | null:false                   |
| category_id     | integer    | null:false                   |
| sales_status_id | integer    | null:false                   |
| shipping_fee_id | integer    | null:false                   |
| prefecture_id   | integer    | null:false                   |
| days_to_ship_id | integer    | null:false                   |
| price           | integer    | null:false                   |
| user            | references | null:false,foreign_keys:true |

### association
- belongs_to :user
- has_one :order

## ordersテーブル
| column | type       | options                      |
| ------ | ---------- | ---------------------------- |
| item   | references | null:false,foreign_keys:true |
| user   | references | null:false,foreign_keys:true |

### association
- belongs_to :item
- belongs_to :user
- has_one :ship_to_address

## ship_to_addressesテーブル
| column        | type       | options                      |
| ------------- | ---------- | ---------------------------- |
| postal_code   | string     | null:false                   |
| prefecture_id | integer    | null:false                   |
| city          | string     | null:false                   |
| address       | string     | null:false                   |
| building_name | string     |                              |
| phone_number  | string     | null:false                   |
| order         | references | null:false,foreign_keys:true |

### association
- belongs_to :order
