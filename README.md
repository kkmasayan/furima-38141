# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_name(kana)   | string              | null: false               |
| last_name(kana)    | string              | null: false               |
| date_of_birth      | date                | null: false               |

### Association

* has_many   :items
* belongs_to :buyer
* belongs_to :card

## items table

| Column             | Type                | Options                      |
|--------------------|---------------------|------------------------------|
| name               | string              | null: false                  |
| description        | text                | null: false                  |
| status_condition   | string              | null: false                  |
| shipping_charges   | string              | null: false                  |
| shipping_area      | string              | null: false                  |
| shipping_days      | string              | null: false                  |
| selling_price       | string             | null: false                  |
| selling_profit      | string             | null: false                  |
| user_id            | integer             | null: false,foreign_key:true |
| category_id        | integer             | null: false,foreign_key:true |


### Association

* belongs_to :user

## category table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| name               | string              | null: false                   |
| ancestry           | string              |                               |


## Association

* has_many :items

## images table

| Column             | Type                | Options                       |
|--------------------|---------------------|-------------------------------|
| image              | string              | null: false                   |
| item_id            | integer             | null: false,foreign_key:true  |


## Association

* belongs_to :item

## buyer table

| Column             | Type                | Options                      |
|--------------------|---------------------|------------------------------|
| post_number        | string              | null: false                  |
| prefecture         | string              | null: false                  |
| city               | string              | null: false                  |
| address            | string              | null: false                  |
| building_name      | string              | null: false                  |
| tell_number        | string              | null: false                  |
| user_id            | integer             | null: false,foreign_key:true |


### Association

* belongs_to :user



## card table

| Column             | Type                | Options                      |
|--------------------|---------------------|------------------------------|
| user_id            | integer             | null: false,foreign_key:true |
| customer_id        | string              | null: false                  |
| card_id            | string              | null: false                  |

### Association

 * belongs_to :users