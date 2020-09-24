![jikkyo](https://user-images.githubusercontent.com/68902680/94092839-ba08c180-fe56-11ea-841b-70ab3694be47.gif)

<h2 align="center">jikkyo</h2>

## App URL
https://jikkyo-718.herokuapp.com/

## 概要
プロ野球の実況&雑談ができるサイトです。
チャットする部屋を立てて、LINEのようにリアルタイムでチャットを送受信することができます。

## 制作背景
初めてDAZNでプロ野球を観た時、配信サイトのようなコメント機能があったらいいなと思い作ってみました。

## 工夫したポイント
使用するユーザー層を考え、チャット画面は親しみのある2ちゃんねるのような色にしました。手軽に匿名で利用できるようにするため、ユーザー管理機能はあえて実装しませんでした。

## 今後実装したい機能
IPアドレスごとにコメントにIDの追加、レスポンシブデザイン、最後の投稿から一定時間時間経過でルーム自動削除などを実装したいと考えています。

## 開発環境
- <a href="https://rubyonrails.org/" target="_blank" rel="noopener noreferrer">Ruby on Rails</a>
- <a href="https://jquery.com/">jQuery</a>
- <a href="https://jp.heroku.com/">Heroku</a>

## DB設計

### rooms テーブル

| Column | Type | Option |
| - | - | - |
| name | string | null:false |

#### Association

has_many :messages

### messages テーブル

| Column | Type | Option |
| - | - | - |
| content | text | null:false |
| room | references | null:false, foreign_key:true |

#### Association

belongs_to :room
