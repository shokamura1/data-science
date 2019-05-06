# 2019年5月3日 『Rによるデータサイエンス』 Ⅱ部 17章 アソシエーション分析 抽出結果の補助分析

# 『Rによるデータサイエンス』Ⅱ部 17章7篇　アソシエーション分析 抽出結果の補助分析
# ●17章の構成
# 　17-4 抽出結果の補助分析
# 　 17-4-1 dissmilarity関数
# 　 17-4-2 ルールのクラスター分析
# 　17-5 補遺と注釈

# ●17章7篇 アソシエーション分析 抽出結果の補助分析のゴール
# ・抽出結果の補助分析の概要を知る
# ・dissmilarity関数をRで実装出来るようになる


# ●17-4 抽出結果の補助分析
# ●17-4-1 dissimilarity関数
# 場合によっては、抽出したルール、あるいは頻出アイテムについて、クラスター分析を行い、
# クラスの特徴を考察することも有益である。パッケージarulesには、トランザクション、アイテム、相関ルール、頻出アイテムの距離(非類似度)を求める関数
# dissimilarity関数が用意されている。書式を以下に示す。
# 引数methodでは、バイナリデータの'jaccard', 'matching', 'dice', 'affinity'距離を指定することが出来る。
# デフォルトには'jaccard'が指定されている。

# dissimilarity(x, y = NULL, method = NULL, args = NULL, ...)


# ●17-4-2 ルールのクラスター分析
# 例2の結果を借用し、結果部に高収入(income = $40,000+)になっている相関ルールについて、
# 階層的クラスター分析法を使った例を以下に示す。

rules.sub <- subset(Income.ap, subset = rhs %in% 'income=$40,000+' & lift>2)
d <- dissimilarity(rules.sub)
plot(hclust(d, 'ward.D'), hang = -1)

# 階層的クラスター分析の樹形図から、ルールは大まかに2つか4つのクラスに分けられる。
# 4つのクラスに分けると樹形図の葉を左からカウントするとclass1 = 1:7, class2 = 8:13, class3 = 14:23, class4 = 24:29となる。
# 葉の番号はhclust関数の結果のオブジェクト$orderで呼び出すことが可能である。

class1 <- hclust(d, 'ward.D')$order[1:7]
inspect(rules.sub[class1])

# クラス1は、居住状況(householder status = own)と高収入の関連性に関するルールであることが分かる。

class2 <- hclust(d, 'ward.D')$order[8:13]
inspect(rules.sub[class2])

# クラス2は、学歴(education = college graduate)と高収入との関連性に関するルールであることが分かる。
# 次の結果から分かるように、クラス3, 4は職業(occupation = professional/managerial)と高収入との関連性に関するルールである。

class3 <- hclust(d, 'ward.D')$order[14:23]
inspect(rules.sub[class3])

class4 <- hclust(d, 'ward.D')$order[24:29]
inspect(rules.sub[class4])

# eclat関数の結果について、類似の分析を行うことも可能である。
# 本節では、階層的クラスター分析の例のみを示しているが、距離データを使って、その他のデータ解析方法を使うことも可能である。


# ●17-5 補遺と注釈
# 本章では、パッケージarulesに実装されている2種類のアルゴリズムを使って、
# 相関ルール及び頻出アイテム抽出について解説した。パッケージには、トランザクションデータにおけるサンプリング関数sample、
# モデルの予測関数predict、アイテムのクロス表を求めるcrossTable、2値データを図示する関数image、
# ルールの評価指標被覆率を求める関数coverageなどが用意されているが、触れることが出来なかった。
# 又、パッケージRWekaには2つのタイプの相関ルール関数Apriori、Tretiusがある。


# 以上