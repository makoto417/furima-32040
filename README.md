# テーブル設計

## usersテーブル

|Column                |Type    |Options     |
|----------------------|--------|------------|
|nickname              |string  |null: false | 
|email                 |string  |null: false |
|encrypted_password    |string  |null: false |
|family_name           |string  |null: false |
|first_name            |string  |null: false |
|family_name_kana      |string  |null: false |
|first_name_kana       |string  |null: false |
|birthday              |date    |null: false |

## Association

- has_many :items
- has_many :orders

## itemsテーブル

|Column           |Type       |Options           |
|-----------------|-----------|------------------|
|name             |string     |null: false       |
|explanation      |text       |null: false       |
|category_id      |integer    |null: false       |
|status_id        |integer    |null: false       |
|fee_id           |integer    |null: false       |
|prefectures_id   |integer    |null: false       |
|send_out_date_id |integer    |null: false       |
|price            |integer    |null: false       |
|user             |references |foreign_key: true |

## Association

- belongs_to :user
- has_one :order

## ordersテーブル

|Column   |Type       |Options           |
|---------|-----------|------------------|
|user     |references |foreign_key: true |
|item     |references |foreign_key: true |

## Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

|Column        |Type       |Options           |
|--------------|-----------|------------------|
|postcode      |string     |null: false       |
|prefecture_id |integer    |null: false       |
|address_city  |string     |null: false       |
|address_line1 |string     |null: false       |
|address_line2 |string     |                  |
|phone_number  |string     |null: false       |
|order         |references |foreign_key: true |

## Association

- belongs_to :order