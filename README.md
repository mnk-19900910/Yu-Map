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


# chat-space DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :kuchikomis
- has_many :posts

## kuchikomisテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|integer|foreign_key: true|
|post_id|integer|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :post

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|location|string||
|image|text||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :kuchikomis
- has_many :post_tags
- has_many  :tags,  through:  :post_tags

## post_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :tag

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
### Association
- has_many :post_tags
- has_many  :posts,  through:  :post_tags
