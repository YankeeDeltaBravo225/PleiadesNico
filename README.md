# PleiadesNico

Niconico douga player for iOS
 
# ユーザ向け

## 概要

PleiadesNicoはオープンソースのiOS向けのニコニコ動画プレイヤーアプリです。  
iNicoやSmilePlayerといった偉大なアプリと比べると安定性や機能面などの点で  
まだまだ物足りないと思いますが温かい目で見守って頂ければ幸いです。

## 動作環境

* iOS 14以降
* iPhone, iPad両対応

## 機能・制約

現在サポートしている機能は以下の通りです

### サポート機能

* ランキング表示
* 動画検索
  * 動画ID or URL直貼り付けも対応
* ユーザ動画の再生/コメント表示

### 将来サポート予定

* マイリスト機能
* 動画説明文からのジャンプ
* チャンネル動画の再生・コメント表示
* コメントのコマンド(shita, redなど)
* ゲーム機からのコメントのフィルター機能

### サポート予定なし

* Android対応
  * 完全にApple用で作り込んでいるので1から作り直しになるため
  * SwiftでAndroidアプリを動かせるようになればあるいは
* 古いiOS対応
  * GUIをiOS14の新機能であるSwiftUI2で組んでいるため

# For Developpers

## Environment

* Xcode 12.4
* Swift 5
* SwiftUI 2

## Dependency

PleiadesNico employs Swift Package Manager.  
Following packages are required.

* Kanna 5.2.4
  * https://github.com/tid-kijyun/Kanna
* SDWebImageSwiftUI 2.0.2
  * https://github.com/SDWebImage/SDWebImageSwiftUI

## Author
 
* YankeeDeltaBravo225
* Qiita   : https://qiita.com/YankeeDeltaBravo225
* Twitter : https://twitter.com/AppsPleiades
 
## License
 
PleiadesNico is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).  
However, commecial use is restricted due to the license of Snapshot search API.  
( https://site.nicovideo.jp/search-api-docs/snapshot )
