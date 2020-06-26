
# Name

湯処Map

## Overview

福岡近郊の日帰り温泉を投稿できるSNSアプリケーション

## Description

・日帰り温泉の投稿、閲覧、編集、投稿に対する口コミの閲覧・作成が行える。
・温泉施設の詳細ページでは温泉名、場所、投稿者、口コミが確認できる。
・さらにGoogle Mapを搭載し、施設の場所から地図の検索機能を実装。
・タグ機能で温泉施設に紐付いたタグを確認できる。
・温泉施設を検索することができる。（インクリメンタルサーチ機能を搭載）
・signupすることにより、温泉施設の口コミを投稿することができる。（非同期通信にて投稿可能）

# Yu-Map DB設計
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
