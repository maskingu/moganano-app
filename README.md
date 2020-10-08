# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column	  | Type	   | Options     |
| --------- | -------- | ----------- |
| name	    | string	 | null: false |
| email	    | string	 | null: false |
| password	| string	 | null: false |

### Association

- has_many :posts
- has_many :comments

# comments テーブル

| Column	| Type	      | Options                        |
|  ------ |  ---------  |                                |
| text	  | text	      |                                |
| user	  | references	| null: false, foreign_key: true |
| post	  | references	| null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :posts

# posts テーブル

| Column	 | Type	           | Options                        |
| -------- | --------------- | ------------------------------ |
| title	   | string	         |                                |
| text	   | text	           |                                |
| image	   | string	         |                                |
| user	   | references	     | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_many :comments
- has_many :tags, through: :post_tags

# post-tags テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| post   | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

## Association

- belongs_to :post belongs_to :tag

# tags テーブル

| Column | Type    | Options                      |
| ------ | --------| ---------------------------- |
| name   | string  | null:false, uniqueness: true |

## Association

- has_many :posts, through: :post_tags