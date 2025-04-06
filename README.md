# プリキュア誕生日カレンダー
プリキュアシリーズに登場するキャラの誕生日をまとめたカレンダーです

https://sue445.github.io/precure-birthday-calendar/

[![CircleCI](https://circleci.com/gh/sue445/precure-birthday-calendar/tree/master.svg?style=svg)](https://circleci.com/gh/sue445/precure-birthday-calendar/tree/master)

## ical一覧
icalのURLをGoogleカレンダーなどに登録することで、自分のカレンダーに表示することができます

* プリキュア : https://sue445.github.io/precure-birthday-calendar/precure.ics
* プリキュアのサブキャラ : https://sue445.github.io/precure-birthday-calendar/sub_characters.ics
* Dancing☆Starプリキュア : https://sue445.github.io/precure-birthday-calendar/dancing_star.ics

## 誕生日の編集方法
[rubicure](https://github.com/sue445/rubicure) のデータからicsを自動生成します。

rubicureに載っていないキャラの誕生日は [config/sub_characters.yml](config/sub_characters.yml) を編集してください

[docs/](docs/) の `ics` ファイルはCIでcommitされるので基本的に手動変更不要です。
