# 2019年5月3日 『Rによるデータサイエンス』 Ⅱ部 17章 アソシエーション分析 Eclatアルゴリズム

# 『Rによるデータサイエンス』Ⅱ部 17章5篇　アソシエーション分析 Eclatアルゴリズム 例5
# ●17章の構成
# 　　17-3-2 Eclat関数とケーススタディー
# 　　 (3)例5

# ●17章5篇 アソシエーション分析 Eclatアルゴリズム 例5のゴール
# ・Incomeデータセットを対象にeclat関数を使い、Rで実装出来るようになる

# (3)例5
# 次にデータIncomeを使った例を示す。

Income.ec <-eclat(Income)

# apriori関数の場合と同じく、制約条件を付けて、頻出アイテムセットを呼び出すことが出来る。
# ただし、eclatが返す結果には、条件部、結果部のようなものがなく、アイテムセット(items)と支持度(support)のみである。
# アイテムセットの中にincome = $40,000を含み、支持度が0.2以上のものを抽出する実行例を以下に示す。

Income.ec2 <- subset(Income.ec, subset = items %in% 'income=$40,000+' & support>0.2 & size(items)>2)
Income.ec2
inspect(sort(Income.ec2, by = 'support')[1:2])


# 以上