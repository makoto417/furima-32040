# テーブル設計

## usersテーブル

|Column                |Type    |Options     |
|----------------------|--------|------------|
|nickname              |string  |null: false | 
|email                 |string  |null: false |
|password              |string  |null: false |
|password_confirmation |string  |null: false |
|family_name           |string  |null: false |
|first_name            |string  |null: false |
|family_name_kana      |string  |null: false |
|first_name_kana       |string  |null: false |
|born_year             |integer |null: false |
|born_month            |integer |null: false |
|born_day              |integer |null: false |

## Association

- has_many :items
- has_many :orders

## itemsテーブル

|Column        |Type       |Options           |
|--------------|-----------|------------------|
|item_name     |string     |null: false       |
|image         |text       |null: false       |
|explanation   |text       |null: false       |
|category      |string     |null: false       |
|status        |string     |null: false       |
|fee           |string     |null: false       |
|prefectures   |string     |null: false       |
|send_out_date |string     |null: false       |
|price         |integer    |null: false       |
|user          |references |foreign_key: true |

## Association

- belongs_to :user
- has_one :order

## ordersテーブル

|Column   |Type       |Options           |
|---------|-----------|------------------|
|user     |references |foreign_key: true |
|item     |references |foreign_key: true |
|buy_date |datetime   |null :false       |

## Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## addressesテーブル

|Column        |Type       |Options           |
|--------------|-----------|------------------|
|postcode      |integer    |null: false       |
|prefecture    |string     |null: false       |
|address_city  |string     |null: false       |
|address_line1 |string     |null: false       |
|address_line2 |string     |                  |
|phone_number  |integer    |null: false       |

## Association

- has_many :orders