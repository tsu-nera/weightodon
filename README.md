WeightoDon
===

Ruby on Rails製の体重を記録するWebサービスです。

マストドンや、スマート体重計、スマートスピーカーと連携できます。

[![Image from Gyazo](https://i.gyazo.com/e4e1cf43f2d9d0463f3111e54af8654a.png)](https://gyazo.com/e4e1cf43f2d9d0463f3111e54af8654a)

- ダッシュボード

  https://weightodon.herokuapp.com/

- マストドン
  
  https://weightodon.site

## Description

日々の体重を入力して、グラフを作成、表示することができます。Twitterのクローンであるマストドンと連携できます。また、NokiaやFitbitなどのスマート体重計と連携できます。さらに、Google HomeやAmazon Alexaなどのスマートスピーカーと連携できます。

### マストドン連携

- https://weightodon.site

TwitterやFacebookに自分の体重を投稿するのは、恥ずかしいと思う人が多いと考え、匿名性の閉鎖的なSNSを用意したいと考えました。自前でFollow/Like機能を実装するのは工数がかかるため、OSSであるマストドンと連携させることで、機能を組み込むことにしました。マストドンインスタンスは、さくらVPS上でdockerを動かし、その上に構築しました。

### スマート体重計連携

以下のスマート体重計と連携できます。

- Nokia(Withings)
- Fitbit

スマート体重計からWeightoDonに対して体重の自動投稿ができます。また、投稿が完了すると、マストドンにも通知されます。こちらも、工数と拡張性を考え、自前で認証機能を実装せずに、IFTTTサービスを利用しました。

### スマートスピーカー連携

以下のスマートスピーカーと連携できます。

- Google Home
- Amazon Alexa

体重記録でもっとも煩わしいのは、スマホの体重記録アプリを起動して、体重を入力することだと考え、スマートスピーカーからの音声入力をサポートしました。こちらも、IFTTTサービスを利用しています。

## Dependency

see Gemfile

## Install

このプロジェクトは docker-composeで構成管理をしている。

```bash
$ git clone https://github.com/tsu-nera/weightodon.git
$ cd weightodon
$ docker-commpose build
$ docker-compose up -d
```

http://localhost:3001 にアクセス。終了するときは、`docker-compose down`

## Usage

See [Wiki](https://github.com/tsu-nera/weightodon/wiki/WeighoDon%E3%81%AE%E4%BD%BF%E3%81%84%E6%96%B9) for more details.

# Authors
[@tsu-nera](https://twitter.com/tsu_nera)

## References

- [TechAcademyの最終課題でWebサービスをつくった \- Qiita](https://qiita.com/tsu-nera/items/b80fb54c8947a160346f)

- 企画書(Google Document)

  https://docs.google.com/document/d/1721Zcqjhb9AqubJigqQEoGYz5SfgwszF6qinSpVi7BU/edit?usp=sharing

- 機能仕様書(Google Document)

  https://docs.google.com/document/d/13FRd2uKHB69zKxq10cxEre0nLXosVcaE3j7RC0lVyEU/edit?usp=sharing

- 設計図(Cacoo)

  https://cacoo.com/diagrams/zhADMfoiy6liaIyZ
  	
- ソースコード(GitHub)

  https://github.com/tsu-nera/weightodon
  
- 課題管理(GitHub)

  https://github.com/tsu-nera/weightodon/projects/1
  

- 障害管理(GitHub)

  https://github.com/tsu-nera/weightodon/issues
  
  
- ヘルプ(GitHub)

  https://github.com/tsu-nera/weightodon/wiki
