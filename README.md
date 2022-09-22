# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| first_name_kana    | string              | null: false               |
| last_name_kana     | string              | null: false               |
| date_of_birth      | date                | null: false               |

### Association

* has_many   :items
* has_many   :buyers


## items table

| Column             | Type                | Options                      |
|--------------------|---------------------|------------------------------|
| name               | string              | null: false                  |
| description        | text                | null: false                  |
| status_condition_id| integer             | null: false                  |
| prefecture_id      | integer             | null: false                  |
| shipping_charges_id| integer             | null: false                  |
| shipping_days_id   | integer             | null: false                  |
| selling_price      | integer             | null: false                  |
| user               | references          | null: false,foreign_key:true |
| category_id        | integer             | null: false                  |


### Association

* belongs_to :user
* has_one    :buyer



## payments table

| Column             | Type                | Options                      |
|--------------------|---------------------|------------------------------|
| post_number        | string              | null: false                  |
| prefecture_id      | integer             | null: false                  |
| city               | string              | null: false                  |
| address            | string              | null: false                  |
| building_name      | string              |                              |
| tell_number        | string              | null: false                  |
| buyer              | references          | null: false,foreign_key:true |


### Association

* belongs_to :buyer

## buyers table

| Column             | Type                | Options                      |
|--------------------|---------------------|------------------------------|
| user               | references          | null: false,foreign_key:true |
| item               | references          | null: false,foreign_key:true |


### Association

* belongs_to :user
* belongs_to :item
* has_one :payment

