# 2019年4月30日 『Rによるデータサイエンス』 Ⅱ部 17章 アソシエーション分析 例2

# 『Rによるデータサイエンス』Ⅱ部 17章3篇　アソシエーション分析 例2
# ●17章の構成
#   17-2-4 関数とケーススタディー
#    (4)例2

# ●17章3篇 アソシエーション分析 例2のゴール
# ・パッケージaruleのIncomeデータを理解する
# ・同データを対象にapriori関数をRで実装出来るようになる


# (4) 例2
# パッケージaruleにはいくつかのリアルのデータセットが用意されている。
# その中の一つのデータセットIncomeである。データセットIncomeは、サンフランシスコベイエリアの
# あるショッピングモールの顧客9,409人が回答したアンケート結果のデータ(IncomeESL)の中から、欠損値を含んでいるものを取り除き、
# データを整理したものである。

# データは以下に示す表の14項目に対する回答結果である。
# 変数の数は合計84である。データIncomeの中の順序尺度の項目数は併合されているので、
# 表とは異なる。
# 例えば、表の「収入」の項目の変数値の数は9になっているが、データIncomeでは2つの値($0 - $40,000, $40,000+)に併合されている。
# データIncomeの中の変数の数は合計50である。

# ・アンケート票の項目
# 項目番号          項目                    変数の数          データのタイプ
# 1                 収入(income)            9                 順序尺度
# 2                 性別(sex)               2                 名義尺度
# 3                 結婚暦(marital status)  2                 名義尺度
# 4                 年齢(age)               7                 順序尺度
# 5                 学歴(education)         6                 順序尺度
# 6                 職業(occupation)        9                 名義尺度
# 7                 ベイエリアでの居住暦(years in Bay Area) 5 順序尺度
# 8                 2重収入(dual income)    3                 名義尺度
# 9                 家族の数(number in household) 3           順序尺度
# 10                子供の数(number of children)  10          順序尺度
# 11                住居状況(householder status)  3           名義尺度
# 12                家の形態(type of home)  5                 名義尺度
# 13                人種の分類(ethnic classification)  8      名義尺度
# 14                自宅での使用言語(language in home)  3     名義尺度

# データの外観を把握するため、変数ごとの相対頻度の棒グラフをitemFrequencyPlot関数で作成する。

data(Income)
Income

par(mar = c(4.5, 2, 1, 2), cex = 0.65, cex.axis = 0.7)
itemFrequencyPlot(Income, cex = 0.8, col = 'lightblue')

# apriori関数のデフォルト値でルール抽出を行うと、抽出されるルールの数は6,346に上る。
# summary関数はルールの総数、アイテムの数ごとのルール数、評価指標の基本統計量を返す。

Income.ap <- apriori(Income)
summary(Income.ap)

# 抽出したルールを呼び出す方法は色々ある。
# 支持度、確信度、リフトの値をソートして呼び出す方法、条件部、結論部に何らかの制約を付け加える方法などがある。
# 例として、結論部が高収入(income = $40,000+)であり、かるリフトが2以上であるルールを呼び出す例を以下に示す。
# sort関数は、ルールをソートする。

Income.ap2 <- subset(Income.ap, subset = rhs %in% 'income=$40,000+' & lift>2)
inspect(sort(Income.ap2)[1:3])

# 条件部に学歴(education)に関するアイテムを含み、結論部に収入(income)に関するアイテムを含むルールを呼び出す例を以下に示す。
# 実行中の中のlhs %pin% 'education'は条件部にeducationを含むことを意味する。

Income.ap3 <- subset(Income.ap, subset = lhs %pin% 'education' & rhs %pin% 'income')
inspect(sort(Income.ap3, by = 'lift')[1:2])


# 以上