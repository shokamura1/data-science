# 2019年4月30日 『Rによるデータサイエンス』 Ⅱ部 17章 アソシエーション分析 例3

# 『Rによるデータサイエンス』Ⅱ部 17章4篇　アソシエーション分析 例3
# ●17章の構成
#   17-2-4 関数とケーススタディー
#    (5)例3

# ●17章4篇 アソシエーション分析 例3のゴール
# ・パッケージaruleのGroceriesデータを理解する
# ・同データを対象にapriori関数をRで実装出来るようになる


# (5) 例3
# パッケージarulesの中には、トランザクションデータセットGroceriesがある。
# Groceriesは典型的な路＝駆るの食糧雑貨店のPOSデータである。
# 169カテゴリに分類された9835のトランザクションにより構成されている。データの概観を把握するため、
# itemFrequencyPlot関数を使うのは有効である。
# ただし、カテゴリ数が多い時には、次のようにいくつかの画面に分けて図示した方が観察しやすい。

data(Groceries)
par(mfrow = c(1,3), mar = c(4.5, 2, 1, 2), cex = 0.65, cex.axis = 0.7)
itemFrequencyPlot(Groceries[,1:55], cex = 0.65, col = 'lightblue', horiz = T)
itemFrequencyPlot(Groceries[,56:110], cex = 0.65, col = 'lightblue', horiz = T)
itemFrequencyPlot(Groceries[,111:169], cex = 0.65, col = 'lightblue', horiz = T)

# デフォルト値のままapriori関数を実行すると1つのルールも抽出されない。
# これは、デフォルトのパラメーター数が、support = 0.8, confidence = 1と高いのが原因である。
# トランザクションの中のアイテム数が多く、分散が大きい時には、高いsupport値を持つルールが得がたい。
# そこで、次のようにパラメーターの値を下げて、apriori関数を実行すると相関ルールが抽出される。

Gr.ap <- apriori(Groceries, parameter = list(support = 0.005, confidence = 0.01))

# 結果部のbeefに注目したルールを呼び出す実行例を以下に示す。

beefRules <- subset(Gr.ap, subset = rhs %in% 'beef')
inspect(head(sort(beefRules, by = 'confidence'), n = 3))


# 以上