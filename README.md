# README

# reminder_linebot

### このアプリについて

個人的に忘れがちなタスクを定期的に通知してくれる**リマインダー**を制作しました！
※ 個人的に使用することだけを目的に制作しています。

「1日の生活の中で圧倒的に触ることの多いアプリ＝LINE」であった為、LINEならスルーすることが少ないと考え、**LINE Messaging API**を使用して実装しています。

### 仕様

ゴミ出し、ヨガの予約、ストレッチしなさい、の通知をそれぞれ週、曜日指定日の夜10時にLINEで通知

### 詳細説明

 - 制作期間: 2020/8/2 ~ 8/3
 - 定期実行は**Heroku Scheduler**

### 制作

<a href="https://github.com/fo-ji"><img src="https://avatars0.githubusercontent.com/u/57491651?s=460&v=4" height="100px;" /></a>

### 環境/Gem(ver)

* Ruby (2.5.1)
* Rails (5.2.4.3)
* PostgreSQL
* Heroku

 - gem 'dotenv-rails'
 - gem 'line-bot-api'
 