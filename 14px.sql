-- MySQL dump 10.14  Distrib 5.5.33-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: 14px
-- ------------------------------------------------------
-- Server version	5.5.33-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Article`
--

DROP TABLE IF EXISTS `Article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `brief` text NOT NULL,
  `cover` text NOT NULL,
  `click` int(11) NOT NULL DEFAULT '0',
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Article`
--

LOCK TABLES `Article` WRITE;
/*!40000 ALTER TABLE `Article` DISABLE KEYS */;
INSERT INTO `Article` VALUES (11,'灰色的果实 OP ED 「楽園の翼」「あなたの愛した世界」','<center>![](/static/image/cover3.jpg)</center>\r\n\r\n今天还是听听歌把，灰色的果实「グリザイアの果実」OP和ED全部都出了，现在整理一下，放出下载，这动画剧情很不错，后面还有超展开。唱OP的黒崎真音我不是很熟，ED是南條愛乃，观众老爷应该都很熟悉。这次的曲风有点和以前的不一样。\r\n\r\n<center>![](/static/image/pic2.jpg)</center>\r\n\r\nTVアニメ「グリザイアの果実」OPテーマ「楽園の翼」／黒崎真音\r\n\r\n発売日 : 2014/10/15\r\n\r\n商品番号 : GNCA-350\r\n\r\nJANコード : 4988102239466\r\n\r\n[内容紹介]\r\n\r\n2014年10月よりTVアニメ放映開始の「グリザイアの果実」オープニングテーマ\r\n\r\n**収録曲**\r\n\r\n* 楽園の翼 (TVアニメ「グリザイアの果実」OPテーマ)\r\n    \r\n    作詞 : 桑島由一 / 作・編曲 : 藤間仁 (Elements Garden)\r\n\r\n* Scanning resolution\r\n    \r\n    作詞･作曲 : 渡辺翔 / 編曲 : 中山真斗\r\n\r\n* 楽園の翼 (Instrumental)\r\n    \r\n    Scanning resolution (Instrumental)','今天还是听听歌把，灰色的果实「グリザイアの果実」OP和ED全部都出了，现在整理一下，放出下载，这动画剧情很不错，后面还有超展开。唱OP的黒崎真音我不是很熟，ED是南條愛乃，观众老爷应该都很熟悉。这次的曲风有点和以前的不一样。TVアニメ「グリザイアの果実」OPテーマ「楽園の翼」／黒...','/static/image/cover3.jpg',4,'2014-11-23 21:36:19'),(12,'[凛として時雨]东京食尸鬼/东京喰种 OP「unravel」[MP3/FLAC无损]','<center>![](/static/image/cover4.jpg)</center>\r\n\r\n东京食尸鬼算在7月新番里面，个人感觉还算很不错，我个人感觉监督不行，一个剧情不错的漫画，可以拍成这样，背离了原作的精神了，而且，分解镜头都用黑光挡住，真没意思，不敢猎奇，又要撤大旗非来拍一下秀存在感，上个月的极黑就无语，这个月居然也是这样。嘛，这次让我们来听听这首略非主流的OP吧。循环几遍挺带感的。\r\n\r\n<center>![](/static/image/pic1.jpg)</center>\r\n\r\n\r\nTVアニメ「東京喰種トーキョーグール」OPテーマ「unravel」／TK from 凛として時雨\r\n\r\n発売日 : 2014/07/23\r\n\r\n商品番号 : AICL-2707\r\n\r\nJANコード : 4547403033700\r\n\r\n[内容紹介]\r\n\r\nこれまで以上に多彩なポップセンスが散りばめられた1st EP「contrast」を2014年3月リリース、凛として時雨との対比を鮮やかに投影してみせたTK from 凛として時雨。ソロ名義初のシングルパッケージとなる今作は、週刊ヤングジャンプ連載中の話題のダークファンタジー巨編、『東京喰種トーキョーグール』TVアニメオープニングテーマとして書き下ろされた注目の新曲となる。他 全3曲収録予定。 【期間生産限定盤】 『東京喰種トーキョーグール』描き下ろしスペシャルデジパック仕様 ※2014年9月末までの期間生産限定となります\r\n\r\n至今为止各种各样的流行元素散落的第一张EP标题曲的「contrast」在2014年3月，与轻松的凛冽时雨产生鲜明对比和映射的TK from凛冽时雨。现在这首以个人名义的最初单曲作为，在周刊少年JUMP中热门连载的黑暗幻想主题巨著『東京喰種』动画版的OP主题曲，成为了引人注目的新区。也预定将收入「contrast」另外全部3首曲目，制成【期間生産限定盤】『東京喰種』新特别版。※将在2014年9月末期间限定生产。\r\n\r\n	「東京喰種トーキョーグール」OP「unravel」／TK from 凛として時雨 (MP3+BK)\r\n	magnet:?xt=urn:btih:5aba3f144da4b32eb7eb256351986ba80e1ce56b\r\n	\r\n	「東京喰種トーキョーグール」OP「unravel」／TK from 凛として時雨 (FLAC+BK)\r\n	magnet:?xt=urn:btih:a261689e5afc4f5c091a71165b06986bce123fbf','东京食尸鬼算在7月新番里面，个人感觉还算很不错，我个人感觉监督不行，一个剧情不错的漫画，可以拍成这样，背离了原作的精神了，而且，分解镜头都用黑光挡住，真没意思，不敢猎奇，又要撤大旗非来拍一下秀存在感，上个月的极黑就无语，这个月居然也是这样。嘛，这次让我们来听听这首略非主流的OP吧...','/static/image/cover4.jpg',3,'2014-11-23 21:50:51'),(13,'记录的地平线 第2季 (Log Horizon 2) ED「Wonderful Wonder World＊」／Yun*chi','<center>![](/static/image/cover5.jpg)</center>\r\n\r\n各位观众都期待已久的《记录的地平线》第2季ED曲，还是来自Yun*chi的单曲。这个动画，我个人感觉比刀剑神域稍微有趣点，至少这货是真的在玩游戏。不像中二病桐人整天现充，秀恩爱死得快。\r\n\r\n<center>![](/static/image/pic3.jpg)</center>\r\n\r\nTVアニメ「ログ・ホライズン 第2シリーズ」EDテーマ「Wonderful Wonder World＊」／Yun＊chi\r\n\r\n発売日 : 2014/10/22\r\n\r\n商品番号 : CRCP-10328\r\n\r\nJANコード : 4988007261159\r\n\r\n[内容紹介]\r\n\r\nYun*chiのニューシングル!! 全3曲収録。TVアニメ「ログ・ホライズン」第2シリーズのエンディングテーマに抜擢!\r\n\r\n収録曲\r\n\r\n1. Wonderful Wonder World*\r\n2. Fairy*\r\n3. Dancing*\r\n4. Wonderful Wonder World* (Instrumental)\r\n5. Fairy* (Instrumental)\r\n6. Dancing* (Instrumental)\r\n\r\n***\r\n\r\n	TVアニメ「ログ・ホライズン 第2シリーズ(Log Horizon 2)」EDテーマ\r\n\r\n	「Wonderful Wonder World＊」／Yun＊chi (320K)\r\n	magnet:?xt=urn:btih:cac08c03b0b76fc0315edbe7da19d583ca923b23\r\n\r\n	「Wonderful Wonder World＊」 PV\r\n	magnet:?xt=urn:btih:4c7070cf083dcfcb1cb628fa5b4e315d2cd5cea9','各位观众都期待已久的《记录的地平线》第2季ED曲，还是来自Yun*chi的单曲。这个动画，我个人感觉比刀剑神域稍微有趣点，至少这货是真的在玩游戏。不像中二病桐人整天现充，秀恩爱死得快。TVアニメ「ログ・ホライズン 第2シリーズ」EDテーマ「Wonderful Wonder Wor...','/static/image/cover5.jpg',3,'2014-11-23 22:41:34'),(16,'「四月は君の嘘」四月是你的谎言 OP「光るなら」／Goose house [MP3/FLAC]','<center>![](/static/image/cover6.jpg)</center>\r\n\r\n这个算是一个音乐动画了，不过剧情也相当的不错，非常值得推荐大家去看一下，其实我一直以为男主的名字是公主，后来仔细一看原来是叫公生，我在看到第4集才察觉到。原定于11月19日发售的CD居然在15号就偷跑了，现在才知道还真是失败。作为一个音乐动画，里面的音乐还是相当的不错的。看来OST发售应该可以卖的很好\r\n\r\n<center>![](/static/image/pic4.jpg)</center>\r\n\r\nTVアニメ「四月は君の嘘」OPテーマ「光るなら」／Goose house\r\n\r\n発売日 : 2014/11/19\r\n\r\n商品番号 : SRCL-8641\r\n\r\nJANコード : 4988009097350\r\n\r\n**[内容紹介]**\r\n\r\n10月よりスタートするフジテレビ”ノイタミナ”アニメ『四月は君の嘘』のオープニングテーマをGoose houseが書き下ろし! メンバーが原作を読んで書き下ろした今作は、いままでのGoose houseのオリジナルになかった新境地。\r\n\r\n収録曲\r\n01. 光るなら\r\n02. 冬のエピローグ\r\n03. 光るなら -TV Size-\r\n04. 光るなら -Instrumental-\r\n\r\n***\r\n\r\n	TVアニメ「四月は君の嘘」OPテーマ「光るなら」／Goose house (320K+BK)\r\n	magnet:?xt=urn:btih:d7bff1972d9293bf9d9d6ff3199a514a62e93aab\r\n\r\n	TVアニメ「四月は君の嘘」OPテーマ「光るなら」／Goose house (FLAC+BK)\r\n	magnet:?xt=urn:btih:d8fbeae3bfba5e8d2edc30d3a04c019851040a27','这个算是一个音乐动画了，不过剧情也相当的不错，非常值得推荐大家去看一下，其实我一直以为男主的名字是公主，后来仔细一看原来是叫公生，我在看到第4集才察觉到。原定于11月19日发售的CD居然在15号就偷跑了，现在才知道还真是失败。作为一个音乐动画，里面的音乐还是相当的不错的。看来OS...','/static/image/cover6.jpg',74,'2014-11-23 23:09:45'),(17,'斩!赤红之瞳 OP ED 「Skyreach」「こんな世界、知りたくなかった。」(雨宮天/沢井美空)','<center>![](/static/image/cover7.jpg)</center>\r\n\r\n斩!赤红之瞳其实挺带感的，每周都有超展开的，不过便当发的也挺勤快的。虽然OP和ED很早就出了，个人感觉这ED和[进击的巨人ED](http://www.hacg.me/wordpress/34612)好像啊。今天刚好看见有人在求，我就整理一下了，有爱自取啦，如果有什么需要的音乐也可以告诉我。我也会注意收集的。\r\n\r\n<center>![](/static/image/pic5.jpg)</center>\r\n	\r\nTVアニメ「アカメが斬る！」EDテーマ「こんな世界、知りたくなかった。」／沢井美空\r\n\r\n発売日 : 2014/08/13\r\n\r\n商品番号 : SRCL-8577\r\n\r\nJANコード : 4988009094441\r\n\r\n**[内容紹介]**\r\n\r\n沢井美空のニューシングルは、TVアニメ『アカメが斬る!』のEDテーマに抜擢。世界観を完璧に書き下ろした”壮大なロックバラード”完成! DVDには、Music Videoとアニメノンクレジット映像を収録予定。アニメ絵柄描きおろしジャケット、デジパック仕様。 ※2014年10月末日までの期間生産限定盤\r\n\r\n\r\n**収録曲**\r\n\r\n1. こんな世界、知りたくなかった。\r\n2. Blue\r\n3. Fly!!\r\n4. こんな世界、知りたくなかった。 (Anime Ver.)\r\n5. こんな世界、知りたくなかった。 (Instrumental)\r\n\r\n***\r\n\r\n	【ED】「こんな世界、知りたくなかった。」／沢井美空 (320K)\r\n	magnet:?xt=urn:btih:e57bff2895fe8f65e396f88388ec742bb489363a\r\n\r\n	【ED】「こんな世界、知りたくなかった。」／沢井美空 (FLAC+BK)\r\n	magnet:?xt=urn:btih:5498ed55f95294019ac4c4678a4e9c2ab4c26f41','斩!赤红之瞳其实挺带感的，每周都有超展开的，不过便当发的也挺勤快的。虽然OP和ED很早就出了，个人感觉这ED和进击的巨人ED好像啊。今天刚好看见有人在求，我就整理一下了，有爱自取啦，如果有什么需要的音乐也可以告诉我。我也会注意收集的。TVアニメ「アカメが斬る！」EDテーマ「こんな...','/static/image/cover7.jpg',379,'2014-11-24 15:20:11'),(18,'Fate/stay night UBW 动画OP『ideal white』+ ED『believe』','<center>![](/static/image/cover8.jpg)</center>\r\n\r\nFSN重制了，吾辈要激动地哭了，想不到能在有生之年看到重制版，接下来就看月姬能不能重制；这个是网上别人自拍自扫的，mp3和flac是我自己分出来的，应该还是不错的。\r\n\r\n还有，我真心做不出bt种子，所以磁力也没办法做出来，抱歉了。\r\n\r\nTVアニメ「Fate／stay night [Unlimited Blade Works]」OPテーマ「ideal white」／綾野ましろ\r\n\r\n**登録情報**\r\n\r\nCD (2014/10/22)\r\n\r\nディスク枚数: 1\r\n\r\nフォーマット： Single, CD+DVD, Limited Edition\r\n\r\nレーベル: アリオラジャパン\r\n\r\n収録時間: 16 分\r\n\r\nASIN: B00NC7G0NE\r\n\r\nEAN： 4988017690451\r\n\r\n**商品の説明**\r\n\r\nメディア掲載レビューほか\r\n\r\n北海道洞爺湖町出身の女性シンガー、綾野ましろのデビュー・シングル。2014年10月よりTOKYO MX他にて放送のTVアニメ『Fate/stay night』のオープニング・テーマ「ideal white」他を収録。 (C)RS\r\n\r\n**Disc 1**\r\n\r\n1. ideal white\r\n2. pledge of stars\r\n3. 燐光\r\n4. ideal white (TV size)\r\n\r\n**Disc 2**\r\n\r\n1. TVアニメ「Fate/stay night」ノンクレジットオープニング映像\r\n\r\n***\r\n\r\n    「Fate／stay night [UBW]」OPテーマ「ideal white」／綾野ましろ【MP3】\r\n    magnet:?xt=urn:btih:2db1680e1cde23f58054b4bd86d3f80c320f6c10\r\n    \r\n    「Fate／stay night [UBW]」OPテーマ「ideal white」／綾野ましろ【FLAC】\r\n    magnet:?xt=urn:btih:1dde091fc1970597f749f22b810b8bee2e4dff0d','FSN重制了，吾辈要激动地哭了，想不到能在有生之年看到重制版，接下来就看月姬能不能重制；这个是网上别人自拍自扫的，mp3和flac是我自己分出来的，应该还是不错的。还有，我真心做不出bt种子，所以磁力也没办法做出来，抱歉了。TVアニメ「Fate／stay night [Unlim...','/static/image/cover8.jpg',20,'2014-11-26 22:18:42'),(19,'Fate/stay night UBW 动画OP『ideal white』+ ED『believe』','<center>![](/static/image/cover8.jpg)</center>\r\n\r\nFSN重制了，吾辈要激动地哭了，想不到能在有生之年看到重制版，接下来就看月姬能不能重制；这个是网上别人自拍自扫的，mp3和flac是我自己分出来的，应该还是不错的。\r\n\r\n还有，我真心做不出bt种子，所以磁力也没办法做出来，抱歉了。\r\n\r\nTVアニメ「Fate／stay night [Unlimited Blade Works]」OPテーマ「ideal white」／綾野ましろ\r\n\r\n**登録情報**\r\n\r\nCD (2014/10/22)\r\n\r\nディスク枚数: 1\r\n\r\nフォーマット： Single, CD+DVD, Limited Edition\r\n\r\nレーベル: アリオラジャパン\r\n\r\n収録時間: 16 分\r\n\r\nASIN: B00NC7G0NE\r\n\r\nEAN： 4988017690451\r\n\r\n**商品の説明**\r\n\r\nメディア掲載レビューほか\r\n\r\n北海道洞爺湖町出身の女性シンガー、綾野ましろのデビュー・シングル。2014年10月よりTOKYO MX他にて放送のTVアニメ『Fate/stay night』のオープニング・テーマ「ideal white」他を収録。 (C)RS\r\n\r\n**Disc 1**\r\n\r\n1. ideal white\r\n2. pledge of stars\r\n3. 燐光\r\n4. ideal white (TV size)\r\n\r\n**Disc 2**\r\n\r\n1. TVアニメ「Fate/stay night」ノンクレジットオープニング映像\r\n\r\n***\r\n\r\n    「Fate／stay night [UBW]」OPテーマ「ideal white」／綾野ましろ【MP3】\r\n    magnet:?xt=urn:btih:2db1680e1cde23f58054b4bd86d3f80c320f6c10\r\n    \r\n    「Fate／stay night [UBW]」OPテーマ「ideal white」／綾野ましろ【FLAC】\r\n    magnet:?xt=urn:btih:1dde091fc1970597f749f22b810b8bee2e4dff0d','FSN重制了，吾辈要激动地哭了，想不到能在有生之年看到重制版，接下来就看月姬能不能重制；这个是网上别人自拍自扫的，mp3和flac是我自己分出来的，应该还是不错的。还有，我真心做不出bt种子，所以磁力也没办法做出来，抱歉了。TVアニメ「Fate／stay night [Unlim...','/static/image/cover8.jpg',0,'2014-11-26 22:23:19'),(20,'Fate/stay night UBW 动画OP『ideal white』+ ED『believe』','<center>![](/static/image/cover8.jpg)</center>\r\n\r\nFSN重制了，吾辈要激动地哭了，想不到能在有生之年看到重制版，接下来就看月姬能不能重制；这个是网上别人自拍自扫的，mp3和flac是我自己分出来的，应该还是不错的。\r\n\r\n还有，我真心做不出bt种子，所以磁力也没办法做出来，抱歉了。\r\n\r\nTVアニメ「Fate／stay night [Unlimited Blade Works]」OPテーマ「ideal white」／綾野ましろ\r\n\r\n**登録情報**\r\n\r\nCD (2014/10/22)\r\n\r\nディスク枚数: 1\r\n\r\nフォーマット： Single, CD+DVD, Limited Edition\r\n\r\nレーベル: アリオラジャパン\r\n\r\n収録時間: 16 分\r\n\r\nASIN: B00NC7G0NE\r\n\r\nEAN： 4988017690451\r\n\r\n**商品の説明**\r\n\r\nメディア掲載レビューほか\r\n\r\n北海道洞爺湖町出身の女性シンガー、綾野ましろのデビュー・シングル。2014年10月よりTOKYO MX他にて放送のTVアニメ『Fate/stay night』のオープニング・テーマ「ideal white」他を収録。 (C)RS\r\n\r\n**Disc 1**\r\n\r\n1. ideal white\r\n2. pledge of stars\r\n3. 燐光\r\n4. ideal white (TV size)\r\n\r\n**Disc 2**\r\n\r\n1. TVアニメ「Fate/stay night」ノンクレジットオープニング映像\r\n\r\n***\r\n\r\n    「Fate／stay night [UBW]」OPテーマ「ideal white」／綾野ましろ【MP3】\r\n    magnet:?xt=urn:btih:2db1680e1cde23f58054b4bd86d3f80c320f6c10\r\n    \r\n    「Fate／stay night [UBW]」OPテーマ「ideal white」／綾野ましろ【FLAC】\r\n    magnet:?xt=urn:btih:1dde091fc1970597f749f22b810b8bee2e4dff0d','FSN重制了，吾辈要激动地哭了，想不到能在有生之年看到重制版，接下来就看月姬能不能重制；这个是网上别人自拍自扫的，mp3和flac是我自己分出来的，应该还是不错的。还有，我真心做不出bt种子，所以磁力也没办法做出来，抱歉了。TVアニメ「Fate／stay night [Unlim...','/static/image/cover8.jpg',19,'2014-11-26 22:23:31'),(21,'灰色的果实 OP ED 「楽園の翼」「あなたの愛した世界」','<center>![](/static/image/cover3.jpg)</center>\r\n\r\n今天还是听听歌把，灰色的果实「グリザイアの果実」OP和ED全部都出了，现在整理一下，放出下载，这动画剧情很不错，后面还有超展开。唱OP的黒崎真音我不是很熟，ED是南條愛乃，观众老爷应该都很熟悉。这次的曲风有点和以前的不一样。\r\n\r\n<center>![](/static/image/pic2.jpg)</center>\r\n\r\nTVアニメ「グリザイアの果実」OPテーマ「楽園の翼」／黒崎真音\r\n\r\n発売日 : 2014/10/15\r\n\r\n商品番号 : GNCA-350\r\n\r\nJANコード : 4988102239466\r\n\r\n[内容紹介]\r\n\r\n2014年10月よりTVアニメ放映開始の「グリザイアの果実」オープニングテーマ\r\n\r\n**収録曲**\r\n\r\n* 楽園の翼 (TVアニメ「グリザイアの果実」OPテーマ)\r\n    \r\n    作詞 : 桑島由一 / 作・編曲 : 藤間仁 (Elements Garden)\r\n\r\n* Scanning resolution\r\n    \r\n    作詞･作曲 : 渡辺翔 / 編曲 : 中山真斗\r\n\r\n* 楽園の翼 (Instrumental)\r\n    \r\n    Scanning resolution (Instrumental)','今天还是听听歌把，灰色的果实「グリザイアの果実」OP和ED全部都出了，现在整理一下，放出下载，这动画剧情很不错，后面还有超展开。唱OP的黒崎真音我不是很熟，ED是南條愛乃，观众老爷应该都很熟悉。这次的曲风有点和以前的不一样。TVアニメ「グリザイアの果実」OPテーマ「楽園の翼」／黒...','/static/image/cover3.jpg',65,'2014-11-27 19:02:43');
/*!40000 ALTER TABLE `Article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Article_Tag`
--

DROP TABLE IF EXISTS `Article_Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Article_Tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_id` (`tag_id`),
  KEY `fk_article_id` (`article_id`),
  CONSTRAINT `Article_Tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `Tag` (`id`),
  CONSTRAINT `fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `Article` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Article_Tag`
--

LOCK TABLES `Article_Tag` WRITE;
/*!40000 ALTER TABLE `Article_Tag` DISABLE KEYS */;
INSERT INTO `Article_Tag` VALUES (1,11,1),(2,11,2),(3,12,3),(4,12,4),(5,12,5),(6,13,6),(13,16,13),(14,16,14),(15,16,15),(16,17,16),(17,17,17),(18,18,18),(19,18,19),(20,19,20),(21,19,21),(22,20,22),(23,20,23),(24,21,24),(25,21,25),(26,21,26);
/*!40000 ALTER TABLE `Article_Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `guest_id` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `time` datetime NOT NULL,
  `ref` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Comment_article_id` (`article_id`),
  KEY `fk_Comment_guest_id` (`guest_id`),
  CONSTRAINT `fk_Comment_article_id` FOREIGN KEY (`article_id`) REFERENCES `Article` (`id`)  ON DELETE CASCADE,
  CONSTRAINT `fk_Comment_guest_id` FOREIGN KEY (`guest_id`) REFERENCES `Guest` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
INSERT INTO `Comment` VALUES (14,16,15,'真14px!','2014-11-26 17:56:53',NULL),(15,16,16,'15px来了~','2014-11-26 17:57:56',NULL),(17,17,18,'pycharm出乎意料的好用 回归IDE了。。。','2014-11-26 19:08:18',NULL),(19,17,20,'非常同意你的观点','2014-11-26 20:35:46',18),(21,21,25,'灰色的果实','2014-11-27 19:04:53',NULL),(22,21,26,'这个好看!','2014-11-27 20:02:19',25),(23,21,27,'我喜欢PyCharm!','2014-11-27 20:02:46',NULL),(24,21,28,'我喜欢Python','2014-11-27 20:04:19',NULL),(25,17,29,'测试','2014-11-27 20:05:37',NULL),(27,17,31,'回复','2014-11-27 20:07:18',30);
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Guest`
--

DROP TABLE IF EXISTS `Guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Guest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guestname` varchar(20) NOT NULL,
  `email` text NOT NULL,
  `homepage` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Guest`
--

LOCK TABLES `Guest` WRITE;
/*!40000 ALTER TABLE `Guest` DISABLE KEYS */;
INSERT INTO `Guest` VALUES (1,'wishout','602478243@qq.com','14px.sinaapp.com'),(2,'wishout','602478243@qq.com','14px.sinaapp.com'),(3,'wishout','602478243@qq.com','14px.sinaapp.com'),(4,'jing','602478243@qq.com','14px.sinaapp.com'),(5,'jing','602478243@qq.com','14px.sinaapp.com'),(6,'haha','602478243@qq.com','14px.sinaapp.com'),(7,'hehe','hehe@qq.com',NULL),(8,'14px','602478243@qq.com','14px.sinaapp.com'),(9,'wishout','602478243@qq.com','14px.sinaapp.com'),(10,'周敬忠','602478243@qq.com','14px.sinaapp.com'),(11,'14px','602478243@qq.com','14px.sinaapp.com'),(12,'周敬忠','602478243@qq.com','14px.sinaapp.com'),(13,'14px','602478243@qq.com','14px.sinaapp.com'),(14,'14px','602478243@qq.com','14px.sinaapp.com'),(15,'14px','602478243@qq.com','14px.sinaapp.com'),(16,'15px','602478243@qq.com',NULL),(17,'14px','602478243@qq.com','14px.sinaapp.com'),(18,'jing','602478243@qq.com','14px.sinaapp.com'),(19,'jing','602478243@qq.com','14px.sinaapp.com'),(20,'14px','602478243@qq.com','14px.sinaapp.com'),(21,'markdown测试','602478243@qq.com',NULL),(22,'14px','602478243@qq.com',NULL),(24,'14px','602478243@qq.com','14px.sinaapp.com'),(25,'14px','602478243@qq.com',NULL),(26,'14px','602478243@qq.com','14px.sinaapp.com'),(27,'14px','602478243@qq.com',''),(28,'14px','602478243@qq.com',''),(29,'wishout','602478243@qq.com','pythonerjing@sinaapp.com'),(30,'wishout','602478243@qq.com','pythonerjing@sinaapp.com'),(31,'wishout','602478243@qq.com','pythonerjing@sinaapp.com');
/*!40000 ALTER TABLE `Guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(50) NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
INSERT INTO `Tag` VALUES (1,'ED','2014-11-23 21:36:19'),(2,'OP','2014-11-23 21:36:19'),(3,'ACG','2014-11-23 21:50:51'),(4,'ED','2014-11-23 21:50:51'),(5,'OP','2014-11-23 21:50:51'),(6,'记录的地平线','2014-11-23 22:41:34'),(7,'四月是你的谎言','2014-11-23 22:55:21'),(8,'青春励志','2014-11-23 22:55:21'),(9,'音乐动画','2014-11-23 22:55:21'),(10,'四月是你的谎言','2014-11-23 23:07:51'),(11,'青春励志','2014-11-23 23:07:51'),(12,'音乐动画','2014-11-23 23:07:51'),(13,'四月是你的谎言','2014-11-23 23:09:45'),(14,'青春励志','2014-11-23 23:09:45'),(15,'音乐动画','2014-11-23 23:09:45'),(16,'ACG','2014-11-24 15:20:11'),(17,'斩!赤红之瞳','2014-11-24 15:20:11'),(18,'FSN','2014-11-26 22:18:42'),(19,'音乐','2014-11-26 22:18:42'),(20,'FSN','2014-11-26 22:23:19'),(21,'音乐','2014-11-26 22:23:19'),(22,'FSN','2014-11-26 22:23:31'),(23,'音乐','2014-11-26 22:23:31'),(24,'ED','2014-11-27 19:02:43'),(25,'OP','2014-11-27 19:02:43'),(26,'灰色的果实','2014-11-27 19:02:43');
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-27 20:24:09
