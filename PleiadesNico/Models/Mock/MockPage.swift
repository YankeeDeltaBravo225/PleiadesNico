//
//  MockPage.swift
//  XML_Sample
//
//  Created by katot on 2021/04/04.
//

import Foundation


let mockSearchResult = #"""
<nicovideo_thumb_response status="ok">
<thumb>
<video_id>sm38503463</video_id>
<title>【Besiege】霊夢と魔理沙の異世界アーマードコア転移記　第2話　本社襲来</title>
<description>
プリウスでニコニコ本社に衝突し、異世界に転移した霊夢と魔理沙が、現地で戦いながら旅をする物語です。作成した機体を公開しています。ご自由にご利用ください。https://steamcommunity.com/profiles/76561198857995655/myworkshopfiles/?appid=346010沢井橘花のTwitterに他のニコ動やYouTubeのアカウントへのリンクを固定ツイートしています。時間がある時にでもぜひご覧ください。Twitter（沢井橘花）https://twitter.com/BoCx5x32CMd81veTwitter（大スッポンポン帝国広報部）https://twitter.com/IeF7t8TnCfzOozI
</description>
<thumbnail_url>
https://nicovideo.cdn.nimg.jp/thumbnails/38503463/38503463.84820808
</thumbnail_url>
<first_retrieve>2021-03-29T10:24:02+09:00</first_retrieve>
<length>15:10</length>
<movie_type>mp4</movie_type>
<size_high>1</size_high>
<size_low>1</size_low>
<view_counter>144124</view_counter>
<comment_num>100</comment_num>
<mylist_counter>11</mylist_counter>
<last_res_body>
いらない 森君強いの管制室あり ジノーヴィ…困ります 色々と再現率がすごか まーたジノがロリコン ネタが多すぎて困る キサラギ製モニターw オプレッサーは草 いつまで見てんだww OPの再現度すげぇww フレアもあるのかw ...
</last_res_body>
<watch_url>https://www.nicovideo.jp/watch/sm38503463</watch_url>
<thumb_type>video</thumb_type>
<embeddable>1</embeddable>
<no_live_play>0</no_live_play>
<tags domain="jp">
<tag lock="1">Besiege</tag>
<tag lock="1">ゆっくり実況プレイ</tag>
<tag lock="1">Besiege歩行部</tag>
<tag lock="1">アーマードコア</tag>
<tag lock="1">変態企業</tag>
<tag lock="1">運営爆破シリーズ</tag>
<tag lock="1">GTA</tag>
<tag lock="1">エヴァンゲリオン</tag>
<tag lock="1">宇宙戦艦ヤマト</tag>
<tag lock="1">ブラックナイト山田</tag>
<tag lock="1">プレイヤーキル大好きプレイヤー</tag>
</tags>
<genre>ゲーム</genre>
<user_id>92026298</user_id>
<user_nickname>沢井橘花きまぐれチャンネル</user_nickname>
<user_icon_url>
https://secure-dcdn.cdn.nimg.jp/nicoaccount/usericon/s/9202/92026298.jpg?1570790674
</user_icon_url>
</thumb>
</nicovideo_thumb_response>
"""#


let mockVideoPagePremium = #"""
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">      <link rel="preconnect" href="https://nicovideo.cdn.nimg.jp/web/"><link rel="preconnect" href="https://ads.nicovideo.jp/"><link rel="preconnect" href="https://nicovideo.cdn.nimg.jp/web/"><link rel="preconnect" href="http://nmsg.nicovideo.jp/api/"><link rel="preconnect" href="https://ads.nicovideo.jp/"><link rel="preconnect" href="https://public.api.nicovideo.jp/"><link rel="preconnect" href="https://www.googletagmanager.com">      <link rel="prefetch" href="https://nicovideo.cdn.nimg.jp/web/styles/pages/watch_failover2flash.css?423f64f8" id="js-failover2flash-css">      <link rel="preload" href="https://res.ads.nicovideo.jp/assets/js/ads2.js?ref=video" as="script"><link rel="preload" href="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/failover2flash/watch_failover2flash.js?025a757e" crossorigin="anonymous" as="script"><link rel="preload" href="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/modern/watch_dll_1dd5a508ec69c8342f29.js" crossorigin="anonymous" as="script"><link rel="preload" href="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/modern/watch_app_fcdc74bd44bef7f9c267.js" crossorigin="anonymous" as="script">      <link rel="shortcut icon" href="https://nicovideo.cdn.nimg.jp/web/images/favicon/favicon.ico"><link rel="icon" type="image/png" href="https://nicovideo.cdn.nimg.jp/web/images/favicon/32.png" sizes="32x32"><link rel="icon" type="image/png" href="https://nicovideo.cdn.nimg.jp/web/images/favicon/48.png" sizes="48x48"><link rel="icon" type="image/png" href="https://nicovideo.cdn.nimg.jp/web/images/favicon/96.png" sizes="96x96"><link rel="icon" type="image/png" href="https://nicovideo.cdn.nimg.jp/web/images/favicon/144.png" sizes="144x144">

    <title>「ヤフー検索　クッキー☆」篇.CM - ニコニコ動画</title>    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <script type="text/javascript">
      window.watch__startTime = Date.now();
      window.NativeDate = Date;
                  
      if (Math.random() < 1) {
        window.Ads = { protocol: 'https:' };
      }
      
    </script>

    <meta property="fb:app_id" content="378853695459932">
        <script type="text/javascript">
  window.NicoGoogleTagManagerDataLayer = [];

  const data = {};

    data.user = (function() {
    const user = {};

              user.user_id = '8520242';
      user.login_status = 'login';
      user.member_status = 'premium';
      user.birthday = '1982-09-02';
      user.sex = 'male';
      user.country = 'Japan';
      user.prefecture = '神奈川県';
      user.ui_area = 'jp';
      user.ui_lang = 'ja-jp';

        
    return user;
  })();

    data.content = (function() {
    const content = {};

              content.player_type = 'html5';
      content.genre = "その他";
      content.content_type = "user";

                    return content;
  })();

  window.NicoGoogleTagManagerDataLayer.push(data);
</script>

    <script>
  
  (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
  })(window,document,'script','NicoGoogleTagManagerDataLayer','GTM-KXT7G5G');
  
</script>

    
    

    <link rel="stylesheet" type="text/css" href="https://nicovideo.cdn.nimg.jp/web/styles/pages/watch.css?c34154ae">
  </head>
  <body class="is-beforeInitialize ja-jp">

    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KXT7G5G" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>


    <div class="BaseLayout">
            <link href="https://nicovideo.cdn.nimg.jp/web/styles/modules/navigation/common_header/common_header.css?1593591677" rel="stylesheet">
<div id="CommonHeader" class="CommonHeader" data-common-header="{&quot;initConfig&quot;:{&quot;frontendId&quot;:6,&quot;frontendVersion&quot;:&quot;0&quot;,&quot;site&quot;:&quot;niconico&quot;,&quot;debug&quot;:{&quot;showAppeal&quot;:false},&quot;baseUrl&quot;:{&quot;accountUrl&quot;:&quot;https:\/\/account.nicovideo.jp&quot;,&quot;channelUrl&quot;:&quot;https:\/\/ch.nicovideo.jp&quot;,&quot;communityUrl&quot;:&quot;https:\/\/com.nicovideo.jp&quot;,&quot;nicoadUrl&quot;:&quot;https:\/\/nicoad.nicovideo.jp&quot;,&quot;niconicoUrl&quot;:&quot;https:\/\/www.nicovideo.jp&quot;},&quot;customization&quot;:{&quot;cmnhdRef&quot;:{&quot;page&quot;:&quot;watch&quot;},&quot;nextUrl&quot;:&quot;\/watch\/sm34603631&quot;,&quot;logoutNextUrl&quot;:&quot;\/&quot;,&quot;size&quot;:{&quot;hMargin&quot;:&quot;auto&quot;,&quot;maxWidth&quot;:&quot;1024px&quot;,&quot;minWidth&quot;:&quot;1024px&quot;},&quot;userPanelLinks&quot;:[{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/video_top&quot;,&quot;label&quot;:&quot;\u30cb\u30b3\u30cb\u30b3\u52d5\u753bTOP&quot;},{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/ranking&quot;,&quot;label&quot;:&quot;\u30e9\u30f3\u30ad\u30f3\u30b0&quot;},{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/my\/watchlater&quot;,&quot;label&quot;:&quot;\u3042\u3068\u3067\u898b\u308b&quot;},{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/my\/mylist&quot;,&quot;label&quot;:&quot;\u30de\u30a4\u30ea\u30b9\u30c8&quot;},{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/my\/history\/video&quot;,&quot;label&quot;:&quot;\u8996\u8074\u5c65\u6b74&quot;},{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/my\/follow&quot;,&quot;label&quot;:&quot;\u30d5\u30a9\u30ed\u30fc\u4e2d&quot;},{&quot;href&quot;:&quot;https:\/\/www.upload.nicovideo.jp\/garage\/&quot;,&quot;label&quot;:&quot;\u6295\u7a3f\u52d5\u753b\uff0f\u52d5\u753b\u3092\u6295\u7a3f\u3059\u308b&quot;},{&quot;href&quot;:&quot;https:\/\/blog.nicovideo.jp\/niconews\/category\/videotop\/&quot;,&quot;label&quot;:&quot;\u30cb\u30b3\u30cb\u30b3\u30a4\u30f3\u30d5\u30a9&quot;}]},&quot;user&quot;:{&quot;isLogin&quot;:true,&quot;id&quot;:8520242,&quot;isPremium&quot;:true,&quot;nickname&quot;:&quot;\u7434\u5439\u30da\u30a4\u30f3\u30c8\uff08\u682a\uff09&quot;,&quot;iconUrl&quot;:&quot;https:\/\/secure-dcdn.cdn.nimg.jp\/nicoaccount\/usericon\/852\/8520242.jpg?1460465707&quot;}},&quot;language&quot;:&quot;ja&quot;,&quot;commonHeaderBaseUrl&quot;:&quot;https:\/\/secure-dcdn.cdn.nimg.jp\/&quot;}"></div>

            
      <div id="js-app"></div>
      <div id="js-initial-watch-data" data-api-data="{&quot;ads&quot;:null,&quot;category&quot;:null,&quot;channel&quot;:null,&quot;client&quot;:{&quot;nicosid&quot;:&quot;1577806708.1185641383&quot;,&quot;watchId&quot;:&quot;sm34603631&quot;,&quot;watchTrackId&quot;:&quot;WiIaig2NDN_1618129786553&quot;},&quot;comment&quot;:{&quot;server&quot;:{&quot;url&quot;:&quot;https:\/\/nmsg.nicovideo.jp\/api\/&quot;},&quot;keys&quot;:{&quot;userKey&quot;:&quot;1618131586.~1~L3D9CXyoAkJC-aUhv474quZjEgd0GLXpEtbkmBqpap0&quot;},&quot;layers&quot;:[{&quot;index&quot;:0,&quot;isTranslucent&quot;:false,&quot;threadIds&quot;:[{&quot;id&quot;:1549699624,&quot;fork&quot;:1}]},{&quot;index&quot;:1,&quot;isTranslucent&quot;:false,&quot;threadIds&quot;:[{&quot;id&quot;:1549699624,&quot;fork&quot;:0},{&quot;id&quot;:1549699624,&quot;fork&quot;:2}]}],&quot;threads&quot;:[{&quot;id&quot;:1549699624,&quot;fork&quot;:1,&quot;isActive&quot;:false,&quot;isDefaultPostTarget&quot;:false,&quot;isEasyCommentPostTarget&quot;:false,&quot;isLeafRequired&quot;:false,&quot;isOwnerThread&quot;:true,&quot;isThreadkeyRequired&quot;:false,&quot;threadkey&quot;:null,&quot;is184Forced&quot;:false,&quot;hasNicoscript&quot;:true,&quot;label&quot;:&quot;owner&quot;,&quot;postkeyStatus&quot;:0,&quot;server&quot;:&quot;https:\/\/nmsg.nicovideo.jp&quot;},{&quot;id&quot;:1549699624,&quot;fork&quot;:0,&quot;isActive&quot;:true,&quot;isDefaultPostTarget&quot;:true,&quot;isEasyCommentPostTarget&quot;:false,&quot;isLeafRequired&quot;:true,&quot;isOwnerThread&quot;:false,&quot;isThreadkeyRequired&quot;:false,&quot;threadkey&quot;:null,&quot;is184Forced&quot;:false,&quot;hasNicoscript&quot;:false,&quot;label&quot;:&quot;default&quot;,&quot;postkeyStatus&quot;:0,&quot;server&quot;:&quot;https:\/\/nmsg.nicovideo.jp&quot;},{&quot;id&quot;:1549699624,&quot;fork&quot;:2,&quot;isActive&quot;:true,&quot;isDefaultPostTarget&quot;:false,&quot;isEasyCommentPostTarget&quot;:true,&quot;isLeafRequired&quot;:true,&quot;isOwnerThread&quot;:false,&quot;isThreadkeyRequired&quot;:false,&quot;threadkey&quot;:null,&quot;is184Forced&quot;:false,&quot;hasNicoscript&quot;:false,&quot;label&quot;:&quot;easy&quot;,&quot;postkeyStatus&quot;:0,&quot;server&quot;:&quot;https:\/\/nmsg.nicovideo.jp&quot;}],&quot;ng&quot;:{&quot;ngScore&quot;:{&quot;isDisabled&quot;:false},&quot;channel&quot;:[],&quot;owner&quot;:[],&quot;viewer&quot;:{&quot;revision&quot;:219,&quot;count&quot;:10,&quot;items&quot;:[{&quot;type&quot;:&quot;word&quot;,&quot;source&quot;:&quot;\u7d50\u5a5a\u3057\u3066&quot;,&quot;registeredAt&quot;:&quot;2009-09-19T17:07:34+09:00&quot;},{&quot;type&quot;:&quot;word&quot;,&quot;source&quot;:&quot;\u5897\u7530\u864e\u9054&quot;,&quot;registeredAt&quot;:&quot;2009-11-10T19:52:03+09:00&quot;},{&quot;type&quot;:&quot;word&quot;,&quot;source&quot;:&quot;\u3046\u3093\uff13\uff13&quot;,&quot;registeredAt&quot;:&quot;2010-08-10T22:17:03+09:00&quot;},{&quot;type&quot;:&quot;word&quot;,&quot;source&quot;:&quot;\u8650\u5f85&quot;,&quot;registeredAt&quot;:&quot;2010-09-18T09:23:26+09:00&quot;},{&quot;type&quot;:&quot;word&quot;,&quot;source&quot;:&quot;viva la revolution!&quot;,&quot;registeredAt&quot;:&quot;2011-04-24T13:21:52+09:00&quot;},{&quot;type&quot;:&quot;word&quot;,&quot;source&quot;:&quot;\u8d64\u5b57&quot;,&quot;registeredAt&quot;:&quot;2011-05-30T21:53:01+09:00&quot;},{&quot;type&quot;:&quot;word&quot;,&quot;source&quot;:&quot;\u304d\u3057\u3081\u3048\u3048\u3048&quot;,&quot;registeredAt&quot;:&quot;2011-09-03T23:35:05+09:00&quot;},{&quot;type&quot;:&quot;word&quot;,&quot;source&quot;:&quot;\u50d5\u3092\u53f3\u30af\u30ea\u30c3\u30af\u3057\u3066&quot;,&quot;registeredAt&quot;:&quot;2011-10-01T01:45:36+09:00&quot;},{&quot;type&quot;:&quot;word&quot;,&quot;source&quot;:&quot;F5&quot;,&quot;registeredAt&quot;:&quot;2011-11-04T20:25:51+09:00&quot;},{&quot;type&quot;:&quot;id&quot;,&quot;source&quot;:&quot;z_BDjZ-HuK7_4tlVHcNmtntpPSU&quot;,&quot;registeredAt&quot;:&quot;2020-09-03T22:42:02+09:00&quot;}]}},&quot;isAttentionRequired&quot;:false},&quot;community&quot;:null,&quot;easyComment&quot;:{&quot;phrases&quot;:[{&quot;text&quot;:&quot;\u3046\u307d\u3064&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;\u3046\u307d\u3064&quot;,&quot;viewTitle&quot;:&quot;\u3046\u307d\u3064&quot;,&quot;summary&quot;:&quot;\u3046\u307d\u3064\u3068\u306f\u3046\uff50\u4e59\u306e\u3053\u3068\u3067\u3046\uff50(\u30a2\u30c3\u30d7\u30ed\u30fc\u30c9)\u4e59(\u304a\u75b2\u308c\u69d8\u3067\u3059)\u3068\u3044\u3046\u610f\u5473\u3002\u8a9e\u6e90\u306f\u3046\uff50\u3068\u4e59\u3092\u30ed\u30fc\u30de\u5b57\u3067\u6253\u3064\u3068\u300c\u3046\u307d\u3064\u300d\uff08up otu\u2192u po tu\uff09\u306b\u306a\u308b\u3053\u3068\u304b\u3089\u3002\n\u985e\u7fa9\u8a9e\u306b\u3046\u3071\u308a\u304c\u3042\u308b\u3002\n\u95a2\u9023\u9805\u76ee\n&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%E3%81%86%E3%81%BD%E3%81%A4&quot;}},{&quot;text&quot;:&quot;www&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;www&quot;,&quot;viewTitle&quot;:&quot;www&quot;,&quot;summary&quot;:&quot;www\u3068\u306f\n World Wide Web\uff08\u30ef\u30fc\u30eb\u30c9\u30ef\u30a4\u30c9\u30a6\u30a7\u30d6\uff09\n ASIAN KUNG-FU GENERATION\u306e4th\u30d5\u30eb\u30a2\u30eb\u30d0\u30e0\u300e\u30ef\u30fc\u30eb\u30c9\u00a0\u30ef\u30fc\u30eb\u30c9\u00a0\u30ef\u30fc\u30eb\u30c9\u300f\u306e\u7701\u7565\u8868\u8a18\n QuinRose&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/www&quot;}},{&quot;text&quot;:&quot;\u3059\u304d&quot;,&quot;nicodic&quot;:null},{&quot;text&quot;:&quot;\u3053\u3053\u3059\u304d&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;\u3053\u3053\u3059\u304d&quot;,&quot;viewTitle&quot;:&quot;\u3053\u3053\u3059\u304d&quot;,&quot;summary&quot;:&quot;\u767a\u7965\n\u30a2\u30a4\u30de\u30b9MAD\u300c\u3082\u3063\u3068\u3059\u3044\u307f\u3093\u3076\u305d\u304f\u300d\u304c\u767a\u7965\u3067\u3042\u308b\n\u666e\u53ca\n\u30cb\u30b3\u30cb\u30b3\u52d5\u753b\u3067\u306e\u516c\u5f0f\u30a2\u30cb\u30e1\u914d\u4fe1\u4ee5\u964d\u3001\u4ed6\u306e\u30a2\u30cb\u30e1\u306eOP\u3067\u300c\u3053\u3053\u3059\u304d\u300d\u3068\u3044\u3046\u30b3\u30e1\u30f3\u30c8\u304c\u5ea6\u3005\u898b\u53d7\u3051\u3089\u308c\u3066\u3044\u305f\u304c\u3001\n\u300c\u82b1\u54b2\u304f\u3044\u308d\u306f\u300d\u306eOP\u3067\u306e\u5f3e&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%E3%81%93%E3%81%93%E3%81%99%E3%81%8D&quot;}},{&quot;text&quot;:&quot;\uff01\uff1f&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;!?&quot;,&quot;viewTitle&quot;:&quot;\uff01\uff1f&quot;,&quot;summary&quot;:&quot;\u6982\u8981!?\n!?\u3068\u306f\&quot;\u5f37\u70c8\&quot;\u304b\u3064\&quot;\u7406\u89e3\u4e0d\u80fd\&quot;\u306a\u9a5a\u304d\u3092\u793a\u3059\u7d04\u7269\uff08\u8a18\u53f7\uff09\u3067\u3042\u308b\u2026!?\n\u5c02\u9580\u7528\u8a9e\u3067\u306f\u300c\u611f\u5606\u7b26\u7591\u554f\u7b26\u300d\u3068\u3044\u3046\u540d\u524d\u3067\u3042\u308b\u3002\u6295\u3052\u3084\u308a\u3058\u3083\u306d\u3048\u304b!?\n\u7565\u3059\u308b\u3068\u300c\u611f\u5606\u4fee\u8f9e\u7591\u554f\u7b26\u300d\u3068\u3044\u3046\u9577\u3063\u305f\u3089\u3057\u3044\u4e0a\u306b\u3088&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%21%3F&quot;}},{&quot;text&quot;:&quot;\u304a\u3064&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;\u304a\u3064&quot;,&quot;viewTitle&quot;:&quot;\u304a\u3064&quot;,&quot;summary&quot;:&quot;\u4e59\u3068\u306f\u3001\u4ee5\u4e0b\u306e\u3053\u3068\u3092\u8868\u3059\u3002\n \u4e59\uff08\u304a\u3064\u3001\u304d\u306e\u3068\uff09 - \u5341\u5e72\u306e\u7b2c2\u4f4d\u3002\u4e94\u884c\u306f\u6728\u3001\u9670\u967d\u306f\u9670\u3002\u8349\u82b1\u3092\u8c61\u5fb4\u3057\u3001\u5354\u8abf\u30fb\u793e\u4ea4\u30fb\u548c\u5408\u3092\u610f\u5473\u3059\u308b\u3002\n \u4e59\uff08\u304a\u3064\uff09 - \u7532\u3067\u59cb\u307e\u308b\u9806\u4f4d\u306e\u7b2c2\u4f4d\u3002\u300c\u4e59\u7a2e\u300d\u300c\u7532\u4e59\u3064\u3051\u304c\u305f\u3044\u300d&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%E3%81%8A%E3%81%A4&quot;}},{&quot;text&quot;:&quot;88888888&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;88888888&quot;,&quot;viewTitle&quot;:&quot;88888888&quot;,&quot;summary&quot;:&quot;8\u306f\u6574\u6570\u306e\u3072\u3068\u3064\u30027\u306e\u6b21\u30019\u306e\u524d\u3002\n\u6982\u8981\n \u9178\u7d20(O)\u306e\u539f\u5b50\u756a\u53f7\u3002\n \u6a2a\u306b\u5012\u3059\u3068\u221e\u306b\u306a\u3063\u3066\u3057\u307e\u3046\u306e\u3067\u6ce8\u610f\u30028\u304b\u3089\u305a\u3044\u3076\u3093\u96e2\u308c\u3066\u3057\u307e\u3046\u3002\n \u300c\u516b\u300d\u306f\u672b\u5e83\u304c\u308a\u306e\u5f62\u3092\u3057\u3066\u3044\u308b\u305f\u3081\u3001\u7e01\u8d77\u306e\u826f\u3044\u6570\u3068\u3055\u308c\u308b\u3002\n &quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/88888888&quot;}}]},&quot;external&quot;:{&quot;commons&quot;:{&quot;hasContentTree&quot;:false},&quot;ichiba&quot;:{&quot;isEnabled&quot;:true}},&quot;genre&quot;:{&quot;key&quot;:&quot;other&quot;,&quot;label&quot;:&quot;\u305d\u306e\u4ed6&quot;,&quot;isImmoral&quot;:false,&quot;isDisabled&quot;:false,&quot;isNotSet&quot;:false},&quot;marquee&quot;:{&quot;isDisabled&quot;:false,&quot;tagRelatedLead&quot;:null},&quot;media&quot;:{&quot;delivery&quot;:{&quot;recipeId&quot;:&quot;nicovideo-sm34603631&quot;,&quot;encryption&quot;:null,&quot;movie&quot;:{&quot;contentId&quot;:&quot;out1&quot;,&quot;audios&quot;:[{&quot;id&quot;:&quot;archive_aac_192kbps&quot;,&quot;isAvailable&quot;:true,&quot;metadata&quot;:{&quot;bitrate&quot;:192000,&quot;samplingRate&quot;:44100,&quot;loudness&quot;:{&quot;integratedLoudness&quot;:-16.39999999999999857891452847979962825775146484375,&quot;truePeak&quot;:-3.29999999999999982236431605997495353221893310546875},&quot;levelIndex&quot;:1,&quot;loudnessCollection&quot;:[{&quot;type&quot;:&quot;video&quot;,&quot;value&quot;:1},{&quot;type&quot;:&quot;pureAdPreroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;houseAdPreroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;networkAdPreroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;pureAdMidroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;houseAdMidroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;networkAdMidroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;pureAdPostroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;houseAdPostroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;networkAdPostroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;nicoadVideoIntroduce&quot;,&quot;value&quot;:0.7585775750291838814831635318114422261714935302734375},{&quot;type&quot;:&quot;nicoadBillboard&quot;,&quot;value&quot;:1},{&quot;type&quot;:&quot;marquee&quot;,&quot;value&quot;:0.954992586021436107301951778936199843883514404296875}]}},{&quot;id&quot;:&quot;archive_aac_64kbps&quot;,&quot;isAvailable&quot;:true,&quot;metadata&quot;:{&quot;bitrate&quot;:64000,&quot;samplingRate&quot;:44100,&quot;loudness&quot;:{&quot;integratedLoudness&quot;:-16.39999999999999857891452847979962825775146484375,&quot;truePeak&quot;:-3.29999999999999982236431605997495353221893310546875},&quot;levelIndex&quot;:0,&quot;loudnessCollection&quot;:[{&quot;type&quot;:&quot;video&quot;,&quot;value&quot;:1},{&quot;type&quot;:&quot;pureAdPreroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;houseAdPreroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;networkAdPreroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;pureAdMidroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;houseAdMidroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;networkAdMidroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;pureAdPostroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;houseAdPostroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;networkAdPostroll&quot;,&quot;value&quot;:0.60255958607435788909612028874107636511325836181640625},{&quot;type&quot;:&quot;nicoadVideoIntroduce&quot;,&quot;value&quot;:0.7585775750291838814831635318114422261714935302734375},{&quot;type&quot;:&quot;nicoadBillboard&quot;,&quot;value&quot;:1},{&quot;type&quot;:&quot;marquee&quot;,&quot;value&quot;:0.954992586021436107301951778936199843883514404296875}]}}],&quot;videos&quot;:[{&quot;id&quot;:&quot;archive_h264_720p&quot;,&quot;isAvailable&quot;:true,&quot;metadata&quot;:{&quot;label&quot;:&quot;720p&quot;,&quot;bitrate&quot;:2000000,&quot;resolution&quot;:{&quot;width&quot;:1280,&quot;height&quot;:720},&quot;levelIndex&quot;:3,&quot;recommendedHighestAudioLevelIndex&quot;:1}},{&quot;id&quot;:&quot;archive_h264_480p&quot;,&quot;isAvailable&quot;:true,&quot;metadata&quot;:{&quot;label&quot;:&quot;480p&quot;,&quot;bitrate&quot;:1590312,&quot;resolution&quot;:{&quot;width&quot;:854,&quot;height&quot;:480},&quot;levelIndex&quot;:2,&quot;recommendedHighestAudioLevelIndex&quot;:1}},{&quot;id&quot;:&quot;archive_h264_360p&quot;,&quot;isAvailable&quot;:true,&quot;metadata&quot;:{&quot;label&quot;:&quot;360p&quot;,&quot;bitrate&quot;:600000,&quot;resolution&quot;:{&quot;width&quot;:640,&quot;height&quot;:360},&quot;levelIndex&quot;:1,&quot;recommendedHighestAudioLevelIndex&quot;:1}},{&quot;id&quot;:&quot;archive_h264_360p_low&quot;,&quot;isAvailable&quot;:true,&quot;metadata&quot;:{&quot;label&quot;:&quot;\u4f4e\u753b\u8cea&quot;,&quot;bitrate&quot;:300000,&quot;resolution&quot;:{&quot;width&quot;:640,&quot;height&quot;:360},&quot;levelIndex&quot;:0,&quot;recommendedHighestAudioLevelIndex&quot;:1}}],&quot;session&quot;:{&quot;recipeId&quot;:&quot;nicovideo-sm34603631&quot;,&quot;playerId&quot;:&quot;nicovideo-6-WiIaig2NDN_1618129786553&quot;,&quot;videos&quot;:[&quot;archive_h264_720p&quot;,&quot;archive_h264_480p&quot;,&quot;archive_h264_360p&quot;,&quot;archive_h264_360p_low&quot;],&quot;audios&quot;:[&quot;archive_aac_192kbps&quot;,&quot;archive_aac_64kbps&quot;],&quot;movies&quot;:[],&quot;protocols&quot;:[&quot;http&quot;,&quot;hls&quot;],&quot;authTypes&quot;:{&quot;http&quot;:&quot;ht2&quot;,&quot;hls&quot;:&quot;ht2&quot;},&quot;serviceUserId&quot;:&quot;8520242&quot;,&quot;token&quot;:&quot;{\&quot;service_id\&quot;:\&quot;nicovideo\&quot;,\&quot;player_id\&quot;:\&quot;nicovideo-6-WiIaig2NDN_1618129786553\&quot;,\&quot;recipe_id\&quot;:\&quot;nicovideo-sm34603631\&quot;,\&quot;service_user_id\&quot;:\&quot;8520242\&quot;,\&quot;protocols\&quot;:[{\&quot;name\&quot;:\&quot;http\&quot;,\&quot;auth_type\&quot;:\&quot;ht2\&quot;},{\&quot;name\&quot;:\&quot;hls\&quot;,\&quot;auth_type\&quot;:\&quot;ht2\&quot;}],\&quot;videos\&quot;:[\&quot;archive_h264_360p\&quot;,\&quot;archive_h264_360p_low\&quot;,\&quot;archive_h264_480p\&quot;,\&quot;archive_h264_720p\&quot;],\&quot;audios\&quot;:[\&quot;archive_aac_192kbps\&quot;,\&quot;archive_aac_64kbps\&quot;],\&quot;movies\&quot;:[],\&quot;created_time\&quot;:1618129786000,\&quot;expire_time\&quot;:1618216186000,\&quot;content_ids\&quot;:[\&quot;out1\&quot;],\&quot;heartbeat_lifetime\&quot;:120000,\&quot;content_key_timeout\&quot;:600000,\&quot;priority\&quot;:0.8000000000000000444089209850062616169452667236328125,\&quot;transfer_presets\&quot;:[\&quot;standard2\&quot;]}&quot;,&quot;signature&quot;:&quot;2b7b53e22149c6eb914193c591819691cdfab2b3225389adc9be988ccd279ab1&quot;,&quot;contentId&quot;:&quot;out1&quot;,&quot;heartbeatLifetime&quot;:120000,&quot;contentKeyTimeout&quot;:600000,&quot;priority&quot;:0.8000000000000000444089209850062616169452667236328125,&quot;transferPresets&quot;:[&quot;standard2&quot;],&quot;urls&quot;:[{&quot;url&quot;:&quot;https:\/\/api.dmc.nico\/api\/sessions&quot;,&quot;isWellKnownPort&quot;:true,&quot;isSsl&quot;:true}]}},&quot;storyboard&quot;:{&quot;contentId&quot;:&quot;sb_out1&quot;,&quot;images&quot;:[{&quot;id&quot;:&quot;archive_sb_q95_10x10_160x90px&quot;},{&quot;id&quot;:&quot;archive_sb_q70_10x10_160x90px&quot;}],&quot;session&quot;:{&quot;recipeId&quot;:&quot;nicovideo-sm34603631&quot;,&quot;playerId&quot;:&quot;nicovideo-6-WiIaig2NDN_1618129786553&quot;,&quot;videos&quot;:[&quot;archive_sb_q95_10x10_160x90px&quot;,&quot;archive_sb_q70_10x10_160x90px&quot;],&quot;audios&quot;:[],&quot;movies&quot;:[],&quot;protocols&quot;:[&quot;storyboard&quot;],&quot;authTypes&quot;:{&quot;storyboard&quot;:&quot;ht2&quot;},&quot;serviceUserId&quot;:&quot;8520242&quot;,&quot;token&quot;:&quot;{\&quot;service_id\&quot;:\&quot;nicovideo\&quot;,\&quot;player_id\&quot;:\&quot;nicovideo-6-WiIaig2NDN_1618129786553\&quot;,\&quot;recipe_id\&quot;:\&quot;nicovideo-sm34603631\&quot;,\&quot;service_user_id\&quot;:\&quot;8520242\&quot;,\&quot;protocols\&quot;:[{\&quot;name\&quot;:\&quot;storyboard\&quot;,\&quot;auth_type\&quot;:\&quot;ht2\&quot;}],\&quot;videos\&quot;:[\&quot;archive_sb_q70_10x10_160x90px\&quot;,\&quot;archive_sb_q95_10x10_160x90px\&quot;],\&quot;audios\&quot;:[],\&quot;movies\&quot;:[],\&quot;created_time\&quot;:1618129786000,\&quot;expire_time\&quot;:1618216186000,\&quot;content_ids\&quot;:[\&quot;sb_out1\&quot;],\&quot;heartbeat_lifetime\&quot;:300000,\&quot;content_key_timeout\&quot;:600000,\&quot;priority\&quot;:0.8000000000000000444089209850062616169452667236328125,\&quot;transfer_presets\&quot;:[]}&quot;,&quot;signature&quot;:&quot;02022cc10a6f614b1d5454ff0537fe26ec5b41b777ec9a6859da78895c1f02df&quot;,&quot;contentId&quot;:&quot;sb_out1&quot;,&quot;heartbeatLifetime&quot;:300000,&quot;contentKeyTimeout&quot;:600000,&quot;priority&quot;:0.8000000000000000444089209850062616169452667236328125,&quot;transferPresets&quot;:[],&quot;urls&quot;:[{&quot;url&quot;:&quot;https:\/\/api.dmc.nico\/api\/sessions&quot;,&quot;isWellKnownPort&quot;:true,&quot;isSsl&quot;:true}]}},&quot;trackingId&quot;:&quot;srbs2d18zgqqrr69d40tz19cfq1zvug9qgj03n6hditltyw1jxq7bd+f77jzlsg+p5menoato8+2tjiuc0\/dyzxr7v00vk\/9h2r8b+eawqn=&quot;},&quot;deliveryLegacy&quot;:null},&quot;okReason&quot;:&quot;PURELY&quot;,&quot;owner&quot;:null,&quot;pcWatchPage&quot;:{&quot;tagRelatedBanner&quot;:null,&quot;videoEnd&quot;:{&quot;bannerIn&quot;:null,&quot;overlay&quot;:null},&quot;showOwnerMenu&quot;:false,&quot;showOwnerThreadCoEditingLink&quot;:false,&quot;showMymemoryEditingLink&quot;:false},&quot;player&quot;:{&quot;initialPlayback&quot;:null,&quot;comment&quot;:{&quot;isDefaultInvisible&quot;:false},&quot;layerMode&quot;:0},&quot;ppv&quot;:null,&quot;ranking&quot;:{&quot;genre&quot;:null,&quot;popularTag&quot;:[{&quot;tag&quot;:&quot;\u30af\u30c3\u30ad\u30fc\u2606&quot;,&quot;regularizedTag&quot;:&quot;\u30af\u30c3\u30ad\u30fc\u2606&quot;,&quot;rank&quot;:144,&quot;genre&quot;:&quot;\u305d\u306e\u4ed6&quot;,&quot;dateTime&quot;:&quot;2019-12-03T03:00:00+09:00&quot;}]},&quot;series&quot;:null,&quot;smartphone&quot;:null,&quot;system&quot;:{&quot;serverTime&quot;:&quot;2021-04-11T17:29:46+09:00&quot;,&quot;isPeakTime&quot;:true},&quot;tag&quot;:{&quot;items&quot;:[{&quot;name&quot;:&quot;\u4f8b\u306e\u30a2\u30ec&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:true,&quot;isLocked&quot;:true},{&quot;name&quot;:&quot;\u30af\u30c3\u30ad\u30fc\u2606&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:true,&quot;isLocked&quot;:true},{&quot;name&quot;:&quot;\u30c6\u30ec\u30d3\u4e0b\u5317\u6ca2&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:true,&quot;isLocked&quot;:false},{&quot;name&quot;:&quot;Ahoo&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:false,&quot;isLocked&quot;:false},{&quot;name&quot;:&quot;\u8ab0\u304b\u304c\u3084\u308b\u3068\u601d\u3063\u305f\u30b7\u30ea\u30fc\u30ba&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:true,&quot;isLocked&quot;:false},{&quot;name&quot;:&quot;YaFoo~\u2191&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:false,&quot;isLocked&quot;:false},{&quot;name&quot;:&quot;\u30af\u30c3\u30ad\u30fc&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:true,&quot;isLocked&quot;:false},{&quot;name&quot;:&quot;yahomo\uff01&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:false,&quot;isLocked&quot;:false},{&quot;name&quot;:&quot;yajuu!&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:false,&quot;isLocked&quot;:false},{&quot;name&quot;:&quot;\u98a8\u8a55\u88ab\u5bb3\u30b7\u30ea\u30fc\u30ba&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:true,&quot;isLocked&quot;:false},{&quot;name&quot;:&quot;\u771f\u590f\u306e\u591c\u306e\u6deb\u5922&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:true,&quot;isLocked&quot;:false}],&quot;hasR18Tag&quot;:false,&quot;isPublishedNicoscript&quot;:false,&quot;edit&quot;:{&quot;isEditable&quot;:true,&quot;uneditableReason&quot;:null,&quot;editKey&quot;:&quot;1:1618129786:1549699624:b7c58e861446edcd0a64fc8fe6aeba2a2c6376f0f1c5c2ab83c3c5cc7ba2f7b7&quot;},&quot;viewer&quot;:{&quot;isEditable&quot;:true,&quot;uneditableReason&quot;:null,&quot;editKey&quot;:&quot;1:1618129786:1549699624:b7c58e861446edcd0a64fc8fe6aeba2a2c6376f0f1c5c2ab83c3c5cc7ba2f7b7&quot;}},&quot;video&quot;:{&quot;id&quot;:&quot;sm34603631&quot;,&quot;title&quot;:&quot;\u300c\u30e4\u30d5\u30fc\u691c\u7d22\u3000\u30af\u30c3\u30ad\u30fc\u2606\u300d\u7bc7.CM&quot;,&quot;description&quot;:&quot;\u305d\u3093\u306a\u3053\u3068(\u691c\u7d22)\u3057\u3061\u3083\u3042...\u99c4\u76ee\u3060\u308d\uff01&lt;br&gt;&lt;a href=\&quot;https:\/\/www.youtube.com\/watch?v=Ax_b3pSJ1AI\&quot; target=\&quot;_blank\&quot; rel=\&quot;noopener nofollow\&quot;&gt;https:\/\/www.youtube.com\/watch?v=Ax_b3pSJ1AI&lt;\/a&gt;&quot;,&quot;count&quot;:{&quot;view&quot;:10178,&quot;comment&quot;:61,&quot;mylist&quot;:38,&quot;like&quot;:0},&quot;duration&quot;:17,&quot;thumbnail&quot;:{&quot;url&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/34603631\/34603631.36166&quot;,&quot;middleUrl&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/34603631\/34603631.36166.M&quot;,&quot;largeUrl&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/34603631\/34603631.36166.L&quot;,&quot;player&quot;:&quot;https:\/\/img.cdn.nimg.jp\/s\/nicovideo\/thumbnails\/34603631\/34603631.36166.original\/a960x540l?key=965540a66a8e875eba259d154d51bf935137822ddbe23f6aef569532f85e7b6e&quot;,&quot;ogp&quot;:&quot;https:\/\/img.cdn.nimg.jp\/s\/nicovideo\/thumbnails\/34603631\/34603631.36166.original\/r1280x720l?key=8227d899b2b451cf70fc2d905af7e5d84ea25e07bb47bccc124ffed8ba86b761&quot;},&quot;rating&quot;:{&quot;isAdult&quot;:false},&quot;registeredAt&quot;:&quot;2019-02-09T17:07:01+09:00&quot;,&quot;isPrivate&quot;:false,&quot;isDeleted&quot;:false,&quot;isNoBanner&quot;:false,&quot;isAuthenticationRequired&quot;:false,&quot;isEmbedPlayerAllowed&quot;:true,&quot;viewer&quot;:{&quot;isOwner&quot;:false,&quot;like&quot;:{&quot;isLiked&quot;:false,&quot;count&quot;:null}},&quot;watchableUserTypeForPayment&quot;:&quot;all&quot;,&quot;commentableUserTypeForPayment&quot;:&quot;all&quot;,&quot;9d091f87&quot;:false},&quot;videoAds&quot;:{&quot;additionalParams&quot;:{&quot;videoId&quot;:&quot;sm34603631&quot;,&quot;videoDuration&quot;:17,&quot;isAdultRatingNG&quot;:false,&quot;isAuthenticationRequired&quot;:false,&quot;isR18&quot;:false,&quot;nicosid&quot;:&quot;1577806708.1185641383&quot;,&quot;lang&quot;:&quot;ja-jp&quot;,&quot;watchTrackId&quot;:&quot;WiIaig2NDN_1618129786553&quot;,&quot;genre&quot;:&quot;other&quot;,&quot;gender&quot;:&quot;1&quot;,&quot;age&quot;:38},&quot;items&quot;:[],&quot;reason&quot;:null},&quot;videoLive&quot;:null,&quot;viewer&quot;:{&quot;id&quot;:8520242,&quot;nickname&quot;:&quot;\u7434\u5439\u30da\u30a4\u30f3\u30c8\uff08\u682a\uff09&quot;,&quot;isPremium&quot;:true,&quot;existence&quot;:{&quot;age&quot;:38,&quot;prefecture&quot;:&quot;\u795e\u5948\u5ddd\u770c&quot;,&quot;sex&quot;:&quot;male&quot;}},&quot;waku&quot;:{&quot;information&quot;:null,&quot;bgImages&quot;:[],&quot;addContents&quot;:null,&quot;addVideo&quot;:null,&quot;tagRelatedBanner&quot;:null,&quot;tagRelatedMarquee&quot;:null}}" data-environment="{&quot;baseURL&quot;:{&quot;web&quot;:&quot;https:\/\/www.nicovideo.jp&quot;,&quot;res&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/web&quot;,&quot;dic&quot;:&quot;https:\/\/dic.nicovideo.jp&quot;,&quot;flapi&quot;:&quot;https:\/\/flapi.nicovideo.jp&quot;,&quot;live&quot;:&quot;https:\/\/live.nicovideo.jp&quot;,&quot;live2&quot;:&quot;https:\/\/live2.nicovideo.jp&quot;,&quot;com&quot;:&quot;https:\/\/com.nicovideo.jp&quot;,&quot;ch&quot;:&quot;https:\/\/ch.nicovideo.jp&quot;,&quot;chPublicAPI&quot;:&quot;https:\/\/public-api.ch.nicovideo.jp&quot;,&quot;secureCh&quot;:&quot;https:\/\/secure.ch.nicovideo.jp&quot;,&quot;commons&quot;:&quot;https:\/\/commons.nicovideo.jp&quot;,&quot;commonsAPI&quot;:&quot;https:\/\/api.commons.nicovideo.jp&quot;,&quot;embed&quot;:&quot;https:\/\/embed.nicovideo.jp&quot;,&quot;ext&quot;:&quot;https:\/\/ext.nicovideo.jp&quot;,&quot;nicoMs&quot;:&quot;https:\/\/nico.ms&quot;,&quot;ichiba&quot;:&quot;https:\/\/ichiba.nicovideo.jp&quot;,&quot;ads&quot;:&quot;https:\/\/ads.nicovideo.jp&quot;,&quot;account&quot;:&quot;https:\/\/account.nicovideo.jp&quot;,&quot;secure&quot;:&quot;https:\/\/secure.nicovideo.jp&quot;,&quot;premium&quot;:&quot;https:\/\/premium.nicovideo.jp&quot;,&quot;ex&quot;:&quot;https:\/\/ex.nicovideo.jp&quot;,&quot;qa&quot;:&quot;https:\/\/qa.nicovideo.jp&quot;,&quot;publicAPI&quot;:&quot;https:\/\/public.api.nicovideo.jp&quot;,&quot;commonsPublicAPI&quot;:&quot;https:\/\/public-api.commons.nicovideo.jp\/&quot;,&quot;app&quot;:&quot;http:\/\/app.nicovideo.jp&quot;,&quot;appClientAPI&quot;:&quot;http:\/\/app-cliapi.nicovideo.jp&quot;,&quot;point&quot;:&quot;https:\/\/point.nicovideo.jp&quot;,&quot;enquete&quot;:&quot;http:\/\/enquete.nicovideo.jp&quot;,&quot;notification&quot;:&quot;https:\/\/notification.nicovideo.jp&quot;,&quot;upload&quot;:&quot;https:\/\/www.upload.nicovideo.jp&quot;,&quot;sugoiSearchSystem&quot;:&quot;https:\/\/sug.search.nicovideo.jp&quot;,&quot;nicoad&quot;:&quot;https:\/\/nicoad.nicovideo.jp&quot;,&quot;nicoadAPI&quot;:&quot;https:\/\/api.nicoad.nicovideo.jp&quot;,&quot;secureDCDN&quot;:&quot;https:\/\/secure-dcdn.cdn.nimg.jp&quot;,&quot;seiga&quot;:&quot;https:\/\/seiga.nicovideo.jp&quot;,&quot;nvapi&quot;:&quot;https:\/\/nvapi.nicovideo.jp&quot;},&quot;playlistToken&quot;:&quot;&quot;,&quot;i18n&quot;:{&quot;language&quot;:&quot;ja-jp&quot;,&quot;locale&quot;:&quot;ja_JP&quot;,&quot;area&quot;:&quot;JP&quot;,&quot;footer&quot;:null},&quot;urls&quot;:{&quot;playerHelp&quot;:&quot;https:\/\/qa.nicovideo.jp\/faq\/show\/6116&quot;},&quot;isMonitoringLogUser&quot;:false,&quot;frontendId&quot;:6,&quot;frontendVersion&quot;:&quot;0&quot;,&quot;newPlaylistRate&quot;:1,&quot;newRelatedVideos&quot;:true}" hidden></div>
      <div id="js-failover2flash" class="failover2flash" style="display: none;">
  <div class="failover2flash-header">
    <h1 class="failover2flash-logo">
      <a href="/video_top">ニコニコ動画</a>
    </h1>
  </div>

    <p class="failover2flash-late">ページの読み込みに時間がかかっています</p>

    <p class="failover2flash-error">エラーが発生しました</p>

  <div class="failover2flash-buttonArea">
    <button id="js-failover2flash-reload" class="failover2flash-reload">再読み込み</button>
  </div>
</div>
      <link href="https://nicovideo.cdn.nimg.jp/web/styles/footer.css?1603771323" rel="stylesheet">
<footer class="FooterContainer" data-footer-is-login="true">
  <a href="javascript:void(0)" class="FooterContainer-pageTop" onclick="window.scrollTo(0, 0)">▲ページトップ</a>

                
    <div class="FooterContainer-information">
    <div class="FooterContainer-informationInner">

            <h1 class="FooterContainer-pageLogo">
        <a href="/video_top" class="FooterContainer-pageLogoLink">
          <img src="https://nicovideo.cdn.nimg.jp/web/images/logo/logo_nicovideo_white.svg" alt="ニコニコ動画">
        </a>
      </h1>

            <div classs="FooterContainer-linksContainer">

                <ul class="FooterContainer-links"  data-footer-watch-links style="display: none;">
          <li class="FooterContainer-link"><a href="https://qa.nicovideo.jp/faq/show/6116?site_domain=default">使い方</a></li>
          <li class="FooterContainer-link"><a href="https://qa.nicovideo.jp/faq/show/195?site_domain=default">動画が視聴できない</a></li>
          <li class="FooterContainer-link FooterContainer-requiredLoginLink FooterContainer-attentionLink"><a href="#" data-footer-comment-allegation-base-url="https://secure.nicovideo.jp/secure/comment_allegation/" data-footer-comment-allegation-link>コメント/タグ通報</a></li>
          <li class="FooterContainer-link FooterContainer-requiredLoginLink FooterContainer-attentionLink"><a href="#" data-footer-video-allegation-base-url="https://www.nicovideo.jp/allegation/" data-footer-video-allegation-link>動画通報</a></li>
        </ul>

        <ul class="FooterContainer-links">
          <li class="FooterContainer-link"><a href="https://qa.nicovideo.jp/faq/show/5008?site_domain=default">ご意見・ご要望</a></li>
          <li class="FooterContainer-link"><a href="https://secure.nicovideo.jp/form/feedback_bugreport">不具合報告</a></li>
          <li class="FooterContainer-link"><a href="https://qa.nicovideo.jp/">ヘルプ</a></li>
          <li class="FooterContainer-link"><a href="https://qa.nicovideo.jp/faq/show/1112">動作環境</a></li>
          <li class="FooterContainer-link"><a href="https://account.nicovideo.jp/rules/account">利用規約</a></li>
          <li class="FooterContainer-link"><a target="_blank" href="http://dwango.co.jp/">運営会社</a></li>
        </ul>
        <ul class="FooterContainer-links">
          <li class="FooterContainer-link FooterContainer-breakLink"><a href="https://ex.nicovideo.jp/smile/guideline/">権利侵害に関する動画投稿ガイドライン</a></li>
          <li class="FooterContainer-link"><a href="https://license-search.nicovideo.jp/">動画に使用できる音源の検索</a></li>
          <li class="FooterContainer-link"><a href="http://info.nicovideo.jp/base/phishing.html">フィッシング詐欺にご注意ください</a></li>        </ul>
        <ul class="FooterContainer-links">
          <li class="FooterContainer-link"><a href="https://site.nicovideo.jp/sales_ads">広告出稿に関するお問い合わせ</a></li>
                  </ul>
      </div>

    </div>
  </div>

  <div class="FooterContainer-additionals">
    <div class="FooterContainer-additionalsInner">

      <div class="FooterContainer-metadata">
        <div class="FooterContainer-metadataItem">
          <span class="FooterContainer-metadataLabel">総動画数</span>
          <span class="FooterContainer-metadataValue">18,505,958</span>
          <span class="FooterContainer-metadataLinks">
                      </span>
        </div>
        <div class="FooterContainer-metadataItem">
          <span class="FooterContainer-metadataLabel">総再生数</span>
          <span class="FooterContainer-metadataValue">116,679,799,470</span>
        </div>
        <div class="FooterContainer-metadataItem">
          <span class="FooterContainer-metadataLabel">総コメント数</span>
          <span class="FooterContainer-metadataValue">5,974,282,634</span>
        </div>
        <address class="FooterContainer-metadataAddress">©DWANGO Co., Ltd.</address>
      </div>


      
    </div>
  </div>

</footer>
<script charset="utf-8" src="https://nicovideo.cdn.nimg.jp/web/scripts/modules/view/Footer.js?1599530746" async="1" defer="1"></script>


      <script type="text/javascript" src="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/failover2flash/watch_failover2flash.js?025a757e"></script>
      <script type="text/javascript" charset="utf-8" src="https://res.ads.nicovideo.jp/assets/js/ads2.js?ref=video"></script>
                    <script type="text/javascript" src="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/modern/watch_dll_1dd5a508ec69c8342f29.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/modern/watch_app_fcdc74bd44bef7f9c267.js" crossorigin="anonymous"></script>
      
      <script type="text/javascript">
  
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-1089346-5']);
  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
  
</script>

          </div>

                
  </body>
</html>
"""#


let mockVideoPageEnc = #"""
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">      <link rel="preconnect" href="https://nicovideo.cdn.nimg.jp/web/"><link rel="preconnect" href="https://ads.nicovideo.jp/"><link rel="preconnect" href="https://nicovideo.cdn.nimg.jp/web/"><link rel="preconnect" href="http://nmsg.nicovideo.jp/api/"><link rel="preconnect" href="https://ads.nicovideo.jp/"><link rel="preconnect" href="https://public.api.nicovideo.jp/"><link rel="preconnect" href="https://www.googletagmanager.com">      <link rel="prefetch" href="https://nicovideo.cdn.nimg.jp/web/styles/pages/watch_failover2flash.css?423f64f8" id="js-failover2flash-css">      <link rel="preload" href="https://res.ads.nicovideo.jp/assets/js/ads2.js?ref=video" as="script"><link rel="preload" href="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/failover2flash/watch_failover2flash.js?025a757e" crossorigin="anonymous" as="script"><link rel="preload" href="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/modern/watch_dll_1dd5a508ec69c8342f29.js" crossorigin="anonymous" as="script"><link rel="preload" href="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/modern/watch_app_fcdc74bd44bef7f9c267.js" crossorigin="anonymous" as="script">      <link rel="shortcut icon" href="https://nicovideo.cdn.nimg.jp/web/images/favicon/favicon.ico"><link rel="icon" type="image/png" href="https://nicovideo.cdn.nimg.jp/web/images/favicon/32.png" sizes="32x32"><link rel="icon" type="image/png" href="https://nicovideo.cdn.nimg.jp/web/images/favicon/48.png" sizes="48x48"><link rel="icon" type="image/png" href="https://nicovideo.cdn.nimg.jp/web/images/favicon/96.png" sizes="96x96"><link rel="icon" type="image/png" href="https://nicovideo.cdn.nimg.jp/web/images/favicon/144.png" sizes="144x144">

    <title>戦闘員、派遣します！ 第1話「工作員、派遣します！」 - ニコニコ動画</title>    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <script type="text/javascript">
      window.watch__startTime = Date.now();
      window.NativeDate = Date;
                  
      if (Math.random() < 1) {
        window.Ads = { protocol: 'https:' };
      }
      
    </script>

    <meta property="fb:app_id" content="378853695459932">
          <meta name="keywords" content="アニメ,2021年春アニメ,戦闘員、派遣します！,富田美憂,白井悠介,汚いダクネス,おちんちん祭り,派遣アニメ,金髪ロリ,全員悪人,工作員">
<meta name="description" content="戦闘員、派遣します！ 第1話「工作員、派遣します！」 [アニメ] 動画一覧はこちら悪の組織・秘密結社キサラギの戦闘員六号は、最高幹部からスパイ活動を命じられる...">
<meta name="thumbnail" content="https://img.cdn.nimg.jp/s/nicovideo/thumbnails/38552050/38552050.42707694.original/r1280x720l?key=9a6b35e6af8b4e62fc4f081f66c503474eaf0d05f747b6174b4df3d61cadc852">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate, post-check=0, pre-check=0">
<meta http-equiv="Expires" content="Thu, 01 Dec 1994 16:00:00 GMT">
<meta property="og:title" content="戦闘員、派遣します！ 第1話「工作員、派遣します！」">
<meta property="og:description" content="戦闘員、派遣します！ 第1話「工作員、派遣します！」 [アニメ] 動画一覧はこちら悪の組織・秘密結社キサラギの戦闘員六号は、最高幹部からスパイ活動を命じられる...">
<meta property="og:type" content="video.other">
<meta property="og:video" content="https://embed.nicovideo.jp/watch/so38552050?autoplay=1">
<meta property="og:video:url" content="https://embed.nicovideo.jp/watch/so38552050?autoplay=1">
<meta property="og:video:secure_url" content="https://embed.nicovideo.jp/watch/so38552050?autoplay=1">
<meta property="og:video:type" content="video/mp4">
<meta property="og:video:width" content="640">
<meta property="og:video:height" content="360">
  <meta property="og:video:tag" content="アニメ">
  <meta property="og:video:tag" content="2021年春アニメ">
  <meta property="og:video:tag" content="戦闘員、派遣します！">
  <meta property="og:video:tag" content="富田美憂">
  <meta property="og:video:tag" content="白井悠介">
  <meta property="og:video:tag" content="汚いダクネス">
  <meta property="og:video:tag" content="おちんちん祭り">
  <meta property="og:video:tag" content="派遣アニメ">
  <meta property="og:video:tag" content="金髪ロリ">
  <meta property="og:video:tag" content="全員悪人">
  <meta property="og:video:tag" content="工作員">
<meta property="og:site_name" content="ニコニコ動画">
<meta property="og:url" content="https://www.nicovideo.jp/watch/so38552050">
<meta property="og:image" content="https://img.cdn.nimg.jp/s/nicovideo/thumbnails/38552050/38552050.42707694.original/r1280x720l?key=9a6b35e6af8b4e62fc4f081f66c503474eaf0d05f747b6174b4df3d61cadc852">
  <meta property="og:locale" content="ja_JP"><meta property="og:locale:alternate" content="zh_TW"><meta property="og:locale:alternate" content="en_US"><meta property="video:duration" content="1470">
<meta property="video:release_date" content="2021-04-11T00:00+0900">
<meta property="mixi:device-mobile" content="http://m.nicovideo.jp/watch/so38552050?cp_webto=mixi_check_pc">
<meta property="mixi:device-docomo" content="http://m.nicovideo.jp/watch/so38552050?uid=NULLGWDOCOMO&guid=ON&cp_webto=mixi_check_pc">
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:image" content="https://img.cdn.nimg.jp/s/nicovideo/thumbnails/38552050/38552050.42707694.original/r1280x720l?key=9a6b35e6af8b4e62fc4f081f66c503474eaf0d05f747b6174b4df3d61cadc852">
<meta name="twitter:site" content="@nico_nico_info">
<meta name="twitter:title" content="戦闘員、派遣します！ 第1話「工作員、派遣します！」">
<meta name="twitter:description" content="動画一覧は こちら   悪の組織・秘密結社キサラギの戦闘員六号は、最高幹部からスパイ活動を命じられる...">
<meta name="twitter:app:country" content="jp"/>
<meta name="twitter:app:name:iphone" content="ニコニコ動画"/>
<meta name="twitter:app:id:iphone" content="307764057"/>
<meta name="twitter:app:url:iphone" content="nicovideo://so38552050"/>
<meta name="twitter:app:name:googleplay" content="niconico"/>
<meta name="twitter:app:id:googleplay" content="jp.nicovideo.android"/>
<meta name="twitter:app:url:googleplay" content="nico://watch/so38552050" />
<meta property="al:ios:url" content="nico://so38552050?utm_source=facebook&utm_medium=video_player&utm_content=so38552050&utm_campaign=facebook_app_links">
<meta property="al:ios:app_store_id" content="307764057">
<meta property="al:ios:app_name" content="ニコニコ動画">
<meta property="al:android:url" content="https://www.nicovideo.jp/watch/so38552050?utm_source=facebook&utm_medium=video_player&utm_content=so38552050&utm_campaign=facebook_app_links">
<meta property="al:android:app_name" content="ニコニコ動画">
<meta property="al:android:package" content="jp.nicovideo.android">
<meta property="al:web:url" content="nico://so38552050?utm_source=facebook&utm_medium=video_player&utm_content=so38552050&utm_campaign=facebook_app_links">
<meta property="al:web:url" content="https://www.nicovideo.jp/watch/so38552050">
<meta property="al:web:should_fallback" content="true">
<meta name="msapplication-task" content="name=ニコニコ動画; action-uri=https://www.nicovideo.jp/; icon-uri=https://nicovideo.cdn.nimg.jp/web/img/favicon.ico">
<link rel="alternate" href="https://embed.nicovideo.jp/watch/so38552050" />
<link rel="canonical" href="https://www.nicovideo.jp/watch/so38552050">

        <script type="text/javascript">
  window.NicoGoogleTagManagerDataLayer = [];

  const data = {};

    data.user = (function() {
    const user = {};

              user.login_status = 'not_login';
    
    return user;
  })();

    data.content = (function() {
    const content = {};

              content.player_type = 'html5';
      content.genre = "アニメ";
      content.content_type = "channel";

                    content.channel_id = "ch2647797";
        
                  content.pay_status = '無料';
                      return content;
  })();

  window.NicoGoogleTagManagerDataLayer.push(data);
</script>

    <script>
  
  (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
  })(window,document,'script','NicoGoogleTagManagerDataLayer','GTM-KXT7G5G');
  
</script>

    <script>
  
  (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
  })(window,document,'script','NicoChannelAccessAnalyticsGtmDataLayer','GTM-K8M6VGZ');
  
</script>

            <script type="text/javascript">
      window.NicoChannelAccessAnalyticsGtmDataLayer = [];
      window.NicoChannelAccessAnalyticsGtmDataLayer.push({
        'event': 'TriggerAccessAnalytics',
        'PageParameter.ChannelId': "2647797",
        'PageParameter.ContentId': "so38552050",
                  'PageParameter.ContentBillingType': "free",
                'PageParameter.FrontendId': 6,
        'PageParameter.FrontendVersion': ''
      });
    </script>
  

    <link rel="stylesheet" type="text/css" href="https://nicovideo.cdn.nimg.jp/web/styles/pages/watch.css?c34154ae">
  </head>
  <body class="is-beforeInitialize ja-jp">

    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KXT7G5G" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>


    <div class="BaseLayout">
            <link href="https://nicovideo.cdn.nimg.jp/web/styles/modules/navigation/common_header/common_header.css?1593591677" rel="stylesheet">
<div id="CommonHeader" class="CommonHeader" data-common-header="{&quot;initConfig&quot;:{&quot;frontendId&quot;:6,&quot;frontendVersion&quot;:&quot;0&quot;,&quot;site&quot;:&quot;niconico&quot;,&quot;debug&quot;:{&quot;showAppeal&quot;:false},&quot;baseUrl&quot;:{&quot;accountUrl&quot;:&quot;https:\/\/account.nicovideo.jp&quot;,&quot;channelUrl&quot;:&quot;https:\/\/ch.nicovideo.jp&quot;,&quot;communityUrl&quot;:&quot;https:\/\/com.nicovideo.jp&quot;,&quot;nicoadUrl&quot;:&quot;https:\/\/nicoad.nicovideo.jp&quot;,&quot;niconicoUrl&quot;:&quot;https:\/\/www.nicovideo.jp&quot;},&quot;customization&quot;:{&quot;cmnhdRef&quot;:{&quot;page&quot;:&quot;watch&quot;},&quot;nextUrl&quot;:&quot;\/watch\/so38552050&quot;,&quot;logoutNextUrl&quot;:&quot;\/&quot;,&quot;size&quot;:{&quot;hMargin&quot;:&quot;auto&quot;,&quot;maxWidth&quot;:&quot;1024px&quot;,&quot;minWidth&quot;:&quot;1024px&quot;},&quot;userPanelLinks&quot;:[{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/video_top&quot;,&quot;label&quot;:&quot;\u30cb\u30b3\u30cb\u30b3\u52d5\u753bTOP&quot;},{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/ranking&quot;,&quot;label&quot;:&quot;\u30e9\u30f3\u30ad\u30f3\u30b0&quot;},{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/my\/watchlater&quot;,&quot;label&quot;:&quot;\u3042\u3068\u3067\u898b\u308b&quot;},{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/my\/mylist&quot;,&quot;label&quot;:&quot;\u30de\u30a4\u30ea\u30b9\u30c8&quot;},{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/my\/history\/video&quot;,&quot;label&quot;:&quot;\u8996\u8074\u5c65\u6b74&quot;},{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/my\/follow&quot;,&quot;label&quot;:&quot;\u30d5\u30a9\u30ed\u30fc\u4e2d&quot;},{&quot;href&quot;:&quot;https:\/\/www.upload.nicovideo.jp\/garage\/&quot;,&quot;label&quot;:&quot;\u6295\u7a3f\u52d5\u753b\uff0f\u52d5\u753b\u3092\u6295\u7a3f\u3059\u308b&quot;},{&quot;href&quot;:&quot;https:\/\/blog.nicovideo.jp\/niconews\/category\/videotop\/&quot;,&quot;label&quot;:&quot;\u30cb\u30b3\u30cb\u30b3\u30a4\u30f3\u30d5\u30a9&quot;}]},&quot;user&quot;:{&quot;isLogin&quot;:false}},&quot;language&quot;:&quot;ja&quot;,&quot;commonHeaderBaseUrl&quot;:&quot;https:\/\/secure-dcdn.cdn.nimg.jp\/&quot;}"></div>

            
      <div id="js-app"></div>
      <div id="js-initial-watch-data" data-api-data="{&quot;ads&quot;:null,&quot;category&quot;:null,&quot;channel&quot;:{&quot;id&quot;:&quot;ch2647797&quot;,&quot;name&quot;:&quot;\u6226\u95d8\u54e1\u3001\u6d3e\u9063\u3057\u307e\u3059\uff01&quot;,&quot;isOfficialAnime&quot;:true,&quot;isDisplayAdBanner&quot;:false,&quot;thumbnail&quot;:{&quot;url&quot;:&quot;https:\/\/secure-dcdn.cdn.nimg.jp\/comch\/channel-icon\/128x128\/ch2647797.jpg?1617885165&quot;,&quot;smallUrl&quot;:&quot;https:\/\/secure-dcdn.cdn.nimg.jp\/comch\/channel-icon\/64x64\/ch2647797.jpg?1617885165&quot;},&quot;viewer&quot;:null},&quot;client&quot;:{&quot;nicosid&quot;:&quot;1577806708.1185641383&quot;,&quot;watchId&quot;:&quot;1617869765&quot;,&quot;watchTrackId&quot;:&quot;sCMO69hLYZ_1618203198296&quot;},&quot;comment&quot;:{&quot;server&quot;:{&quot;url&quot;:&quot;https:\/\/nmsg.nicovideo.jp\/api\/&quot;},&quot;keys&quot;:{&quot;userKey&quot;:&quot;&quot;},&quot;layers&quot;:[{&quot;index&quot;:0,&quot;isTranslucent&quot;:false,&quot;threadIds&quot;:[{&quot;id&quot;:1617869764,&quot;fork&quot;:1}]},{&quot;index&quot;:1,&quot;isTranslucent&quot;:false,&quot;threadIds&quot;:[{&quot;id&quot;:1617869765,&quot;fork&quot;:0},{&quot;id&quot;:1617869765,&quot;fork&quot;:2}]},{&quot;index&quot;:2,&quot;isTranslucent&quot;:true,&quot;threadIds&quot;:[{&quot;id&quot;:1617869764,&quot;fork&quot;:0}]}],&quot;threads&quot;:[{&quot;id&quot;:1617869764,&quot;fork&quot;:1,&quot;isActive&quot;:false,&quot;isDefaultPostTarget&quot;:false,&quot;isEasyCommentPostTarget&quot;:false,&quot;isLeafRequired&quot;:false,&quot;isOwnerThread&quot;:true,&quot;isThreadkeyRequired&quot;:false,&quot;threadkey&quot;:null,&quot;is184Forced&quot;:false,&quot;hasNicoscript&quot;:true,&quot;label&quot;:&quot;owner&quot;,&quot;postkeyStatus&quot;:0,&quot;server&quot;:&quot;https:\/\/nmsg.nicovideo.jp&quot;},{&quot;id&quot;:1617869764,&quot;fork&quot;:0,&quot;isActive&quot;:true,&quot;isDefaultPostTarget&quot;:false,&quot;isEasyCommentPostTarget&quot;:false,&quot;isLeafRequired&quot;:true,&quot;isOwnerThread&quot;:false,&quot;isThreadkeyRequired&quot;:false,&quot;threadkey&quot;:null,&quot;is184Forced&quot;:false,&quot;hasNicoscript&quot;:false,&quot;label&quot;:&quot;default&quot;,&quot;postkeyStatus&quot;:0,&quot;server&quot;:&quot;https:\/\/nmsg.nicovideo.jp&quot;},{&quot;id&quot;:1617869765,&quot;fork&quot;:0,&quot;isActive&quot;:true,&quot;isDefaultPostTarget&quot;:true,&quot;isEasyCommentPostTarget&quot;:false,&quot;isLeafRequired&quot;:true,&quot;isOwnerThread&quot;:false,&quot;isThreadkeyRequired&quot;:true,&quot;threadkey&quot;:&quot;.1618204998.~1~i-tTduHJKqi6t70tElRLsHbMCiqdMWKNC8_zZphy8oo&quot;,&quot;is184Forced&quot;:true,&quot;hasNicoscript&quot;:false,&quot;label&quot;:&quot;community&quot;,&quot;postkeyStatus&quot;:0,&quot;server&quot;:&quot;https:\/\/nmsg.nicovideo.jp&quot;},{&quot;id&quot;:1617869765,&quot;fork&quot;:2,&quot;isActive&quot;:true,&quot;isDefaultPostTarget&quot;:false,&quot;isEasyCommentPostTarget&quot;:true,&quot;isLeafRequired&quot;:true,&quot;isOwnerThread&quot;:false,&quot;isThreadkeyRequired&quot;:true,&quot;threadkey&quot;:&quot;.1618204998.~1~i-tTduHJKqi6t70tElRLsHbMCiqdMWKNC8_zZphy8oo&quot;,&quot;is184Forced&quot;:true,&quot;hasNicoscript&quot;:false,&quot;label&quot;:&quot;easy&quot;,&quot;postkeyStatus&quot;:0,&quot;server&quot;:&quot;https:\/\/nmsg.nicovideo.jp&quot;}],&quot;ng&quot;:{&quot;ngScore&quot;:{&quot;isDisabled&quot;:false},&quot;channel&quot;:[],&quot;owner&quot;:[],&quot;viewer&quot;:null},&quot;isAttentionRequired&quot;:false},&quot;community&quot;:null,&quot;easyComment&quot;:{&quot;phrases&quot;:[{&quot;text&quot;:&quot;\u3046\u307d\u3064&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;\u3046\u307d\u3064&quot;,&quot;viewTitle&quot;:&quot;\u3046\u307d\u3064&quot;,&quot;summary&quot;:&quot;\u3046\u307d\u3064\u3068\u306f\u3046\uff50\u4e59\u306e\u3053\u3068\u3067\u3046\uff50(\u30a2\u30c3\u30d7\u30ed\u30fc\u30c9)\u4e59(\u304a\u75b2\u308c\u69d8\u3067\u3059)\u3068\u3044\u3046\u610f\u5473\u3002\u8a9e\u6e90\u306f\u3046\uff50\u3068\u4e59\u3092\u30ed\u30fc\u30de\u5b57\u3067\u6253\u3064\u3068\u300c\u3046\u307d\u3064\u300d\uff08up otu\u2192u po tu\uff09\u306b\u306a\u308b\u3053\u3068\u304b\u3089\u3002\n\u985e\u7fa9\u8a9e\u306b\u3046\u3071\u308a\u304c\u3042\u308b\u3002\n\u95a2\u9023\u9805\u76ee\n&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%E3%81%86%E3%81%BD%E3%81%A4&quot;}},{&quot;text&quot;:&quot;www&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;www&quot;,&quot;viewTitle&quot;:&quot;www&quot;,&quot;summary&quot;:&quot;www\u3068\u306f\n World Wide Web\uff08\u30ef\u30fc\u30eb\u30c9\u30ef\u30a4\u30c9\u30a6\u30a7\u30d6\uff09\n ASIAN KUNG-FU GENERATION\u306e4th\u30d5\u30eb\u30a2\u30eb\u30d0\u30e0\u300e\u30ef\u30fc\u30eb\u30c9\u00a0\u30ef\u30fc\u30eb\u30c9\u00a0\u30ef\u30fc\u30eb\u30c9\u300f\u306e\u7701\u7565\u8868\u8a18\n QuinRose&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/www&quot;}},{&quot;text&quot;:&quot;\u77e5\u3063\u3066\u305f&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;\u77e5\u3063\u3066\u305f&quot;,&quot;viewTitle&quot;:&quot;\u77e5\u3063\u3066\u305f&quot;,&quot;summary&quot;:&quot;\u77e5\u3063\u3066\u305f\u306e\u8a18\u4e8b\u304c\u3042\u308b\u3053\u3068\u304f\u3089\u3044\u3001\u3082\u3061\u308d\u3093\u77e5\u3063\u3066\u305f\u3002\n\u6982\u8981\u3042\u308b\u3068\u304b\u77e5\u3063\u3066\u305f\n2ch\u306e\u30d7\u30ed\u91ce\u7403\u95a2\u9023\u306e\u677f\u3084\u3001\u30cb\u30b3\u751f\u306e\u300c\u697d\u5929\u30a4\u30fc\u30b0\u30eb\u30b9\u516c\u5f0f\u6226\u751f\u653e\u9001\u300d\u306a\u3069\u3067\u3001\u5feb\u6253\u304c\u3042\u307e\u308a\u671f\u5f85\u3067\u304d\u306a\u3055\u305d\u3046\u306a\u6253\u8005\u304c\u6848\u306e\u5b9a\u60dc\u3057\u304f\u3082\u51e1&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%E7%9F%A5%E3%81%A3%E3%81%A6%E3%81%9F&quot;}},{&quot;text&quot;:&quot;\u304b\u308f\u3044\u3044&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;\u304b\u308f\u3044\u3044&quot;,&quot;viewTitle&quot;:&quot;\u304b\u308f\u3044\u3044&quot;,&quot;summary&quot;:&quot;\u304b\u308f\u3044\u3044\uff08\u53ef\u611b\u3044\uff09\u3068\u306f\u3001\u611b\u3089\u3057\u3044\u3001\u611b\u3059\u3079\u304d\u3082\u306e\u3001\u305d\u3046\u3044\u3063\u305f\u8da3\u306e\u3042\u308b\u3082\u306e\u306b\u5fc3\u3092\u3072\u304b\u308c\u3001\u5927\u5207\u306b\u3057\u305f\u3044\u69d8\u3092\u8868\u3059\u8a00\u8449\u3067\u3042\u308b\u3002\n\u6982\u8981\n\u8a9e\u6e90\u306f\u5e73\u5b89\u6642\u4ee3\u304b\u3089\u898b\u3089\u308c\u305f\u300c\u304b\u307b\u306f\u3086\u3057\uff08\u9854\u6620\u3086\u3057\uff09\u300d\u3002\uff1c\u9854\u3092\u5411\u3051\u3066\u3044\u3089\u308c\u306a\u3044&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%E3%81%8B%E3%82%8F%E3%81%84%E3%81%84&quot;}},{&quot;text&quot;:&quot;\u304a\u304a&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;\u304a\u304a&quot;,&quot;viewTitle&quot;:&quot;\u304a\u304a&quot;,&quot;summary&quot;:&quot;\u304a\u304a\u3068\u306f\u3001\n \u4f55\u304b\u306b\u9a5a\u3044\u305f\u3068\u304d\u306b\u51fa\u308b\u611f\u5606\u306e\u58f0\u3002\n \u5927\u304d\u3044\u3055\u307e\u3002\n \u6975\u9650\u3001\u6839\u672c\u3002\n \u5e8f\u5217\u304c\u4e0a\u4f4d\u3067\u3042\u308b\u3053\u3068\u3092\u8868\u3059\u969b\u306b\u4f7f\u7528\u3055\u308c\u308b\u8a00\u8449\u3002\n \u656c\u610f\u3092\u8868\u3059\u969b\u306b\u4f7f\u7528\u3055\u308c\u308b\u8a00\u8449\u3002\n \u304a\u304a\u3088\u305d\u3002\n1\u306e\u6982\u8981\n\u304b\u3093\u305f\u3093\u30b3\u30e1&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%E3%81%8A%E3%81%8A&quot;}},{&quot;text&quot;:&quot;\u3059\u304d&quot;,&quot;nicodic&quot;:null},{&quot;text&quot;:&quot;\u3053\u3053\u3059\u304d&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;\u3053\u3053\u3059\u304d&quot;,&quot;viewTitle&quot;:&quot;\u3053\u3053\u3059\u304d&quot;,&quot;summary&quot;:&quot;\u767a\u7965\n\u30a2\u30a4\u30de\u30b9MAD\u300c\u3082\u3063\u3068\u3059\u3044\u307f\u3093\u3076\u305d\u304f\u300d\u304c\u767a\u7965\u3067\u3042\u308b\n\u666e\u53ca\n\u30cb\u30b3\u30cb\u30b3\u52d5\u753b\u3067\u306e\u516c\u5f0f\u30a2\u30cb\u30e1\u914d\u4fe1\u4ee5\u964d\u3001\u4ed6\u306e\u30a2\u30cb\u30e1\u306eOP\u3067\u300c\u3053\u3053\u3059\u304d\u300d\u3068\u3044\u3046\u30b3\u30e1\u30f3\u30c8\u304c\u5ea6\u3005\u898b\u53d7\u3051\u3089\u308c\u3066\u3044\u305f\u304c\u3001\n\u300c\u82b1\u54b2\u304f\u3044\u308d\u306f\u300d\u306eOP\u3067\u306e\u5f3e&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%E3%81%93%E3%81%93%E3%81%99%E3%81%8D&quot;}},{&quot;text&quot;:&quot;\uff01\uff1f&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;!?&quot;,&quot;viewTitle&quot;:&quot;\uff01\uff1f&quot;,&quot;summary&quot;:&quot;\u6982\u8981!?\n!?\u3068\u306f\&quot;\u5f37\u70c8\&quot;\u304b\u3064\&quot;\u7406\u89e3\u4e0d\u80fd\&quot;\u306a\u9a5a\u304d\u3092\u793a\u3059\u7d04\u7269\uff08\u8a18\u53f7\uff09\u3067\u3042\u308b\u2026!?\n\u5c02\u9580\u7528\u8a9e\u3067\u306f\u300c\u611f\u5606\u7b26\u7591\u554f\u7b26\u300d\u3068\u3044\u3046\u540d\u524d\u3067\u3042\u308b\u3002\u6295\u3052\u3084\u308a\u3058\u3083\u306d\u3048\u304b!?\n\u7565\u3059\u308b\u3068\u300c\u611f\u5606\u4fee\u8f9e\u7591\u554f\u7b26\u300d\u3068\u3044\u3046\u9577\u3063\u305f\u3089\u3057\u3044\u4e0a\u306b\u3088&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%21%3F&quot;}},{&quot;text&quot;:&quot;\u304a\u3064&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;\u304a\u3064&quot;,&quot;viewTitle&quot;:&quot;\u304a\u3064&quot;,&quot;summary&quot;:&quot;\u4e59\u3068\u306f\u3001\u4ee5\u4e0b\u306e\u3053\u3068\u3092\u8868\u3059\u3002\n \u4e59\uff08\u304a\u3064\u3001\u304d\u306e\u3068\uff09 - \u5341\u5e72\u306e\u7b2c2\u4f4d\u3002\u4e94\u884c\u306f\u6728\u3001\u9670\u967d\u306f\u9670\u3002\u8349\u82b1\u3092\u8c61\u5fb4\u3057\u3001\u5354\u8abf\u30fb\u793e\u4ea4\u30fb\u548c\u5408\u3092\u610f\u5473\u3059\u308b\u3002\n \u4e59\uff08\u304a\u3064\uff09 - \u7532\u3067\u59cb\u307e\u308b\u9806\u4f4d\u306e\u7b2c2\u4f4d\u3002\u300c\u4e59\u7a2e\u300d\u300c\u7532\u4e59\u3064\u3051\u304c\u305f\u3044\u300d&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%E3%81%8A%E3%81%A4&quot;}},{&quot;text&quot;:&quot;88888888&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;88888888&quot;,&quot;viewTitle&quot;:&quot;88888888&quot;,&quot;summary&quot;:&quot;8\u306f\u6574\u6570\u306e\u3072\u3068\u3064\u30027\u306e\u6b21\u30019\u306e\u524d\u3002\n\u6982\u8981\n \u9178\u7d20(O)\u306e\u539f\u5b50\u756a\u53f7\u3002\n \u6a2a\u306b\u5012\u3059\u3068\u221e\u306b\u306a\u3063\u3066\u3057\u307e\u3046\u306e\u3067\u6ce8\u610f\u30028\u304b\u3089\u305a\u3044\u3076\u3093\u96e2\u308c\u3066\u3057\u307e\u3046\u3002\n \u300c\u516b\u300d\u306f\u672b\u5e83\u304c\u308a\u306e\u5f62\u3092\u3057\u3066\u3044\u308b\u305f\u3081\u3001\u7e01\u8d77\u306e\u826f\u3044\u6570\u3068\u3055\u308c\u308b\u3002\n &quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/88888888&quot;}}]},&quot;external&quot;:{&quot;commons&quot;:{&quot;hasContentTree&quot;:false},&quot;ichiba&quot;:{&quot;isEnabled&quot;:true}},&quot;genre&quot;:{&quot;key&quot;:&quot;anime&quot;,&quot;label&quot;:&quot;\u30a2\u30cb\u30e1&quot;,&quot;isImmoral&quot;:false,&quot;isDisabled&quot;:false,&quot;isNotSet&quot;:false},&quot;marquee&quot;:{&quot;isDisabled&quot;:false,&quot;tagRelatedLead&quot;:null},&quot;media&quot;:{&quot;delivery&quot;:{&quot;recipeId&quot;:&quot;nicovideo-so38552050&quot;,&quot;encryption&quot;:{&quot;encryptedKey&quot;:&quot;DU\/hKF2BKPantwUi4XZp3ByuJU5\/VYIroU8p+Y8a7WtDH49BNTg3I3hosgArfzlU&quot;,&quot;keyUri&quot;:&quot;https:\/\/nvapi.nicovideo.jp\/v1\/license\/hls?h=%242y%2410%24qKdZnnWL3NBPdLf5%2F6Wjg.cRS5G0jhxuimha6hiYvrXR4jzda4tsG&amp;_frontendId=6&amp;_frontendVersion=0&quot;},&quot;movie&quot;:{&quot;contentId&quot;:&quot;out1&quot;,&quot;audios&quot;:[{&quot;id&quot;:&quot;archive_aac_192kbps&quot;,&quot;isAvailable&quot;:true,&quot;metadata&quot;:{&quot;bitrate&quot;:192000,&quot;samplingRate&quot;:48000,&quot;loudness&quot;:{&quot;integratedLoudness&quot;:-24,&quot;truePeak&quot;:-5.4000000000000003552713678800500929355621337890625},&quot;levelIndex&quot;:1,&quot;loudnessCollection&quot;:[{&quot;type&quot;:&quot;video&quot;,&quot;value&quot;:1},{&quot;type&quot;:&quot;pureAdPreroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;houseAdPreroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;networkAdPreroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;pureAdMidroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;houseAdMidroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;networkAdMidroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;pureAdPostroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;houseAdPostroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;networkAdPostroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;nicoadVideoIntroduce&quot;,&quot;value&quot;:0.316227766016837941176476078908308409154415130615234375},{&quot;type&quot;:&quot;nicoadBillboard&quot;,&quot;value&quot;:0.7079457843841379105498390345019288361072540283203125},{&quot;type&quot;:&quot;marquee&quot;,&quot;value&quot;:0.39810717055349720272516833574627526104450225830078125}]}},{&quot;id&quot;:&quot;archive_aac_64kbps&quot;,&quot;isAvailable&quot;:true,&quot;metadata&quot;:{&quot;bitrate&quot;:64000,&quot;samplingRate&quot;:48000,&quot;loudness&quot;:{&quot;integratedLoudness&quot;:-24,&quot;truePeak&quot;:-5.4000000000000003552713678800500929355621337890625},&quot;levelIndex&quot;:0,&quot;loudnessCollection&quot;:[{&quot;type&quot;:&quot;video&quot;,&quot;value&quot;:1},{&quot;type&quot;:&quot;pureAdPreroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;houseAdPreroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;networkAdPreroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;pureAdMidroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;houseAdMidroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;networkAdMidroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;pureAdPostroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;houseAdPostroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;networkAdPostroll&quot;,&quot;value&quot;:0.2511886431509580130949643717030994594097137451171875},{&quot;type&quot;:&quot;nicoadVideoIntroduce&quot;,&quot;value&quot;:0.316227766016837941176476078908308409154415130615234375},{&quot;type&quot;:&quot;nicoadBillboard&quot;,&quot;value&quot;:0.7079457843841379105498390345019288361072540283203125},{&quot;type&quot;:&quot;marquee&quot;,&quot;value&quot;:0.39810717055349720272516833574627526104450225830078125}]}}],&quot;videos&quot;:[{&quot;id&quot;:&quot;archive_h264_720p&quot;,&quot;isAvailable&quot;:true,&quot;metadata&quot;:{&quot;label&quot;:&quot;720p&quot;,&quot;bitrate&quot;:1664000,&quot;resolution&quot;:{&quot;width&quot;:1280,&quot;height&quot;:720},&quot;levelIndex&quot;:3,&quot;recommendedHighestAudioLevelIndex&quot;:1}},{&quot;id&quot;:&quot;archive_h264_480p&quot;,&quot;isAvailable&quot;:true,&quot;metadata&quot;:{&quot;label&quot;:&quot;480p&quot;,&quot;bitrate&quot;:1011000,&quot;resolution&quot;:{&quot;width&quot;:854,&quot;height&quot;:480},&quot;levelIndex&quot;:2,&quot;recommendedHighestAudioLevelIndex&quot;:1}},{&quot;id&quot;:&quot;archive_h264_360p&quot;,&quot;isAvailable&quot;:true,&quot;metadata&quot;:{&quot;label&quot;:&quot;360p&quot;,&quot;bitrate&quot;:600000,&quot;resolution&quot;:{&quot;width&quot;:640,&quot;height&quot;:360},&quot;levelIndex&quot;:1,&quot;recommendedHighestAudioLevelIndex&quot;:1}},{&quot;id&quot;:&quot;archive_h264_360p_low&quot;,&quot;isAvailable&quot;:true,&quot;metadata&quot;:{&quot;label&quot;:&quot;\u4f4e\u753b\u8cea&quot;,&quot;bitrate&quot;:300000,&quot;resolution&quot;:{&quot;width&quot;:640,&quot;height&quot;:360},&quot;levelIndex&quot;:0,&quot;recommendedHighestAudioLevelIndex&quot;:1}}],&quot;session&quot;:{&quot;recipeId&quot;:&quot;nicovideo-so38552050&quot;,&quot;playerId&quot;:&quot;nicovideo-6-sCMO69hLYZ_1618203198296&quot;,&quot;videos&quot;:[&quot;archive_h264_720p&quot;,&quot;archive_h264_480p&quot;,&quot;archive_h264_360p&quot;,&quot;archive_h264_360p_low&quot;],&quot;audios&quot;:[&quot;archive_aac_192kbps&quot;,&quot;archive_aac_64kbps&quot;],&quot;movies&quot;:[],&quot;protocols&quot;:[&quot;hls&quot;],&quot;authTypes&quot;:{&quot;hls&quot;:&quot;ht2&quot;},&quot;serviceUserId&quot;:&quot;6-sCMO69hLYZ_1618203198296&quot;,&quot;token&quot;:&quot;{\&quot;service_id\&quot;:\&quot;nicovideo\&quot;,\&quot;player_id\&quot;:\&quot;nicovideo-6-sCMO69hLYZ_1618203198296\&quot;,\&quot;recipe_id\&quot;:\&quot;nicovideo-so38552050\&quot;,\&quot;service_user_id\&quot;:\&quot;6-sCMO69hLYZ_1618203198296\&quot;,\&quot;protocols\&quot;:[{\&quot;name\&quot;:\&quot;hls\&quot;,\&quot;auth_type\&quot;:\&quot;ht2\&quot;}],\&quot;videos\&quot;:[\&quot;archive_h264_360p\&quot;,\&quot;archive_h264_360p_low\&quot;,\&quot;archive_h264_480p\&quot;,\&quot;archive_h264_720p\&quot;],\&quot;audios\&quot;:[\&quot;archive_aac_192kbps\&quot;,\&quot;archive_aac_64kbps\&quot;],\&quot;movies\&quot;:[],\&quot;created_time\&quot;:1618203198000,\&quot;expire_time\&quot;:1618289598000,\&quot;content_ids\&quot;:[\&quot;out1\&quot;],\&quot;heartbeat_lifetime\&quot;:120000,\&quot;content_key_timeout\&quot;:600000,\&quot;priority\&quot;:0.200000000000000011102230246251565404236316680908203125,\&quot;transfer_presets\&quot;:[],\&quot;hls_encryption\&quot;:\&quot;hls_encryption_v1\&quot;,\&quot;hls_encrypted_key\&quot;:\&quot;DU\\\/hKF2BKPantwUi4XZp3ByuJU5\\\/VYIroU8p+Y8a7WtDH49BNTg3I3hosgArfzlU\&quot;}&quot;,&quot;signature&quot;:&quot;48b5ab597098c23092ea864228a05c50e0b5a55c0d696b6a6366951b03382730&quot;,&quot;contentId&quot;:&quot;out1&quot;,&quot;heartbeatLifetime&quot;:120000,&quot;contentKeyTimeout&quot;:600000,&quot;priority&quot;:0.200000000000000011102230246251565404236316680908203125,&quot;transferPresets&quot;:[],&quot;urls&quot;:[{&quot;url&quot;:&quot;https:\/\/api.dmc.nico\/api\/sessions&quot;,&quot;isWellKnownPort&quot;:true,&quot;isSsl&quot;:true}]}},&quot;storyboard&quot;:null,&quot;trackingId&quot;:&quot;X+kfXRuN5X9n0zxNIkxOo8Y1cnL1FI1YfAghTm3gf6RqRorWgQIcEjMVdtKa0J1caOCw0QDbMPGAVwMdGAMa8OrqaApaJi4hvtkvT2MyUjs=&quot;},&quot;deliveryLegacy&quot;:null},&quot;okReason&quot;:&quot;PURELY&quot;,&quot;owner&quot;:null,&quot;pcWatchPage&quot;:{&quot;tagRelatedBanner&quot;:null,&quot;videoEnd&quot;:{&quot;bannerIn&quot;:null,&quot;overlay&quot;:null},&quot;showOwnerMenu&quot;:false,&quot;showOwnerThreadCoEditingLink&quot;:false,&quot;showMymemoryEditingLink&quot;:false},&quot;player&quot;:{&quot;initialPlayback&quot;:null,&quot;comment&quot;:{&quot;isDefaultInvisible&quot;:false},&quot;layerMode&quot;:0},&quot;ppv&quot;:null,&quot;ranking&quot;:{&quot;genre&quot;:{&quot;rank&quot;:2,&quot;genre&quot;:&quot;\u30a2\u30cb\u30e1&quot;,&quot;dateTime&quot;:&quot;2021-04-11T17:00:00+09:00&quot;},&quot;popularTag&quot;:[{&quot;tag&quot;:&quot;\u30a2\u30cb\u30e1&quot;,&quot;regularizedTag&quot;:&quot;\u30a2\u30cb\u30e1&quot;,&quot;rank&quot;:1,&quot;genre&quot;:&quot;\u30a2\u30cb\u30e1&quot;,&quot;dateTime&quot;:&quot;2021-04-11T17:00:00+09:00&quot;}]},&quot;series&quot;:null,&quot;smartphone&quot;:null,&quot;system&quot;:{&quot;serverTime&quot;:&quot;2021-04-12T13:53:18+09:00&quot;,&quot;isPeakTime&quot;:false},&quot;tag&quot;:{&quot;items&quot;:[{&quot;name&quot;:&quot;\u30a2\u30cb\u30e1&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:true,&quot;isLocked&quot;:true},{&quot;name&quot;:&quot;2021\u5e74\u6625\u30a2\u30cb\u30e1&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:true,&quot;isLocked&quot;:true},{&quot;name&quot;:&quot;\u6226\u95d8\u54e1\u3001\u6d3e\u9063\u3057\u307e\u3059\uff01&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:true,&quot;isLocked&quot;:true},{&quot;name&quot;:&quot;\u5bcc\u7530\u7f8e\u6182&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:true,&quot;isLocked&quot;:false},{&quot;name&quot;:&quot;\u767d\u4e95\u60a0\u4ecb&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:true,&quot;isLocked&quot;:false},{&quot;name&quot;:&quot;\u6c5a\u3044\u30c0\u30af\u30cd\u30b9&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:false,&quot;isLocked&quot;:false},{&quot;name&quot;:&quot;\u304a\u3061\u3093\u3061\u3093\u796d\u308a&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:false,&quot;isLocked&quot;:false},{&quot;name&quot;:&quot;\u6d3e\u9063\u30a2\u30cb\u30e1&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:false,&quot;isLocked&quot;:false},{&quot;name&quot;:&quot;\u91d1\u9aea\u30ed\u30ea&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:false,&quot;isLocked&quot;:false},{&quot;name&quot;:&quot;\u5168\u54e1\u60aa\u4eba&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:false,&quot;isLocked&quot;:false},{&quot;name&quot;:&quot;\u5de5\u4f5c\u54e1&quot;,&quot;isCategory&quot;:false,&quot;isCategoryCandidate&quot;:false,&quot;isNicodicArticleExists&quot;:true,&quot;isLocked&quot;:false}],&quot;hasR18Tag&quot;:false,&quot;isPublishedNicoscript&quot;:false,&quot;edit&quot;:{&quot;isEditable&quot;:false,&quot;uneditableReason&quot;:&quot;PREMIUM_ONLY&quot;,&quot;editKey&quot;:null},&quot;viewer&quot;:null},&quot;video&quot;:{&quot;id&quot;:&quot;so38552050&quot;,&quot;title&quot;:&quot;\u6226\u95d8\u54e1\u3001\u6d3e\u9063\u3057\u307e\u3059\uff01 \u7b2c1\u8a71\u300c\u5de5\u4f5c\u54e1\u3001\u6d3e\u9063\u3057\u307e\u3059\uff01\u300d&quot;,&quot;description&quot;:&quot;\u52d5\u753b\u4e00\u89a7\u306f&lt;a href=\&quot;http:\/\/ch.nicovideo.jp\/channel\/ch2647797\&quot; target=\&quot;_blank\&quot;&gt;\u3053\u3061\u3089&lt;\/a&gt;&lt;br&gt;&lt;br&gt;\u60aa\u306e\u7d44\u7e54\u30fb\u79d8\u5bc6\u7d50\u793e\u30ad\u30b5\u30e9\u30ae\u306e\u6226\u95d8\u54e1\u516d\u53f7\u306f\u3001\u6700\u9ad8\u5e79\u90e8\u304b\u3089\u30b9\u30d1\u30a4\u6d3b\u52d5\u3092\u547d\u3058\u3089\u308c\u308b\u3002&lt;br&gt;\u76ee\u6a19\u306f\u5730\u7403\u306b\u3088\u304f\u4f3c\u305f\u5225\u306e\u60d1\u661f\u3002&lt;br&gt;\u534a\u3070\u5f37\u5f15\u306b\u8ee2\u9001\u3055\u308c\u305f\u516d\u53f7\u306f\u3001\u9ad8\u6027\u80fd\u30a2\u30f3\u30c9\u30ed\u30a4\u30c9\u306e\u30a2\u30ea\u30b9\u3068\u5171\u306b\u672a\u77e5\u306e\u60d1\u661f\u306e\u4fb5\u7565\u3092\u958b\u59cb\u2015\u2015\u3059\u308b\uff01\uff1f&lt;br&gt;\u00a92021 \u6681\u306a\u3064\u3081, \u30ab\u30ab\u30aa\u30fb\u30e9\u30f3\u30bf\u30f3\uff0fKADOKAWA\uff0f\u300c\u6226\u95d8\u54e1\u3001\u6d3e\u9063\u3057\u307e\u3059\uff01\u300d\u88fd\u4f5c\u59d4\u54e1\u4f1a&lt;br&gt;&lt;br&gt;&lt;br&gt;&lt;u&gt;&lt;a href=\&quot;https:\/\/anime.nicovideo.jp\/index.html?from=video_watch_anime\&quot; target=\&quot;_blank\&quot;&gt;\u7121\u6599\u52d5\u753b\u3084\u6700\u65b0\u60c5\u5831\u30fb\u751f\u653e\u9001\u30fb\u30de\u30f3\u30ac\u30fb\u30a4\u30e9\u30b9\u30c8\u306f N\u30a2\u30cb\u30e1&lt;\/a&gt;&lt;\/u&gt;&lt;br&gt;&lt;strong&gt;&lt;u&gt;&lt;a href=\&quot;https:\/\/anime.nicovideo.jp\/detail\/kisaragi\/index.html?from=video_watch_anime\&quot; target=\&quot;_blank\&quot;&gt;\u6226\u95d8\u54e1\u3001\u6d3e\u9063\u3057\u307e\u3059\uff01&lt;\/a&gt;&lt;\/u&gt;&lt;\/strong&gt;&lt;br&gt;&lt;u&gt;&lt;a href=\&quot;https:\/\/anime.nicovideo.jp\/period\/2021-spring.html?from=video_watch_anime\&quot; target=\&quot;_blank\&quot;&gt;2021\u6625\u30a2\u30cb\u30e1&lt;\/a&gt;&lt;\/u&gt;\u3000&lt;u&gt;&lt;a href=\&quot;https:\/\/anime.nicovideo.jp\/free\/index.html?from=video_watch_anime\&quot; target=\&quot;_blank\&quot;&gt;\u30a2\u30cb\u30e1\u7121\u6599\u52d5\u753b&lt;\/a&gt;&lt;\/u&gt;\u3000&lt;u&gt;&lt;a href=\&quot;https:\/\/anime.nicovideo.jp\/ranking\/view-daily.html?from=video_watch_anime\&quot; target=\&quot;_blank\&quot;&gt;\u30a2\u30cb\u30e1\u30e9\u30f3\u30ad\u30f3\u30b0&lt;\/a&gt;&lt;\/u&gt;&lt;br&gt;&quot;,&quot;count&quot;:{&quot;view&quot;:89400,&quot;comment&quot;:6375,&quot;mylist&quot;:364,&quot;like&quot;:510},&quot;duration&quot;:1470,&quot;thumbnail&quot;:{&quot;url&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38552050\/38552050.42707694&quot;,&quot;middleUrl&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38552050\/38552050.42707694.M&quot;,&quot;largeUrl&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38552050\/38552050.42707694.L&quot;,&quot;player&quot;:&quot;https:\/\/img.cdn.nimg.jp\/s\/nicovideo\/thumbnails\/38552050\/38552050.42707694.original\/a960x540l?key=ea23b0485e2a9d014d0314264d0c1bb4cc4c8a2efdd2a5517bd8e72db1904021&quot;,&quot;ogp&quot;:&quot;https:\/\/img.cdn.nimg.jp\/s\/nicovideo\/thumbnails\/38552050\/38552050.42707694.original\/r1280x720l?key=9a6b35e6af8b4e62fc4f081f66c503474eaf0d05f747b6174b4df3d61cadc852&quot;},&quot;rating&quot;:{&quot;isAdult&quot;:false},&quot;registeredAt&quot;:&quot;2021-04-11T00:00:00+09:00&quot;,&quot;isPrivate&quot;:false,&quot;isDeleted&quot;:false,&quot;isNoBanner&quot;:false,&quot;isAuthenticationRequired&quot;:false,&quot;isEmbedPlayerAllowed&quot;:true,&quot;viewer&quot;:null,&quot;watchableUserTypeForPayment&quot;:&quot;all&quot;,&quot;commentableUserTypeForPayment&quot;:&quot;all&quot;,&quot;9d091f87&quot;:true},&quot;videoAds&quot;:{&quot;additionalParams&quot;:{&quot;videoId&quot;:&quot;so38552050&quot;,&quot;videoDuration&quot;:1470,&quot;isAdultRatingNG&quot;:false,&quot;isAuthenticationRequired&quot;:false,&quot;isR18&quot;:false,&quot;nicosid&quot;:&quot;1577806708.1185641383&quot;,&quot;lang&quot;:&quot;ja-jp&quot;,&quot;watchTrackId&quot;:&quot;sCMO69hLYZ_1618203198296&quot;,&quot;channelId&quot;:&quot;ch2647797&quot;,&quot;genre&quot;:&quot;anime&quot;},&quot;items&quot;:[{&quot;type&quot;:&quot;preroll&quot;,&quot;timingMs&quot;:null,&quot;additionalParams&quot;:{&quot;linearType&quot;:&quot;preroll&quot;,&quot;adIdx&quot;:0,&quot;skipType&quot;:3,&quot;skippableType&quot;:3,&quot;pod&quot;:1}},{&quot;type&quot;:&quot;midroll&quot;,&quot;timingMs&quot;:825200,&quot;additionalParams&quot;:{&quot;linearType&quot;:&quot;midroll&quot;,&quot;adIdx&quot;:0,&quot;skipType&quot;:3,&quot;skippableType&quot;:3,&quot;pod&quot;:2}},{&quot;type&quot;:&quot;postroll&quot;,&quot;timingMs&quot;:null,&quot;additionalParams&quot;:{&quot;linearType&quot;:&quot;postroll&quot;,&quot;adIdx&quot;:0,&quot;skipType&quot;:3,&quot;skippableType&quot;:3,&quot;pod&quot;:3}}],&quot;reason&quot;:&quot;non_premium_user_ads&quot;},&quot;videoLive&quot;:null,&quot;viewer&quot;:null,&quot;waku&quot;:{&quot;information&quot;:null,&quot;bgImages&quot;:[],&quot;addContents&quot;:null,&quot;addVideo&quot;:null,&quot;tagRelatedBanner&quot;:{&quot;title&quot;:&quot;\u3010\u671f\u9593\u9650\u5b9a\u3011\u30d7\u30ec\u30df\u30a2\u30e0\u4f1a\u54e1\u306a\u3089&quot;,&quot;imageUrl&quot;:&quot;https:\/\/secure-dcdn.cdn.nimg.jp\/nicocc\/wakutkool\/v2\/nicovideo-watch-tag-banner\/126155_29efaab3.jpg&quot;,&quot;description&quot;:&quot;\u300c\u5742\u672c\u3067\u3059\u304c\uff1f\u300d\u307b\u304b\u30a2\u30cb\u30e1\u898b\u653e\u984c\uff01&quot;,&quot;isEvent&quot;:false,&quot;linkUrl&quot;:&quot;https:\/\/anime.nicovideo.jp\/special\/premium-video\/#link11&quot;,&quot;isNewWindow&quot;:false},&quot;tagRelatedMarquee&quot;:{&quot;title&quot;:&quot;\u30d7\u30ec\u30df\u30a2\u30e0\u4f1a\u54e1\u306a\u3089\u300c\u5742\u672c\u3067\u3059\u304c\uff1f\u300d\u898b\u653e\u984c\uff01&quot;,&quot;linkUrl&quot;:&quot;https:\/\/anime.nicovideo.jp\/special\/premium-video\/#link11&quot;,&quot;isNewWindow&quot;:false}}}" data-environment="{&quot;baseURL&quot;:{&quot;web&quot;:&quot;https:\/\/www.nicovideo.jp&quot;,&quot;res&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/web&quot;,&quot;dic&quot;:&quot;https:\/\/dic.nicovideo.jp&quot;,&quot;flapi&quot;:&quot;https:\/\/flapi.nicovideo.jp&quot;,&quot;live&quot;:&quot;https:\/\/live.nicovideo.jp&quot;,&quot;live2&quot;:&quot;https:\/\/live2.nicovideo.jp&quot;,&quot;com&quot;:&quot;https:\/\/com.nicovideo.jp&quot;,&quot;ch&quot;:&quot;https:\/\/ch.nicovideo.jp&quot;,&quot;chPublicAPI&quot;:&quot;https:\/\/public-api.ch.nicovideo.jp&quot;,&quot;secureCh&quot;:&quot;https:\/\/secure.ch.nicovideo.jp&quot;,&quot;commons&quot;:&quot;https:\/\/commons.nicovideo.jp&quot;,&quot;commonsAPI&quot;:&quot;https:\/\/api.commons.nicovideo.jp&quot;,&quot;embed&quot;:&quot;https:\/\/embed.nicovideo.jp&quot;,&quot;ext&quot;:&quot;https:\/\/ext.nicovideo.jp&quot;,&quot;nicoMs&quot;:&quot;https:\/\/nico.ms&quot;,&quot;ichiba&quot;:&quot;https:\/\/ichiba.nicovideo.jp&quot;,&quot;ads&quot;:&quot;https:\/\/ads.nicovideo.jp&quot;,&quot;account&quot;:&quot;https:\/\/account.nicovideo.jp&quot;,&quot;secure&quot;:&quot;https:\/\/secure.nicovideo.jp&quot;,&quot;premium&quot;:&quot;https:\/\/premium.nicovideo.jp&quot;,&quot;ex&quot;:&quot;https:\/\/ex.nicovideo.jp&quot;,&quot;qa&quot;:&quot;https:\/\/qa.nicovideo.jp&quot;,&quot;publicAPI&quot;:&quot;https:\/\/public.api.nicovideo.jp&quot;,&quot;commonsPublicAPI&quot;:&quot;https:\/\/public-api.commons.nicovideo.jp\/&quot;,&quot;app&quot;:&quot;http:\/\/app.nicovideo.jp&quot;,&quot;appClientAPI&quot;:&quot;http:\/\/app-cliapi.nicovideo.jp&quot;,&quot;point&quot;:&quot;https:\/\/point.nicovideo.jp&quot;,&quot;enquete&quot;:&quot;http:\/\/enquete.nicovideo.jp&quot;,&quot;notification&quot;:&quot;https:\/\/notification.nicovideo.jp&quot;,&quot;upload&quot;:&quot;https:\/\/www.upload.nicovideo.jp&quot;,&quot;sugoiSearchSystem&quot;:&quot;https:\/\/sug.search.nicovideo.jp&quot;,&quot;nicoad&quot;:&quot;https:\/\/nicoad.nicovideo.jp&quot;,&quot;nicoadAPI&quot;:&quot;https:\/\/api.nicoad.nicovideo.jp&quot;,&quot;secureDCDN&quot;:&quot;https:\/\/secure-dcdn.cdn.nimg.jp&quot;,&quot;seiga&quot;:&quot;https:\/\/seiga.nicovideo.jp&quot;,&quot;nvapi&quot;:&quot;https:\/\/nvapi.nicovideo.jp&quot;},&quot;playlistToken&quot;:&quot;&quot;,&quot;i18n&quot;:{&quot;language&quot;:&quot;ja-jp&quot;,&quot;locale&quot;:&quot;ja_JP&quot;,&quot;area&quot;:&quot;JP&quot;,&quot;footer&quot;:null},&quot;urls&quot;:{&quot;playerHelp&quot;:&quot;https:\/\/qa.nicovideo.jp\/faq\/show\/6116&quot;},&quot;isMonitoringLogUser&quot;:false,&quot;frontendId&quot;:6,&quot;frontendVersion&quot;:&quot;0&quot;,&quot;newPlaylistRate&quot;:1,&quot;newRelatedVideos&quot;:true}" hidden></div>
      <div id="js-failover2flash" class="failover2flash" style="display: none;">
  <div class="failover2flash-header">
    <h1 class="failover2flash-logo">
      <a href="/video_top">ニコニコ動画</a>
    </h1>
  </div>

    <p class="failover2flash-late">ページの読み込みに時間がかかっています</p>

    <p class="failover2flash-error">エラーが発生しました</p>

  <div class="failover2flash-buttonArea">
    <button id="js-failover2flash-reload" class="failover2flash-reload">再読み込み</button>
  </div>
</div>
      <link href="https://nicovideo.cdn.nimg.jp/web/styles/footer.css?1603771323" rel="stylesheet">
<footer class="FooterContainer" data-footer-is-login="true">
  <a href="javascript:void(0)" class="FooterContainer-pageTop" onclick="window.scrollTo(0, 0)">▲ページトップ</a>

                
    <div class="FooterContainer-information">
    <div class="FooterContainer-informationInner">

            <h1 class="FooterContainer-pageLogo">
        <a href="/video_top" class="FooterContainer-pageLogoLink">
          <img src="https://nicovideo.cdn.nimg.jp/web/images/logo/logo_nicovideo_white.svg" alt="ニコニコ動画">
        </a>
      </h1>

            <div classs="FooterContainer-linksContainer">

                <ul class="FooterContainer-links"  data-footer-watch-links style="display: none;">
          <li class="FooterContainer-link"><a href="https://qa.nicovideo.jp/faq/show/6116?site_domain=default">使い方</a></li>
          <li class="FooterContainer-link"><a href="https://qa.nicovideo.jp/faq/show/195?site_domain=default">動画が視聴できない</a></li>
          <li class="FooterContainer-link FooterContainer-requiredLoginLink FooterContainer-attentionLink"><a href="#" data-footer-comment-allegation-base-url="https://secure.nicovideo.jp/secure/comment_allegation/" data-footer-comment-allegation-link>コメント/タグ通報</a></li>
          <li class="FooterContainer-link FooterContainer-requiredLoginLink FooterContainer-attentionLink"><a href="#" data-footer-video-allegation-base-url="https://www.nicovideo.jp/allegation/" data-footer-video-allegation-link>動画通報</a></li>
        </ul>

        <ul class="FooterContainer-links">
          <li class="FooterContainer-link"><a href="https://qa.nicovideo.jp/faq/show/5008?site_domain=default">ご意見・ご要望</a></li>
          <li class="FooterContainer-link"><a href="https://secure.nicovideo.jp/form/feedback_bugreport">不具合報告</a></li>
          <li class="FooterContainer-link"><a href="https://qa.nicovideo.jp/">ヘルプ</a></li>
          <li class="FooterContainer-link"><a href="https://qa.nicovideo.jp/faq/show/1112">動作環境</a></li>
          <li class="FooterContainer-link"><a href="https://account.nicovideo.jp/rules/account">利用規約</a></li>
          <li class="FooterContainer-link"><a target="_blank" href="http://dwango.co.jp/">運営会社</a></li>
        </ul>
        <ul class="FooterContainer-links">
          <li class="FooterContainer-link FooterContainer-breakLink"><a href="https://ex.nicovideo.jp/smile/guideline/">権利侵害に関する動画投稿ガイドライン</a></li>
          <li class="FooterContainer-link"><a href="https://license-search.nicovideo.jp/">動画に使用できる音源の検索</a></li>
          <li class="FooterContainer-link"><a href="http://info.nicovideo.jp/base/phishing.html">フィッシング詐欺にご注意ください</a></li>        </ul>
        <ul class="FooterContainer-links">
          <li class="FooterContainer-link"><a href="https://site.nicovideo.jp/sales_ads">広告出稿に関するお問い合わせ</a></li>
                  </ul>
      </div>

    </div>
  </div>

  <div class="FooterContainer-additionals">
    <div class="FooterContainer-additionalsInner">

      <div class="FooterContainer-metadata">
        <div class="FooterContainer-metadataItem">
          <span class="FooterContainer-metadataLabel">総動画数</span>
          <span class="FooterContainer-metadataValue">18,507,959</span>
          <span class="FooterContainer-metadataLinks">
                      </span>
        </div>
        <div class="FooterContainer-metadataItem">
          <span class="FooterContainer-metadataLabel">総再生数</span>
          <span class="FooterContainer-metadataValue">116,694,719,571</span>
        </div>
        <div class="FooterContainer-metadataItem">
          <span class="FooterContainer-metadataLabel">総コメント数</span>
          <span class="FooterContainer-metadataValue">5,974,679,915</span>
        </div>
        <address class="FooterContainer-metadataAddress">©DWANGO Co., Ltd.</address>
      </div>


      
    </div>
  </div>

</footer>
<script charset="utf-8" src="https://nicovideo.cdn.nimg.jp/web/scripts/modules/view/Footer.js?1599530746" async="1" defer="1"></script>


      <script type="text/javascript" src="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/failover2flash/watch_failover2flash.js?025a757e"></script>
      <script type="text/javascript" charset="utf-8" src="https://res.ads.nicovideo.jp/assets/js/ads2.js?ref=video"></script>
                    <script type="text/javascript" src="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/modern/watch_dll_1dd5a508ec69c8342f29.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/modern/watch_app_fcdc74bd44bef7f9c267.js" crossorigin="anonymous"></script>
      
      <script type="text/javascript">
  
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-1089346-5']);
  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
  
</script>

          </div>

              <script type="application/ld+json">
        {"@context":"http:\/\/schema.org","@type":"VideoObject","@id":"https:\/\/www.nicovideo.jp\/watch\/so38552050","name":"戦闘員、派遣します！ 第1話「工作員、派遣します！」","description":"動画一覧はこちら悪の組織・秘密結社キサラギの戦闘員六号は、最高幹部からスパイ活動を命じられる。目標は","caption":"動画一覧はこちら悪の組織・秘密結社キサラギの戦闘員六号は、最高幹部からスパイ活動を命じられる。目標は","url":"https:\/\/www.nicovideo.jp\/watch\/so38552050","duration":"PT1470S","uploadDate":"2021-04-11T00:00:00+09:00","embedUrl":"https:\/\/embed.nicovideo.jp\/watch\/so38552050?autoplay=1","interactionStatistic":[{"@type":"InteractionCounter","interactionType":"http:\/\/schema.org\/WatchAction","userInteractionCount":89401},{"@type":"InteractionCounter","interactionType":"http:\/\/schema.org\/WantAction","userInteractionCount":364}],"thumbnail":[{"@type":"ImageObject","url":"https:\/\/img.cdn.nimg.jp\/s\/nicovideo\/thumbnails\/38552050\/38552050.42707694.original\/r1280x720l?key=9a6b35e6af8b4e62fc4f081f66c503474eaf0d05f747b6174b4df3d61cadc852"},{"@type":"ImageObject","url":"https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38552050\/38552050.42707694.L","width":360,"height":270},{"@type":"ImageObject","url":"https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38552050\/38552050.42707694.M"},{"@type":"ImageObject","url":"https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38552050\/38552050.42707694","width":130,"height":100}],"thumbnailUrl":["https:\/\/img.cdn.nimg.jp\/s\/nicovideo\/thumbnails\/38552050\/38552050.42707694.original\/r1280x720l?key=9a6b35e6af8b4e62fc4f081f66c503474eaf0d05f747b6174b4df3d61cadc852","https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38552050\/38552050.42707694.L","https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38552050\/38552050.42707694.M","https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38552050\/38552050.42707694"],"requiresSubscription":false,"expires":"2038-01-01T00:00:00+09:00","commentCount":6375,"keywords":"アニメ,2021年春アニメ,戦闘員、派遣します！,富田美憂,白井悠介,汚いダクネス,おちんちん祭り,派遣アニメ,金髪ロリ,全員悪人,工作員","genre":"アニメ","playerType":"HTML5","provider":{"@type":"Organization","name":"niconico"},"author":{"@type":"Organization","name":"戦闘員、派遣します！","image":"https:\/\/secure-dcdn.cdn.nimg.jp\/comch\/channel-icon\/128x128\/ch2647797.jpg?1617885165","url":"https:\/\/ch.nicovideo.jp\/channel\/ch2647797"}}
      </script>
              <script type="application/ld+json">
        {"@context":"http:\/\/schema.org","@type":"WebSite","name":"niconico","url":"https:\/\/www.nicovideo.jp\/"}
      </script>
              <script type="application/ld+json">
        {"@context":"http:\/\/schema.org","@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"item":{"@id":"https:\/\/www.nicovideo.jp\/video_top","name":"ニコニコ動画"}},{"@type":"ListItem","position":2,"item":{"@id":"https:\/\/www.nicovideo.jp\/video_top\/genre\/anime","name":"アニメ"}},{"@type":"ListItem","position":3,"item":{"@id":"https:\/\/www.nicovideo.jp\/tag\/アニメ","name":"アニメ"}}]}
      </script>
    
  </body>
</html>
"""#




let mockVideoPageNormal = #"""
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">      <link rel="preconnect" href="https://nicovideo.cdn.nimg.jp/web/"><link rel="preconnect" href="https://ads.nicovideo.jp/"><link rel="preconnect" href="https://nicovideo.cdn.nimg.jp/web/"><link rel="preconnect" href="http://nmsg.nicovideo.jp/api/"><link rel="preconnect" href="https://ads.nicovideo.jp/"><link rel="preconnect" href="https://public.api.nicovideo.jp/"><link rel="preconnect" href="https://www.googletagmanager.com">      <link rel="prefetch" href="https://nicovideo.cdn.nimg.jp/web/styles/pages/watch_failover2flash.css?423f64f8" id="js-failover2flash-css">      <link rel="preload" href="https://res.ads.nicovideo.jp/assets/js/ads2.js?ref=video" as="script"><link rel="preload" href="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/failover2flash/watch_failover2flash.js?025a757e" crossorigin="anonymous" as="script"><link rel="preload" href="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/legacy/watch_dll_a85f537ad43247eb5c58.js" crossorigin="anonymous" as="script"><link rel="preload" href="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/legacy/watch_app_e6b3c5b1faec5f9431ba.js" crossorigin="anonymous" as="script">      <link rel="shortcut icon" href="https://nicovideo.cdn.nimg.jp/web/images/favicon/favicon.ico"><link rel="icon" type="image/png" href="https://nicovideo.cdn.nimg.jp/web/images/favicon/32.png" sizes="32x32"><link rel="icon" type="image/png" href="https://nicovideo.cdn.nimg.jp/web/images/favicon/48.png" sizes="48x48"><link rel="icon" type="image/png" href="https://nicovideo.cdn.nimg.jp/web/images/favicon/96.png" sizes="96x96"><link rel="icon" type="image/png" href="https://nicovideo.cdn.nimg.jp/web/images/favicon/144.png" sizes="144x144">

    <title>にじさんじで付き合いたい異性の話で「ガチ回答」するりりむとその空気に引っ張られて焦るゲマズ女子会メンバー達【本間ひまわり / 笹木咲 / 椎名唯華 / 魔界ノりりむ / 赤羽葉子】 - Niconico Video</title>    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <script type="text/javascript">
      window.watch__startTime = Date.now();
      window.NativeDate = Date;
                  
      if (Math.random() < 1) {
        window.Ads = { protocol: 'https:' };
      }
      
    </script>

    <meta property="fb:app_id" content="378853695459932">
        <script type="text/javascript">
  window.NicoGoogleTagManagerDataLayer = [];

  const data = {};

    data.user = (function() {
    const user = {};

              user.user_id = '86130646';
      user.login_status = 'login';
      user.member_status = 'normal';
      user.birthday = '1919-08-10';
      user.sex = 'male';
      user.country = 'Japan';
      user.prefecture = '東京都';
      user.ui_area = 'jp';
      user.ui_lang = 'en-us';

        
    return user;
  })();

    data.content = (function() {
    const content = {};

              content.player_type = 'html5';
      content.genre = "Entertainment";
      content.content_type = "user";

                    return content;
  })();

  window.NicoGoogleTagManagerDataLayer.push(data);
</script>

    <script>
  
  (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
  })(window,document,'script','NicoGoogleTagManagerDataLayer','GTM-KXT7G5G');
  
</script>

    
    

    <link rel="stylesheet" type="text/css" href="https://nicovideo.cdn.nimg.jp/web/styles/pages/watch.css?c34154ae">
  </head>
  <body class="is-beforeInitialize en-us">

    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KXT7G5G" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>


    <div class="BaseLayout">
            <link href="https://nicovideo.cdn.nimg.jp/web/styles/modules/navigation/common_header/common_header.css?1593591677" rel="stylesheet">
<div id="CommonHeader" class="CommonHeader" data-common-header="{&quot;initConfig&quot;:{&quot;frontendId&quot;:6,&quot;frontendVersion&quot;:&quot;0&quot;,&quot;site&quot;:&quot;niconico&quot;,&quot;debug&quot;:{&quot;showAppeal&quot;:false},&quot;baseUrl&quot;:{&quot;accountUrl&quot;:&quot;https:\/\/account.nicovideo.jp&quot;,&quot;channelUrl&quot;:&quot;https:\/\/ch.nicovideo.jp&quot;,&quot;communityUrl&quot;:&quot;https:\/\/com.nicovideo.jp&quot;,&quot;nicoadUrl&quot;:&quot;https:\/\/nicoad.nicovideo.jp&quot;,&quot;niconicoUrl&quot;:&quot;https:\/\/www.nicovideo.jp&quot;},&quot;customization&quot;:{&quot;cmnhdRef&quot;:{&quot;page&quot;:&quot;watch&quot;},&quot;nextUrl&quot;:&quot;\/watch\/sm38564936&quot;,&quot;logoutNextUrl&quot;:&quot;\/&quot;,&quot;size&quot;:{&quot;hMargin&quot;:&quot;auto&quot;,&quot;maxWidth&quot;:&quot;1024px&quot;,&quot;minWidth&quot;:&quot;1024px&quot;},&quot;userPanelLinks&quot;:[{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/video_top&quot;,&quot;label&quot;:&quot;Niconico Video top page&quot;},{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/ranking&quot;,&quot;label&quot;:&quot;Ranking&quot;},{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/my\/watchlater&quot;,&quot;label&quot;:&quot;Watch Later&quot;},{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/my\/mylist&quot;,&quot;label&quot;:&quot;My Lists&quot;},{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/my\/history\/video&quot;,&quot;label&quot;:&quot;Watch History&quot;},{&quot;href&quot;:&quot;https:\/\/www.nicovideo.jp\/my\/follow&quot;,&quot;label&quot;:&quot;Following&quot;},{&quot;href&quot;:&quot;https:\/\/www.upload.nicovideo.jp\/garage\/&quot;,&quot;label&quot;:&quot;Uploads \/ Upload video&quot;},{&quot;href&quot;:&quot;https:\/\/blog.nicovideo.jp\/niconews\/category\/videotop\/&quot;,&quot;label&quot;:&quot;Niconico Info&quot;}]},&quot;user&quot;:{&quot;isLogin&quot;:true,&quot;id&quot;:86130646,&quot;isPremium&quot;:false,&quot;nickname&quot;:&quot;\u7530\u6240\u6d69\u4e8c&quot;,&quot;iconUrl&quot;:&quot;https:\/\/secure-dcdn.cdn.nimg.jp\/nicoaccount\/usericon\/defaults\/blank.jpg&quot;}},&quot;language&quot;:&quot;en&quot;,&quot;commonHeaderBaseUrl&quot;:&quot;https:\/\/secure-dcdn.cdn.nimg.jp\/&quot;}"></div>

            
      <div id="js-app"></div>
      <div id="js-initial-watch-data" data-api-data="{&quot;ads&quot;:null,&quot;category&quot;:null,&quot;channel&quot;:null,&quot;client&quot;:{&quot;nicosid&quot;:&quot;1617443004.1776781025&quot;,&quot;watchId&quot;:&quot;sm38564936&quot;,&quot;watchTrackId&quot;:&quot;ffd3HU25wc_1619270133770&quot;},&quot;comment&quot;:{&quot;server&quot;:{&quot;url&quot;:&quot;https:\/\/nmsg.nicovideo.jp\/api\/&quot;},&quot;keys&quot;:{&quot;userKey&quot;:&quot;1619271933.~1~KCWU2B6RWA3dYgA5VahATOlTCXY0NOZzvwCcwkmDLvk&quot;},&quot;layers&quot;:[{&quot;index&quot;:0,&quot;isTranslucent&quot;:false,&quot;threadIds&quot;:[{&quot;id&quot;:1618098124,&quot;fork&quot;:1}]},{&quot;index&quot;:1,&quot;isTranslucent&quot;:false,&quot;threadIds&quot;:[{&quot;id&quot;:1618098124,&quot;fork&quot;:0},{&quot;id&quot;:1618098124,&quot;fork&quot;:2}]}],&quot;threads&quot;:[{&quot;id&quot;:1618098124,&quot;fork&quot;:1,&quot;isActive&quot;:false,&quot;isDefaultPostTarget&quot;:false,&quot;isEasyCommentPostTarget&quot;:false,&quot;isLeafRequired&quot;:false,&quot;isOwnerThread&quot;:true,&quot;isThreadkeyRequired&quot;:false,&quot;threadkey&quot;:null,&quot;is184Forced&quot;:false,&quot;hasNicoscript&quot;:true,&quot;label&quot;:&quot;owner&quot;,&quot;postkeyStatus&quot;:0,&quot;server&quot;:&quot;https:\/\/nmsg.nicovideo.jp&quot;},{&quot;id&quot;:1618098124,&quot;fork&quot;:0,&quot;isActive&quot;:true,&quot;isDefaultPostTarget&quot;:true,&quot;isEasyCommentPostTarget&quot;:false,&quot;isLeafRequired&quot;:true,&quot;isOwnerThread&quot;:false,&quot;isThreadkeyRequired&quot;:false,&quot;threadkey&quot;:null,&quot;is184Forced&quot;:false,&quot;hasNicoscript&quot;:false,&quot;label&quot;:&quot;default&quot;,&quot;postkeyStatus&quot;:0,&quot;server&quot;:&quot;https:\/\/nmsg.nicovideo.jp&quot;},{&quot;id&quot;:1618098124,&quot;fork&quot;:2,&quot;isActive&quot;:true,&quot;isDefaultPostTarget&quot;:false,&quot;isEasyCommentPostTarget&quot;:true,&quot;isLeafRequired&quot;:true,&quot;isOwnerThread&quot;:false,&quot;isThreadkeyRequired&quot;:false,&quot;threadkey&quot;:null,&quot;is184Forced&quot;:false,&quot;hasNicoscript&quot;:false,&quot;label&quot;:&quot;easy&quot;,&quot;postkeyStatus&quot;:0,&quot;server&quot;:&quot;https:\/\/nmsg.nicovideo.jp&quot;}],&quot;ng&quot;:{&quot;ngScore&quot;:{&quot;isDisabled&quot;:false},&quot;channel&quot;:[],&quot;owner&quot;:[],&quot;viewer&quot;:{&quot;revision&quot;:1,&quot;count&quot;:0,&quot;items&quot;:[]}},&quot;isAttentionRequired&quot;:false},&quot;community&quot;:null,&quot;easyComment&quot;:{&quot;phrases&quot;:[{&quot;text&quot;:&quot;\u3046\u307d\u3064&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;\u3046\u307d\u3064&quot;,&quot;viewTitle&quot;:&quot;\u3046\u307d\u3064&quot;,&quot;summary&quot;:&quot;\u3046\u307d\u3064\u3068\u306f\u3046\uff50\u4e59\u306e\u3053\u3068\u3067\u3046\uff50(\u30a2\u30c3\u30d7\u30ed\u30fc\u30c9)\u4e59(\u304a\u75b2\u308c\u69d8\u3067\u3059)\u3068\u3044\u3046\u610f\u5473\u3002\u8a9e\u6e90\u306f\u3046\uff50\u3068\u4e59\u3092\u30ed\u30fc\u30de\u5b57\u3067\u6253\u3064\u3068\u300c\u3046\u307d\u3064\u300d\uff08up otu\u2192u po tu\uff09\u306b\u306a\u308b\u3053\u3068\u304b\u3089\u3002\n\u985e\u7fa9\u8a9e\u306b\u3046\u3071\u308a\u304c\u3042\u308b\u3002\n\u95a2\u9023\u9805\u76ee\n&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%E3%81%86%E3%81%BD%E3%81%A4&quot;}},{&quot;text&quot;:&quot;www&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;www&quot;,&quot;viewTitle&quot;:&quot;www&quot;,&quot;summary&quot;:&quot;www\u3068\u306f\n World Wide Web\uff08\u30ef\u30fc\u30eb\u30c9\u30ef\u30a4\u30c9\u30a6\u30a7\u30d6\uff09\n ASIAN KUNG-FU GENERATION\u306e4th\u30d5\u30eb\u30a2\u30eb\u30d0\u30e0\u300e\u30ef\u30fc\u30eb\u30c9\u00a0\u30ef\u30fc\u30eb\u30c9\u00a0\u30ef\u30fc\u30eb\u30c9\u300f\u306e\u7701\u7565\u8868\u8a18\n QuinRose&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/www&quot;}},{&quot;text&quot;:&quot;\u304b\u308f\u3044\u3044&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;\u304b\u308f\u3044\u3044&quot;,&quot;viewTitle&quot;:&quot;\u304b\u308f\u3044\u3044&quot;,&quot;summary&quot;:&quot;\u304b\u308f\u3044\u3044\uff08\u53ef\u611b\u3044\uff09\u3068\u306f\u3001\u611b\u3089\u3057\u3044\u3001\u611b\u3059\u3079\u304d\u3082\u306e\u3001\u305d\u3046\u3044\u3063\u305f\u8da3\u306e\u3042\u308b\u3082\u306e\u306b\u5fc3\u3092\u3072\u304b\u308c\u3001\u5927\u5207\u306b\u3057\u305f\u3044\u69d8\u3092\u8868\u3059\u8a00\u8449\u3067\u3042\u308b\u3002\n\u6982\u8981\n\u8a9e\u6e90\u306f\u5e73\u5b89\u6642\u4ee3\u304b\u3089\u898b\u3089\u308c\u305f\u300c\u304b\u307b\u306f\u3086\u3057\uff08\u9854\u6620\u3086\u3057\uff09\u300d\u3002\uff1c\u9854\u3092\u5411\u3051\u3066\u3044\u3089\u308c\u306a\u3044&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%E3%81%8B%E3%82%8F%E3%81%84%E3%81%84&quot;}},{&quot;text&quot;:&quot;\u304b\u3063\u3053\u3044\u3044&quot;,&quot;nicodic&quot;:null},{&quot;text&quot;:&quot;\u3059\u304d&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;\u3059\u304d&quot;,&quot;viewTitle&quot;:&quot;\u3059\u304d&quot;,&quot;summary&quot;:&quot;\u3082\u3057\u304b\u3057\u3066? \u2192 \u597d\u304d\n\u3072\u3087\u3063\u3068\u3057\u3066? \u2192 \u92e4\n\u6982\u8981\n\u9699\u3042\u308a\u3063! \u3053\u308c\u3067\u5168\u90e8\u3060\u3068\u601d\u3046\u305f\u304b!?\n\u95a2\u9023\u9759\u753b\n\u95a2\u9023\u9805\u76ee\n \u3059\u3059\u304d\u306e\n \u81ea\u52d5\u30ea\u30f3\u30af\u3055\u308c\u3066\u3044\u306a\u3044\u8a18\u4e8b\u306e\u4e00\u89a7&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%E3%81%99%E3%81%8D&quot;}},{&quot;text&quot;:&quot;\u3053\u3053\u3059\u304d&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;\u3053\u3053\u3059\u304d&quot;,&quot;viewTitle&quot;:&quot;\u3053\u3053\u3059\u304d&quot;,&quot;summary&quot;:&quot;\u767a\u7965\n\u30a2\u30a4\u30de\u30b9MAD\u300c\u3082\u3063\u3068\u3059\u3044\u307f\u3093\u3076\u305d\u304f\u300d\u304c\u767a\u7965\u3067\u3042\u308b\n\u666e\u53ca\n\u30cb\u30b3\u30cb\u30b3\u52d5\u753b\u3067\u306e\u516c\u5f0f\u30a2\u30cb\u30e1\u914d\u4fe1\u4ee5\u964d\u3001\u4ed6\u306e\u30a2\u30cb\u30e1\u306eOP\u3067\u300c\u3053\u3053\u3059\u304d\u300d\u3068\u3044\u3046\u30b3\u30e1\u30f3\u30c8\u304c\u5ea6\u3005\u898b\u53d7\u3051\u3089\u308c\u3066\u3044\u305f\u304c\u3001\n\u300c\u82b1\u54b2\u304f\u3044\u308d\u306f\u300d\u306eOP\u3067\u306e\u5f3e&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%E3%81%93%E3%81%93%E3%81%99%E3%81%8D&quot;}},{&quot;text&quot;:&quot;\u308f\u304b\u308b&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;\u308f\u304b\u308b&quot;,&quot;viewTitle&quot;:&quot;\u308f\u304b\u308b&quot;,&quot;summary&quot;:&quot;\u308f\u304b\u308b\u3068\u306f\u3001\u7406\u89e3\u30fb\u540c\u610f\u3057\u3066\u3044\u308b\u3053\u3068\u3092\u6307\u3059\u8a00\u8449\u3067\u3042\u308b\u3002\n\u6982\u8981\n\u6f22\u5b57\u8868\u793a\u306f\u300c\u5206\u304b\u308b\u300d\u300c\u89e3\u308b\u300d\u300c\u5224\u308b\u300d\u304c\u3042\u308b\u304c\u3001\u300c\u308f\u304b\u308b\u300d\u3068\u3072\u3089\u304c\u306a\u3067\u66f8\u304f\u3053\u3068\u304c\u6bd4\u8f03\u7684\u591a\u3044\u3002\u300c\u77e5\u8b58\u3068\u3057\u3066\u6301\u3063\u3066\u3044\u308b\u300d\u3068\u3044\u3046\u610f\u5473\u3067\u306f\u300c\u77e5\u308b\u300d\u3068\u3044&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%E3%82%8F%E3%81%8B%E3%82%8B&quot;}},{&quot;text&quot;:&quot;\u3042\u3063&quot;,&quot;nicodic&quot;:null},{&quot;text&quot;:&quot;\uff01\uff1f&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;!?&quot;,&quot;viewTitle&quot;:&quot;\uff01\uff1f&quot;,&quot;summary&quot;:&quot;\u6982\u8981!?\n!?\u3068\u306f\&quot;\u5f37\u70c8\&quot;\u304b\u3064\&quot;\u7406\u89e3\u4e0d\u80fd\&quot;\u306a\u9a5a\u304d\u3092\u793a\u3059\u7d04\u7269\uff08\u8a18\u53f7\uff09\u3067\u3042\u308b\u2026!?\n\u5c02\u9580\u7528\u8a9e\u3067\u306f\u300c\u611f\u5606\u7b26\u7591\u554f\u7b26\u300d\u3068\u3044\u3046\u540d\u524d\u3067\u3042\u308b\u3002\u6295\u3052\u3084\u308a\u3058\u3083\u306d\u3048\u304b!?\n\u7565\u3059\u308b\u3068\u300c\u611f\u5606\u4fee\u8f9e\u7591\u554f\u7b26\u300d\u3068\u3044\u3046\u9577\u3063\u305f\u3089\u3057\u3044\u4e0a\u306b\u3088&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%21%3F&quot;}},{&quot;text&quot;:&quot;\u304a\u3064&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;\u304a\u3064&quot;,&quot;viewTitle&quot;:&quot;\u304a\u3064&quot;,&quot;summary&quot;:&quot;\u4e59\u3068\u306f\u3001\u4ee5\u4e0b\u306e\u3053\u3068\u3092\u8868\u3059\u3002\n \u4e59\uff08\u304a\u3064\u3001\u304d\u306e\u3068\uff09 - \u5341\u5e72\u306e\u7b2c2\u4f4d\u3002\u4e94\u884c\u306f\u6728\u3001\u9670\u967d\u306f\u9670\u3002\u8349\u82b1\u3092\u8c61\u5fb4\u3057\u3001\u5354\u8abf\u30fb\u793e\u4ea4\u30fb\u548c\u5408\u3092\u610f\u5473\u3059\u308b\u3002\n \u4e59\uff08\u304a\u3064\uff09 - \u7532\u3067\u59cb\u307e\u308b\u9806\u4f4d\u306e\u7b2c2\u4f4d\u3002\u300c\u4e59\u7a2e\u300d\u300c\u7532\u4e59\u3064\u3051\u304c\u305f\u3044\u300d&quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/%E3%81%8A%E3%81%A4&quot;}},{&quot;text&quot;:&quot;88888888&quot;,&quot;nicodic&quot;:{&quot;title&quot;:&quot;88888888&quot;,&quot;viewTitle&quot;:&quot;88888888&quot;,&quot;summary&quot;:&quot;8\u306f\u6574\u6570\u306e\u3072\u3068\u3064\u30027\u306e\u6b21\u30019\u306e\u524d\u3002\n\u6982\u8981\n \u9178\u7d20(O)\u306e\u539f\u5b50\u756a\u53f7\u3002\n \u6a2a\u306b\u5012\u3059\u3068\u221e\u306b\u306a\u3063\u3066\u3057\u307e\u3046\u306e\u3067\u6ce8\u610f\u30028\u304b\u3089\u305a\u3044\u3076\u3093\u96e2\u308c\u3066\u3057\u307e\u3046\u3002\n \u300c\u516b\u300d\u306f\u672b\u5e83\u304c\u308a\u306e\u5f62\u3092\u3057\u3066\u3044\u308b\u305f\u3081\u3001\u7e01\u8d77\u306e\u826f\u3044\u6570\u3068\u3055\u308c\u308b\u3002\n &quot;,&quot;link&quot;:&quot;https:\/\/dic.nicovideo.jp\/a\/88888888&quot;}}]},&quot;external&quot;:{&quot;commons&quot;:{&quot;hasContentTree&quot;:false},&quot;ichiba&quot;:{&quot;isEnabled&quot;:true}},&quot;genre&quot;:{&quot;key&quot;:&quot;entertainment&quot;,&quot;label&quot;:&quot;Entertainment&quot;,&quot;isImmoral&quot;:false,&quot;isDisabled&quot;:false,&quot;isNotSet&quot;:false},&quot;marquee&quot;:{&quot;isDisabled&quot;:false,&quot;tagRelatedLead&quot;:null},&quot;media&quot;:{&quot;delivery&quot;:{&quot;recipeId&quot;:&quot;nicovideo-sm38564936&quot;,&quot;encryption&quot;:null,&quot;movie&quot;:{&quot;contentId&quot;:&quot;out1&quot;,&quot;audios&quot;:[{&quot;id&quot;:&quot;archive_aac_192kbps&quot;,&quot;isAvailable&quot;:false,&quot;metadata&quot;:{&quot;bitrate&quot;:192000,&quot;samplingRate&quot;:48000,&quot;loudness&quot;:{&quot;integratedLoudness&quot;:-16.60000000000000142108547152020037174224853515625,&quot;truePeak&quot;:0},&quot;levelIndex&quot;:1,&quot;loudnessCollection&quot;:[{&quot;type&quot;:&quot;video&quot;,&quot;value&quot;:1},{&quot;type&quot;:&quot;pureAdPreroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;houseAdPreroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;networkAdPreroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;pureAdMidroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;houseAdMidroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;networkAdMidroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;pureAdPostroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;houseAdPostroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;networkAdPostroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;nicoadVideoIntroduce&quot;,&quot;value&quot;:0.7413102413009173830005238414742052555084228515625},{&quot;type&quot;:&quot;nicoadBillboard&quot;,&quot;value&quot;:1},{&quot;type&quot;:&quot;marquee&quot;,&quot;value&quot;:0.9332543007969908988030738328234292566776275634765625}]}},{&quot;id&quot;:&quot;archive_aac_64kbps&quot;,&quot;isAvailable&quot;:true,&quot;metadata&quot;:{&quot;bitrate&quot;:64000,&quot;samplingRate&quot;:48000,&quot;loudness&quot;:{&quot;integratedLoudness&quot;:-16.60000000000000142108547152020037174224853515625,&quot;truePeak&quot;:0},&quot;levelIndex&quot;:0,&quot;loudnessCollection&quot;:[{&quot;type&quot;:&quot;video&quot;,&quot;value&quot;:1},{&quot;type&quot;:&quot;pureAdPreroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;houseAdPreroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;networkAdPreroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;pureAdMidroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;houseAdMidroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;networkAdMidroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;pureAdPostroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;houseAdPostroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;networkAdPostroll&quot;,&quot;value&quot;:0.5888436553555889130251443930319510400295257568359375},{&quot;type&quot;:&quot;nicoadVideoIntroduce&quot;,&quot;value&quot;:0.7413102413009173830005238414742052555084228515625},{&quot;type&quot;:&quot;nicoadBillboard&quot;,&quot;value&quot;:1},{&quot;type&quot;:&quot;marquee&quot;,&quot;value&quot;:0.9332543007969908988030738328234292566776275634765625}]}}],&quot;videos&quot;:[{&quot;id&quot;:&quot;archive_h264_1080p&quot;,&quot;isAvailable&quot;:false,&quot;metadata&quot;:{&quot;label&quot;:&quot;1080p&quot;,&quot;bitrate&quot;:4000000,&quot;resolution&quot;:{&quot;width&quot;:1920,&quot;height&quot;:1080},&quot;levelIndex&quot;:4,&quot;recommendedHighestAudioLevelIndex&quot;:1}},{&quot;id&quot;:&quot;archive_h264_720p&quot;,&quot;isAvailable&quot;:false,&quot;metadata&quot;:{&quot;label&quot;:&quot;720p&quot;,&quot;bitrate&quot;:2000000,&quot;resolution&quot;:{&quot;width&quot;:1280,&quot;height&quot;:720},&quot;levelIndex&quot;:3,&quot;recommendedHighestAudioLevelIndex&quot;:1}},{&quot;id&quot;:&quot;archive_h264_480p&quot;,&quot;isAvailable&quot;:false,&quot;metadata&quot;:{&quot;label&quot;:&quot;480p&quot;,&quot;bitrate&quot;:1600000,&quot;resolution&quot;:{&quot;width&quot;:854,&quot;height&quot;:480},&quot;levelIndex&quot;:2,&quot;recommendedHighestAudioLevelIndex&quot;:1}},{&quot;id&quot;:&quot;archive_h264_360p&quot;,&quot;isAvailable&quot;:true,&quot;metadata&quot;:{&quot;label&quot;:&quot;360p&quot;,&quot;bitrate&quot;:600000,&quot;resolution&quot;:{&quot;width&quot;:640,&quot;height&quot;:360},&quot;levelIndex&quot;:1,&quot;recommendedHighestAudioLevelIndex&quot;:1}},{&quot;id&quot;:&quot;archive_h264_360p_low&quot;,&quot;isAvailable&quot;:true,&quot;metadata&quot;:{&quot;label&quot;:&quot;Low-Quality&quot;,&quot;bitrate&quot;:300000,&quot;resolution&quot;:{&quot;width&quot;:640,&quot;height&quot;:360},&quot;levelIndex&quot;:0,&quot;recommendedHighestAudioLevelIndex&quot;:1}}],&quot;session&quot;:{&quot;recipeId&quot;:&quot;nicovideo-sm38564936&quot;,&quot;playerId&quot;:&quot;nicovideo-6-ffd3HU25wc_1619270133770&quot;,&quot;videos&quot;:[&quot;archive_h264_360p&quot;,&quot;archive_h264_360p_low&quot;],&quot;audios&quot;:[&quot;archive_aac_64kbps&quot;],&quot;movies&quot;:[],&quot;protocols&quot;:[&quot;http&quot;,&quot;hls&quot;],&quot;authTypes&quot;:{&quot;http&quot;:&quot;ht2&quot;,&quot;hls&quot;:&quot;ht2&quot;},&quot;serviceUserId&quot;:&quot;86130646&quot;,&quot;token&quot;:&quot;{\&quot;service_id\&quot;:\&quot;nicovideo\&quot;,\&quot;player_id\&quot;:\&quot;nicovideo-6-ffd3HU25wc_1619270133770\&quot;,\&quot;recipe_id\&quot;:\&quot;nicovideo-sm38564936\&quot;,\&quot;service_user_id\&quot;:\&quot;86130646\&quot;,\&quot;protocols\&quot;:[{\&quot;name\&quot;:\&quot;http\&quot;,\&quot;auth_type\&quot;:\&quot;ht2\&quot;},{\&quot;name\&quot;:\&quot;hls\&quot;,\&quot;auth_type\&quot;:\&quot;ht2\&quot;}],\&quot;videos\&quot;:[\&quot;archive_h264_360p\&quot;,\&quot;archive_h264_360p_low\&quot;],\&quot;audios\&quot;:[\&quot;archive_aac_64kbps\&quot;],\&quot;movies\&quot;:[],\&quot;created_time\&quot;:1619270133000,\&quot;expire_time\&quot;:1619356533000,\&quot;content_ids\&quot;:[\&quot;out1\&quot;],\&quot;heartbeat_lifetime\&quot;:120000,\&quot;content_key_timeout\&quot;:600000,\&quot;priority\&quot;:0.40000000000000002220446049250313080847263336181640625,\&quot;transfer_presets\&quot;:[]}&quot;,&quot;signature&quot;:&quot;e177586380206e73a67f3432063b38ece56b70e577564ad9142a57fab3624e51&quot;,&quot;contentId&quot;:&quot;out1&quot;,&quot;heartbeatLifetime&quot;:120000,&quot;contentKeyTimeout&quot;:600000,&quot;priority&quot;:0.40000000000000002220446049250313080847263336181640625,&quot;transferPresets&quot;:[],&quot;urls&quot;:[{&quot;url&quot;:&quot;https:\/\/api.dmc.nico\/api\/sessions&quot;,&quot;isWellKnownPort&quot;:true,&quot;isSsl&quot;:true}]}},&quot;storyboard&quot;:null,&quot;trackingId&quot;:&quot;xrvtthxiw+go1353juynee5dt33djwpl75szrlywmvxit6twg7cl0b+ktz7k23+x7hujwyeuum5e4o6iv80pceumqy2l59nmbd4d\/+78ar0=&quot;},&quot;deliveryLegacy&quot;:null},&quot;okReason&quot;:&quot;PURELY&quot;,&quot;owner&quot;:{&quot;id&quot;:2333973,&quot;nickname&quot;:&quot;\u306b\u3058\u3055\u3093\u3058\u5207\u308a\u629c\u304d\u30a2\u30fc\u30ab\u30a4\u30d6\u30b9&quot;,&quot;iconUrl&quot;:&quot;https:\/\/secure-dcdn.cdn.nimg.jp\/nicoaccount\/usericon\/233\/2333973.jpg?1599142780&quot;,&quot;channel&quot;:null,&quot;live&quot;:null,&quot;isVideosPublic&quot;:true,&quot;isMylistsPublic&quot;:true,&quot;viewer&quot;:{&quot;isFollowing&quot;:false}},&quot;payment&quot;:{&quot;video&quot;:{&quot;isPpv&quot;:false,&quot;isAdmission&quot;:false,&quot;isPremium&quot;:false,&quot;watchableUserType&quot;:&quot;all&quot;,&quot;commentableUserType&quot;:&quot;all&quot;},&quot;preview&quot;:{&quot;ppv&quot;:{&quot;isEnabled&quot;:false},&quot;admission&quot;:{&quot;isEnabled&quot;:false},&quot;premium&quot;:{&quot;isEnabled&quot;:false}}},&quot;pcWatchPage&quot;:{&quot;tagRelatedBanner&quot;:null,&quot;videoEnd&quot;:{&quot;bannerIn&quot;:null,&quot;overlay&quot;:null},&quot;showOwnerMenu&quot;:false,&quot;showOwnerThreadCoEditingLink&quot;:false,&quot;showMymemoryEditingLink&quot;:false},&quot;player&quot;:{&quot;initialPlayback&quot;:null,&quot;comment&quot;:{&quot;isDefaultInvisible&quot;:false},&quot;layerMode&quot;:0},&quot;ppv&quot;:null,&quot;ranking&quot;:{&quot;genre&quot;:{&quot;rank&quot;:1,&quot;genre&quot;:&quot;Entertainment&quot;,&quot;dateTime&quot;:&quot;2021-04-12T07:00:00+09:00&quot;},&quot;popularTag&quot;:[{&quot;tag&quot;:&quot;\u306b\u3058\u3055\u3093\u3058&quot;,&quot;regularizedTag&quot;:&quot;\u30cb\u30b8\u30b5\u30f3\u30b8&quot;,&quot;rank&quot;:1,&quot;genre&quot;:&quot;Entertainment&quot;,&quot;dateTime&quot;:&quot;2021-04-12T07:00:00+09:00&quot;},{&quot;tag&quot;:&quot;\u30d0\u30fc\u30c1\u30e3\u30eb&quot;,&quot;regularizedTag&quot;:&quot;\u30d0\u30fc\u30c1\u30e3\u30eb&quot;,&quot;rank&quot;:1,&quot;genre&quot;:&quot;Entertainment&quot;,&quot;dateTime&quot;:&quot;2021-04-12T00:00:00+09:00&quot;},{&quot;tag&quot;:&quot;\u30d0\u30fc\u30c1\u30e3\u30ebYouTuber&quot;,&quot;regularizedTag&quot;:&quot;\u30d0\u30fc\u30c1\u30e3\u30ebYOUTUBER&quot;,&quot;rank&quot;:1,&quot;genre&quot;:&quot;Entertainment&quot;,&quot;dateTime&quot;:&quot;2021-04-12T07:00:00+09:00&quot;},{&quot;tag&quot;:&quot;\u30d0\u30fc\u30c1\u30e3\u30ebyoutuber\u898b\u3069\u3053\u308d\u307e\u3068\u3081\u30ea\u30f3\u30af&quot;,&quot;regularizedTag&quot;:&quot;\u30d0\u30fc\u30c1\u30e3\u30ebYOUTUBER\u898b\u30c9\u30b3\u30ed\u30de\u30c8\u30e1\u30ea\u30f3\u30af&quot;,&quot;rank&quot;:4,&quot;genre&quot;:&quot;Entertainment&quot;,&quot;dateTime&quot;:&quot;2021-04-16T00:00:00+09:00&quot;}]},&quot;series&quot;:{&quot;id&quot;:116809,&quot;title&quot;:&quot;\u306b\u3058\u3055\u3093\u3058\u5207\u308a\u629c\u304d&quot;,&quot;description&quot;:&quot;&quot;,&quot;thumbnailUrl&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/web\/img\/series\/no_thumbnail.png&quot;,&quot;video&quot;:{&quot;prev&quot;:{&quot;type&quot;:&quot;essential&quot;,&quot;id&quot;:&quot;sm38495209&quot;,&quot;title&quot;:&quot;\u3010\u30a2\u30de\u30ac\u30df\/\u6708\u30ce\u7f8e\u514e\u3011\u59b9\u30eb\u30fc\u30c8\u306b\u5165\u3063\u305f\u304b\u3068\u601d\u3063\u305f\u3089\u30db\u25cb\u30eb\u30fc\u30c8\u306b\u7a81\u5165\u3057\u3066\u305f\u307e\u3052\u308b\u6708\u30ce\u7f8e\u514e\u3010\u306b\u3058\u3055\u3093\u3058\/\u5207\u308a\u629c\u304d\u3011&quot;,&quot;registeredAt&quot;:&quot;2021-03-27T20:11:03+09:00&quot;,&quot;count&quot;:{&quot;view&quot;:7144,&quot;comment&quot;:49,&quot;mylist&quot;:14,&quot;like&quot;:27},&quot;thumbnail&quot;:{&quot;url&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38495209\/38495209.84301034&quot;,&quot;middleUrl&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38495209\/38495209.84301034.M&quot;,&quot;largeUrl&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38495209\/38495209.84301034.L&quot;,&quot;listingUrl&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38495209\/38495209.84301034.M&quot;,&quot;nHdUrl&quot;:&quot;https:\/\/img.cdn.nimg.jp\/s\/nicovideo\/thumbnails\/38495209\/38495209.84301034.original\/r640x360l?key=f5cfa3017ec3ae280516d3a9b8a41de719f686be418b5de3a494d27f57cd93bd&quot;},&quot;duration&quot;:747,&quot;shortDescription&quot;:&quot;\u25a1 \u672c\u7de8\u306f\u3053\u3061\u3089 \u30a2\u30de\u30ac\u30df\u3067\u5168\u54e1\u653b\u7565\u3057\u306a\u3044\u3068\u51fa\u3066\u3053\u306a\u3044\u30e4\u30f3\u30c7\u30ec\u30ad\u30e3\u30e9\u304c\u3044\u308b\u3089\u3057\u3044\u5f8c\u7de8\u3010\u306b\u3058\u3055\u3093\u3058\/\u6708&quot;,&quot;latestCommentSummary&quot;:&quot;\u3042\u3044\u3046\u304a \u305d\u3046\u3044\u3046\u3053\u3068\u3060\u3063\u3066\u3070\u3088... \u6885\u539f\u304c\u3041!\u8fd1\u3065\u3044\u3066\u3047!\u6885\u539f\u304c\u3041!\u753b\u9762\u7aef\u30a3! \u7d17\u6c5f\u3061\u3083\u3093\u306e\u30bd\u30a8\u30f3\u6700\u5f8c\u307e\u3067\u898b\u308c\u306a\u304b\u3063\u305f\u306e\u304c\u75db\u3044\u306a \u300c\u306b\u3043\u306b\u3001\u3060\u3044\u300d\u307e\u3067\u3067\u6c17\u7d76\u3057\u305d\u3046\u306b\u306a\u3063\u305f \u8349 \u8a69\u5b50\u51c6\u6559\u6388\u306e\u898b\u89e3\u3092\u805e\u3044\u3066\u307f\u305f\u3044 \u8349 \u72ed\u3044\u305e(\u6697\u55a9) \u3046\u307b\u3063 \u3053\u308c\u3082\u3046\u5165...&quot;,&quot;isChannelVideo&quot;:false,&quot;isPaymentRequired&quot;:false,&quot;playbackPosition&quot;:null,&quot;owner&quot;:{&quot;ownerType&quot;:&quot;user&quot;,&quot;id&quot;:&quot;2333973&quot;,&quot;name&quot;:&quot;\u306b\u3058\u3055\u3093\u3058\u5207\u308a\u629c\u304d\u30a2\u30fc\u30ab\u30a4\u30d6\u30b9&quot;,&quot;iconUrl&quot;:&quot;https:\/\/secure-dcdn.cdn.nimg.jp\/nicoaccount\/usericon\/233\/2333973.jpg?1599142780&quot;},&quot;requireSensitiveMasking&quot;:false,&quot;9d091f87&quot;:false,&quot;acf68865&quot;:false},&quot;next&quot;:{&quot;type&quot;:&quot;essential&quot;,&quot;id&quot;:&quot;sm38565434&quot;,&quot;title&quot;:&quot;\u3010\u6708\u30ce\u7f8e\u514e\u3011\u59d4\u54e1\u9577\u30c8\u30ed\u30d5\u30a3\u30fc\u7372\u5f97\u30b7\u30fc\u30f3\u96c6\u3010\u306b\u3058\u3055\u3093\u3058\/\u5207\u308a\u629c\u304d\u3011&quot;,&quot;registeredAt&quot;:&quot;2021-04-11T11:37:03+09:00&quot;,&quot;count&quot;:{&quot;view&quot;:2631,&quot;comment&quot;:34,&quot;mylist&quot;:23,&quot;like&quot;:15},&quot;thumbnail&quot;:{&quot;url&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38565434\/38565434.97790965&quot;,&quot;middleUrl&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38565434\/38565434.97790965.M&quot;,&quot;largeUrl&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38565434\/38565434.97790965.L&quot;,&quot;listingUrl&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38565434\/38565434.97790965.M&quot;,&quot;nHdUrl&quot;:&quot;https:\/\/img.cdn.nimg.jp\/s\/nicovideo\/thumbnails\/38565434\/38565434.97790965.original\/r640x360l?key=393796a8700a7e1d71f0c10b03d2dc72f50e65c1a8e69fcdf08572f62e3400a8&quot;},&quot;duration&quot;:2037,&quot;shortDescription&quot;:&quot;\u6708\u30ce\u7f8e\u514eYouTube\u25a1 \u00a0https:\/\/www.youtube.com\/channel\/UCD-&quot;,&quot;latestCommentSummary&quot;:&quot;\u4f1d\u8aac\u306e\u30b7\u30fc\u30f3 \u81f4\u6b7b\u91cf\u304c\u904e\u304e\u308b \u7dca\u5f35\u3068\u8208\u596e\u3067\u3068\u3063\u6563\u3089\u304b\u308b\u59d4\u54e1\u9577\u3082\u3059\u304d \u30c5\u30a1\u30ae\u30ce\u7f8e\u514e \u8b0e\u30b9\u30a4\u30c3\u30c1 \u30d8\u30e9\u30d4\u30f3\u3042\u3044\u3057\u3066\u308b \u30af\u30bd\u30c7\u30ab\u30a6\u30b5\u30df\u30df\u3059\u304d \u3053\u308c\u304c\u306b\u3058\u3055\u3093\u3058\u30de\u30b9\u30b3\u30c3\u30c4\u306e\u539f\u578b\u304b\u30fb\u30fb\u30fb \u30ad\u30ec\u25cb \u611f\u5ea62\u500dw \u306a\u3063\u3064 \u3061\u3087\u3053\u3061\u3087\u3053\u3057\u3066\u3066\u304b\u308f\u3044\u3044 \u521d\u671f3D\u306f\u3053\u308c\u306f...&quot;,&quot;isChannelVideo&quot;:false,&quot;isPaymentRequired&quot;:false,&quot;playbackPosition&quot;:null,&quot;owner&quot;:{&quot;ownerType&quot;:&quot;user&quot;,&quot;id&quot;:&quot;2333973&quot;,&quot;name&quot;:&quot;\u306b\u3058\u3055\u3093\u3058\u5207\u308a\u629c\u304d\u30a2\u30fc\u30ab\u30a4\u30d6\u30b9&quot;,&quot;iconUrl&quot;:&quot;https:\/\/secure-dcdn.cdn.nimg.jp\/nicoaccount\/usericon\/233\/2333973.jpg?1599142780&quot;},&quot;requireSensitiveMasking&quot;:false,&quot;9d091f87&quot;:false,&quot;acf68865&quot;:false},&quot;first&quot;:{&quot;type&quot;:&quot;essential&quot;,&quot;id&quot;:&quot;sm36609760&quot;,&quot;title&quot;:&quot;\u30b9\u30d1\u30e0\u306b\u8972\u308f\u308c\u308b\u3053\u3042\u304f\u307e\u3093\u300c\u4eba\u306e\u3075\u3093\u3069\u3057\u3067\u3075\u3093\u3069\u3057\u53d6\u308b\u306e\u3084\u3081\u308b\u306e\u3060\u300d&quot;,&quot;registeredAt&quot;:&quot;2020-04-02T15:07:02+09:00&quot;,&quot;count&quot;:{&quot;view&quot;:8162,&quot;comment&quot;:54,&quot;mylist&quot;:29,&quot;like&quot;:3},&quot;thumbnail&quot;:{&quot;url&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/36609760\/36609760.83984788&quot;,&quot;middleUrl&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/36609760\/36609760.83984788.M&quot;,&quot;largeUrl&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/36609760\/36609760.83984788.L&quot;,&quot;listingUrl&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/36609760\/36609760.83984788.M&quot;,&quot;nHdUrl&quot;:&quot;https:\/\/img.cdn.nimg.jp\/s\/nicovideo\/thumbnails\/36609760\/36609760.83984788.original\/r640x360l?key=3dda1f0cb21ebe007ea0f1b6ab8950c5630ca22440decbc39c9c8ad042bf5c64&quot;},&quot;duration&quot;:448,&quot;shortDescription&quot;:&quot;\u5f37\u8005\u306e\u6d1e\u7a9f\u3092\u653b\u7565\u3057\u3088\u3046\u3068\u3059\u308b\u6700\u4e2d\u3001\u57f7\u62d7\u306a\u30b9\u30d1\u30e0\u653b\u6483\u306b\u898b\u821e\u308f\u308c\u308b\u3002\u672c\u7de8\u2192\u00a0https:\/\/www.yo&quot;,&quot;latestCommentSummary&quot;:&quot;\u30ed\u30a2\u306e\u3075\u3093\u3069\u3057\u6b32\u3057\u3044 \u6c5a\u540d\u633d\u56de\u304c\u307e\u3055\u3057\u304f\u3067\u8349 \u88f8\u306e\u304a\u59c9\u3055\u3093\u305f\u3061!? \u5ba3\u4f1d\u76ee\u7684\u306a\u3093\u3066\u306f\u3058\u3081\u304b\u3089\u3044\u306a\u3044\u305e \u30b2\u30fc\u30e0\u5b9f\u6cc1\u306f\u3075\u3093\u3069\u3057\u306e\u5ba3\u4f1d\u306b\u306a\u308b\u304b\u3089\u3044\u3044\u3093\u3060\u3088 \u982d\u3068\u3051\u308b \u3053\u306e\u30b3\u30f3\u30d3\u8133\u307f\u305d\u89e3\u3051\u308b\u308f \u5927\u4e8b\u306a\u3082\u306e=\u80a1\u9593 \u30ed\u30a2\u3061\u3083\u3093\u3059\u3050\u8aac\u660e\u3042\u304d\u3089\u3081\u308b\u306e\u304b\u308f\u3044\u3044 \u81ea\u5206\u3067\u6d88\u305b\u3068&quot;,&quot;isChannelVideo&quot;:false,&quot;isPaymentRequired&quot;:false,&quot;playbackPosition&quot;:null,&quot;owner&quot;:{&quot;ownerType&quot;:&quot;user&quot;,&quot;id&quot;:&quot;2333973&quot;,&quot;name&quot;:&quot;\u306b\u3058\u3055\u3093\u3058\u5207\u308a\u629c\u304d\u30a2\u30fc\u30ab\u30a4\u30d6\u30b9&quot;,&quot;iconUrl&quot;:&quot;https:\/\/secure-dcdn.cdn.nimg.jp\/nicoaccount\/usericon\/233\/2333973.jpg?1599142780&quot;},&quot;requireSensitiveMasking&quot;:false,&quot;9d091f87&quot;:false,&quot;acf68865&quot;:false}}},&quot;smartphone&quot;:null,&quot;system&quot;:{&quot;serverTime&quot;:&quot;2021-04-24T22:15:33+09:00&quot;,&quot;isPeakTime&quot;:true},&quot;tag&quot;:{&quot;items&quot;:[],&quot;hasR18Tag&quot;:false,&quot;isPublishedNicoscript&quot;:false,&quot;edit&quot;:{&quot;isEditable&quot;:true,&quot;uneditableReason&quot;:null,&quot;editKey&quot;:&quot;1:1619270133:1618098124:f8acea4db68a4d07d1653916e3b3687863a73d86b7c2a8f2ff05fbfa7dba1f18&quot;},&quot;viewer&quot;:{&quot;isEditable&quot;:true,&quot;uneditableReason&quot;:null,&quot;editKey&quot;:&quot;1:1619270133:1618098124:f8acea4db68a4d07d1653916e3b3687863a73d86b7c2a8f2ff05fbfa7dba1f18&quot;}},&quot;video&quot;:{&quot;id&quot;:&quot;sm38564936&quot;,&quot;title&quot;:&quot;\u306b\u3058\u3055\u3093\u3058\u3067\u4ed8\u304d\u5408\u3044\u305f\u3044\u7570\u6027\u306e\u8a71\u3067\u300c\u30ac\u30c1\u56de\u7b54\u300d\u3059\u308b\u308a\u308a\u3080\u3068\u305d\u306e\u7a7a\u6c17\u306b\u5f15\u3063\u5f35\u3089\u308c\u3066\u7126\u308b\u30b2\u30de\u30ba\u5973\u5b50\u4f1a\u30e1\u30f3\u30d0\u30fc\u9054\u3010\u672c\u9593\u3072\u307e\u308f\u308a \/ \u7b39\u6728\u54b2 \/ \u690e\u540d\u552f\u83ef \/ \u9b54\u754c\u30ce\u308a\u308a\u3080 \/ \u8d64\u7fbd\u8449\u5b50\u3011&quot;,&quot;description&quot;:&quot;\u672c\u7de8\uff1a\u3010 #\u3052\u307e\u3058\u3087\u30aa\u30f3\u82b1\u898b\u200b\u200b \u3011\u82b1\u898b\u3067\u3076\u3063\u3061\u3083\u3051\u26a1\u30ae\u30ea\u30c8\u30fc\u30af\u25a1\u3010\u306b\u3058\u3055\u3093\u3058&lt;br&gt;&lt;a href=\&quot;https:\/\/youtu.be\/-s6gfvO9jj8\&quot; target=\&quot;_blank\&quot; rel=\&quot;noopener nofollow\&quot;&gt;https:\/\/youtu.be\/-s6gfvO9jj8&lt;\/a&gt;&lt;br&gt;&lt;br&gt;&lt;br&gt;\u672c\u9593\u3072\u307e\u308f\u308a&lt;br&gt;&lt;a href=\&quot;https:\/\/www.youtube.com\/channel\/UC0g1AE0DOjBYnLhkgoRWN1w\&quot; target=\&quot;_blank\&quot; rel=\&quot;noopener nofollow\&quot;&gt;https:\/\/www.youtube.com\/channel\/UC0g1AE0DOjBYnLhkgoRWN1w&lt;\/a&gt;&lt;br&gt;\u7b39\u6728\u54b2&lt;br&gt;&lt;a href=\&quot;https:\/\/www.youtube.com\/channel\/UCoztvTULBYd3WmStqYeoHcA\&quot; target=\&quot;_blank\&quot; rel=\&quot;noopener nofollow\&quot;&gt;https:\/\/www.youtube.com\/channel\/UCoztvTULBYd3WmStqYeoHcA&lt;\/a&gt;&lt;br&gt;\u690e\u540d\u552f\u83ef&lt;br&gt;&lt;a href=\&quot;https:\/\/www.youtube.com\/channel\/UC_4tXjqecqox5Uc05ncxpxg\&quot; target=\&quot;_blank\&quot; rel=\&quot;noopener nofollow\&quot;&gt;https:\/\/www.youtube.com\/channel\/UC_4tXjqecqox5Uc05ncxpxg&lt;\/a&gt;&lt;br&gt;\u9b54\u754c\u30ce\u308a\u308a\u3080&lt;br&gt;&lt;a href=\&quot;https:\/\/www.youtube.com\/channel\/UC9EjSJ8pvxtvPdxLOElv73w\&quot; target=\&quot;_blank\&quot; rel=\&quot;noopener nofollow\&quot;&gt;https:\/\/www.youtube.com\/channel\/UC9EjSJ8pvxtvPdxLOElv73w&lt;\/a&gt;&lt;br&gt;\u8d64\u7fbd\u8449\u5b50&lt;br&gt;&lt;a href=\&quot;https:\/\/www.youtube.com\/channel\/UCBi8YaVyZpiKWN3_Z0dCTfQ\&quot; target=\&quot;_blank\&quot; rel=\&quot;noopener nofollow\&quot;&gt;https:\/\/www.youtube.com\/channel\/UCBi8YaVyZpiKWN3_Z0dCTfQ&lt;\/a&gt;&lt;br&gt;&lt;br \/&gt;&lt;span style=\&quot;font-size: 14px;\&quot;&gt;&lt;strong&gt;\u9ad8\u753b\u8cea\u52d5\u753b\u3092YouTube\u306b\u3082\u6295\u7a3f\u3057\u3066\u3044\u307e\u3059\uff01&lt;\/strong&gt;&lt;\/span&gt;&lt;br&gt;&lt;a href=\&quot;https:\/\/www.youtube.com\/channel\/UCgnRkYc0AVCPMXkvkBvvO6w\/\&quot; target=\&quot;_blank\&quot; rel=\&quot;noopener nofollow\&quot;&gt;https:\/\/www.youtube.com\/channel\/UCgnRkYc0AVCPMXkvkBvvO6w\/&lt;\/a&gt;&quot;,&quot;count&quot;:{&quot;view&quot;:94223,&quot;comment&quot;:0,&quot;mylist&quot;:581,&quot;like&quot;:655},&quot;duration&quot;:1381,&quot;thumbnail&quot;:{&quot;url&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38564936\/38564936.81411300&quot;,&quot;middleUrl&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38564936\/38564936.81411300.M&quot;,&quot;largeUrl&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/thumbnails\/38564936\/38564936.81411300.L&quot;,&quot;player&quot;:&quot;https:\/\/img.cdn.nimg.jp\/s\/nicovideo\/thumbnails\/38564936\/38564936.81411300.original\/a960x540l?key=08c7e22e887b47a18ac28c1b3b6881b71d95cd13eddf1f6e8607347ec14db532&quot;,&quot;ogp&quot;:&quot;https:\/\/img.cdn.nimg.jp\/s\/nicovideo\/thumbnails\/38564936\/38564936.81411300.original\/r1280x720l?key=75998d1d5aa1346b40f5bd881eb1306c7bf34e3dca69d7c596cf01297ebc567e&quot;},&quot;rating&quot;:{&quot;isAdult&quot;:false},&quot;registeredAt&quot;:&quot;2021-04-11T08:42:02+09:00&quot;,&quot;isPrivate&quot;:false,&quot;isDeleted&quot;:false,&quot;isNoBanner&quot;:false,&quot;isAuthenticationRequired&quot;:false,&quot;isEmbedPlayerAllowed&quot;:true,&quot;viewer&quot;:{&quot;isOwner&quot;:false,&quot;like&quot;:{&quot;isLiked&quot;:false,&quot;count&quot;:null}},&quot;watchableUserTypeForPayment&quot;:&quot;all&quot;,&quot;commentableUserTypeForPayment&quot;:&quot;all&quot;,&quot;9d091f87&quot;:false},&quot;videoAds&quot;:{&quot;additionalParams&quot;:{&quot;videoId&quot;:&quot;sm38564936&quot;,&quot;videoDuration&quot;:1381,&quot;isAdultRatingNG&quot;:false,&quot;isAuthenticationRequired&quot;:false,&quot;isR18&quot;:false,&quot;nicosid&quot;:&quot;1617443004.1776781025&quot;,&quot;lang&quot;:&quot;en-us&quot;,&quot;watchTrackId&quot;:&quot;ffd3HU25wc_1619270133770&quot;,&quot;genre&quot;:&quot;entertainment&quot;,&quot;gender&quot;:&quot;1&quot;,&quot;age&quot;:101},&quot;items&quot;:[{&quot;type&quot;:&quot;preroll&quot;,&quot;timingMs&quot;:null,&quot;additionalParams&quot;:{&quot;linearType&quot;:&quot;preroll&quot;,&quot;adIdx&quot;:0,&quot;skipType&quot;:1,&quot;skippableType&quot;:1,&quot;pod&quot;:1}},{&quot;type&quot;:&quot;postroll&quot;,&quot;timingMs&quot;:null,&quot;additionalParams&quot;:{&quot;linearType&quot;:&quot;postroll&quot;,&quot;adIdx&quot;:0,&quot;skipType&quot;:1,&quot;skippableType&quot;:1,&quot;pod&quot;:2}}],&quot;reason&quot;:&quot;non_premium_user_ads&quot;},&quot;videoLive&quot;:null,&quot;viewer&quot;:{&quot;id&quot;:86130646,&quot;nickname&quot;:&quot;\u7530\u6240\u6d69\u4e8c&quot;,&quot;isPremium&quot;:false,&quot;existence&quot;:{&quot;age&quot;:101,&quot;prefecture&quot;:&quot;\u6771\u4eac\u90fd&quot;,&quot;sex&quot;:&quot;male&quot;}},&quot;waku&quot;:{&quot;information&quot;:null,&quot;bgImages&quot;:[],&quot;addContents&quot;:null,&quot;addVideo&quot;:null,&quot;tagRelatedBanner&quot;:null,&quot;tagRelatedMarquee&quot;:null}}" data-environment="{&quot;baseURL&quot;:{&quot;web&quot;:&quot;https:\/\/www.nicovideo.jp&quot;,&quot;res&quot;:&quot;https:\/\/nicovideo.cdn.nimg.jp\/web&quot;,&quot;dic&quot;:&quot;https:\/\/dic.nicovideo.jp&quot;,&quot;flapi&quot;:&quot;https:\/\/flapi.nicovideo.jp&quot;,&quot;live&quot;:&quot;https:\/\/live.nicovideo.jp&quot;,&quot;live2&quot;:&quot;https:\/\/live2.nicovideo.jp&quot;,&quot;com&quot;:&quot;https:\/\/com.nicovideo.jp&quot;,&quot;ch&quot;:&quot;https:\/\/ch.nicovideo.jp&quot;,&quot;chPublicAPI&quot;:&quot;https:\/\/public-api.ch.nicovideo.jp&quot;,&quot;secureCh&quot;:&quot;https:\/\/secure.ch.nicovideo.jp&quot;,&quot;commons&quot;:&quot;https:\/\/commons.nicovideo.jp&quot;,&quot;commonsAPI&quot;:&quot;https:\/\/api.commons.nicovideo.jp&quot;,&quot;embed&quot;:&quot;https:\/\/embed.nicovideo.jp&quot;,&quot;ext&quot;:&quot;https:\/\/ext.nicovideo.jp&quot;,&quot;nicoMs&quot;:&quot;https:\/\/nico.ms&quot;,&quot;ichiba&quot;:&quot;https:\/\/ichiba.nicovideo.jp&quot;,&quot;ads&quot;:&quot;https:\/\/ads.nicovideo.jp&quot;,&quot;account&quot;:&quot;https:\/\/account.nicovideo.jp&quot;,&quot;secure&quot;:&quot;https:\/\/secure.nicovideo.jp&quot;,&quot;premium&quot;:&quot;https:\/\/premium.nicovideo.jp&quot;,&quot;ex&quot;:&quot;https:\/\/ex.nicovideo.jp&quot;,&quot;qa&quot;:&quot;https:\/\/qa.nicovideo.jp&quot;,&quot;publicAPI&quot;:&quot;https:\/\/public.api.nicovideo.jp&quot;,&quot;commonsPublicAPI&quot;:&quot;https:\/\/public-api.commons.nicovideo.jp\/&quot;,&quot;app&quot;:&quot;http:\/\/app.nicovideo.jp&quot;,&quot;appClientAPI&quot;:&quot;http:\/\/app-cliapi.nicovideo.jp&quot;,&quot;point&quot;:&quot;https:\/\/point.nicovideo.jp&quot;,&quot;enquete&quot;:&quot;http:\/\/enquete.nicovideo.jp&quot;,&quot;notification&quot;:&quot;https:\/\/notification.nicovideo.jp&quot;,&quot;upload&quot;:&quot;https:\/\/www.upload.nicovideo.jp&quot;,&quot;sugoiSearchSystem&quot;:&quot;https:\/\/sug.search.nicovideo.jp&quot;,&quot;nicoad&quot;:&quot;https:\/\/nicoad.nicovideo.jp&quot;,&quot;nicoadAPI&quot;:&quot;https:\/\/api.nicoad.nicovideo.jp&quot;,&quot;secureDCDN&quot;:&quot;https:\/\/secure-dcdn.cdn.nimg.jp&quot;,&quot;seiga&quot;:&quot;https:\/\/seiga.nicovideo.jp&quot;,&quot;nvapi&quot;:&quot;https:\/\/nvapi.nicovideo.jp&quot;},&quot;playlistToken&quot;:&quot;&quot;,&quot;i18n&quot;:{&quot;language&quot;:&quot;en-us&quot;,&quot;locale&quot;:&quot;en_US&quot;,&quot;area&quot;:&quot;JP&quot;,&quot;footer&quot;:{&quot;setcountryURL&quot;:&quot;https:\/\/www.nicovideo.jp\/api\/setcountry&quot;,&quot;availableLanguageList&quot;:[{&quot;language&quot;:&quot;ja-jp&quot;,&quot;label&quot;:&quot;\u65e5\u672c\u8a9e&quot;},{&quot;language&quot;:&quot;en-us&quot;,&quot;label&quot;:&quot;English (US)&quot;},{&quot;language&quot;:&quot;zh-tw&quot;,&quot;label&quot;:&quot;\u4e2d\u6587 (\u7e41\u9ad4)&quot;}],&quot;setcountryToken&quot;:&quot;86130646-1619270133-b5053970ac1a7d368a3c4029b97e90fd66e9a67f&quot;}},&quot;urls&quot;:{&quot;playerHelp&quot;:&quot;https:\/\/qa.nicovideo.jp\/faq\/show\/6116&quot;},&quot;isMonitoringLogUser&quot;:false,&quot;frontendId&quot;:6,&quot;frontendVersion&quot;:&quot;0&quot;,&quot;newPlaylistRate&quot;:1,&quot;newRelatedVideos&quot;:true}" hidden></div>
      <div id="js-failover2flash" class="failover2flash" style="display: none;">
  <div class="failover2flash-header">
    <h1 class="failover2flash-logo">
      <a href="/video_top">Niconico Video</a>
    </h1>
  </div>

    <p class="failover2flash-late">Please wait until page finishes loading.</p>

    <p class="failover2flash-error">An error has occurred. </p>

  <div class="failover2flash-buttonArea">
    <button id="js-failover2flash-reload" class="failover2flash-reload">Reload</button>
  </div>
</div>
      <link href="https://nicovideo.cdn.nimg.jp/web/styles/footer.css?1603771323" rel="stylesheet">
<footer class="FooterContainer" data-footer-is-login="true">
  <a href="javascript:void(0)" class="FooterContainer-pageTop" onclick="window.scrollTo(0, 0)">▲Page Top</a>

  
    <div class="FooterContainer-information">
    <div class="FooterContainer-informationInner">

            <h1 class="FooterContainer-pageLogo">
        <a href="/video_top" class="FooterContainer-pageLogoLink">
          <img src="https://nicovideo.cdn.nimg.jp/web/images/logo/logo_nicovideo_white.svg" alt="Niconico Video">
        </a>
      </h1>

            <div classs="FooterContainer-linksContainer">

                <ul class="FooterContainer-links"  data-footer-watch-links style="display: none;">
          <li class="FooterContainer-link"><a href="https://qa.nicovideo.jp/faq/show/6116?site_domain=default">Usage Tips (Japanese only)</a></li>
          <li class="FooterContainer-link"><a href="https://qa.nicovideo.jp/faq/show/195?site_domain=default">Videos Won't Play (Japanese only)</a></li>
          <li class="FooterContainer-link FooterContainer-requiredLoginLink FooterContainer-attentionLink"><a href="#" data-footer-comment-allegation-base-url="https://secure.nicovideo.jp/secure/comment_allegation/" data-footer-comment-allegation-link>Report Comment / Tag</a></li>
          <li class="FooterContainer-link FooterContainer-requiredLoginLink FooterContainer-attentionLink"><a href="#" data-footer-video-allegation-base-url="https://www.nicovideo.jp/allegation/" data-footer-video-allegation-link>Report Video </a></li>
        </ul>

        <ul class="FooterContainer-links">
          <li class="FooterContainer-link"><a href="https://qa.nicovideo.jp/faq/show/5008?site_domain=default">Opinion/Request (Japanese only)</a></li>
          <li class="FooterContainer-link"><a href="https://secure.nicovideo.jp/form/feedback_bugreport">Report Bug (Japanese only)</a></li>
          <li class="FooterContainer-link"><a href="https://qa.nicovideo.jp/category/show/808?site_domain=default">Help (Japanese only)</a></li>
          <li class="FooterContainer-link"><a href="https://qa.nicovideo.jp/faq/show/1112">System Requirements (Japanese only)</a></li>
          <li class="FooterContainer-link"><a href="https://account.nicovideo.jp/rules/account">Terms of Use</a></li>
          <li class="FooterContainer-link"><a target="_blank" href="http://dwango.co.jp/english/index.html">Operating Company </a></li>
        </ul>
        <ul class="FooterContainer-links">
          <li class="FooterContainer-link FooterContainer-breakLink"><a href="https://ex.nicovideo.jp/smile/guideline/">Video Upload Rules & Regulations</a></li>
          <li class="FooterContainer-link"><a href="https://license-search.nicovideo.jp/">Audio Search (Japanese only)</a></li>
          <li class="FooterContainer-link"><a href="http://info.nicovideo.jp/base/phishing.html">Beware of Phishing (Japanese only)</a></li>        </ul>
        <ul class="FooterContainer-links">
          <li class="FooterContainer-link"><a href="https://site.nicovideo.jp/sales_ads">Advertise (Japanese only)</a></li>
                  </ul>
      </div>

    </div>
  </div>

  <div class="FooterContainer-additionals">
    <div class="FooterContainer-additionalsInner">

      <div class="FooterContainer-metadata">
        <div class="FooterContainer-metadataItem">
          <span class="FooterContainer-metadataLabel">Videos: </span>
          <span class="FooterContainer-metadataValue">18,544,124</span>
          <span class="FooterContainer-metadataLinks">
                      </span>
        </div>
        <div class="FooterContainer-metadataItem">
          <span class="FooterContainer-metadataLabel">Views: </span>
          <span class="FooterContainer-metadataValue">116,910,301,927</span>
        </div>
        <div class="FooterContainer-metadataItem">
          <span class="FooterContainer-metadataLabel">Comments: </span>
          <span class="FooterContainer-metadataValue">5,979,942,900</span>
        </div>
        <address class="FooterContainer-metadataAddress">©DWANGO Co., Ltd.</address>
      </div>


              
        <div class="CountrySelector">
          <div class="CountrySelector-section">
            <span class="CountrySelector-label">Language: </span>
            <div class="CountrySelector-items">
              <span class="CountrySelector-item CountrySelector-currentItem" data-country-selector-trigger data-country-selector-value="en-us">English (US)</span>
              <ul class="CountrySelector-candidates">
                                                      <li class="CountrySelector-item" data-country-selector-type="language" data-country-selector-value="ja-jp">日本語</li>
                                                                                                          <li class="CountrySelector-item" data-country-selector-type="language" data-country-selector-value="zh-tw">中文 (繁體)</li>
                                                </ul>
            </div>
          </div>

          <form method="post" action="https://www.nicovideo.jp/api/setcountry" class="CountrySelector-form">
                          <input type="hidden" name="user_id" value="86130646">
              <input type="hidden" name="token" value="86130646-1619270133-b5053970ac1a7d368a3c4029b97e90fd66e9a67f">
                        <input type="hidden" name="language" value="en-us">
          </form>
        </div>
      
    </div>
  </div>

</footer>
<script charset="utf-8" src="https://nicovideo.cdn.nimg.jp/web/scripts/modules/view/Footer.js?1599530746" async="1" defer="1"></script>


      <script type="text/javascript" src="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/failover2flash/watch_failover2flash.js?025a757e"></script>
      <script type="text/javascript" charset="utf-8" src="https://res.ads.nicovideo.jp/assets/js/ads2.js?ref=video"></script>
      <script charset="utf-8" src="https://nicovideo.cdn.nimg.jp/web/scripts/i18n_messages/watch/en_US.js?1616043501" ></script>              <script type="text/javascript" src="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/legacy/watch_dll_a85f537ad43247eb5c58.js" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://nicovideo.cdn.nimg.jp/web/scripts/pages/watch/legacy/watch_app_e6b3c5b1faec5f9431ba.js" crossorigin="anonymous"></script>
      
      <script type="text/javascript">
  
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-1089346-5']);
  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
  
</script>

          </div>

                
  </body>
</html>
"""#
