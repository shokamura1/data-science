# 2019年4月14日 『Rによるデータサイエンス』 Ⅱ部 13章4篇 樹木モデル　その他のパッケージ

# 『Rによるデータサイエンス』Ⅱ部 13章4篇 樹木モデル　その他のパッケージ
# ●13章4篇の構成
#  13-4  補遺と注釈

# ●13章4編 樹木モデル その他のパッケージのゴール
# ・その他のパッケージの種類と特徴を理解する
# ・その他のパッケージを、Rで実装出来るようになる

# 決定木の最後の章では、rpart、mvpart以外のパッケージの利用例を解説する。

# ●13-4 補遺と注釈
# rpart関数と同種類の樹木モデルパッケージとしてtreeがある。
# 木を生成する関数はtree関数になる。パッケージには、partition.tree関数があり、
# 折れ線回帰図や分割分類図を作成することが出来る。

install.packages('tree'); library(tree)
cars.tr <- tree(dist~speed, data = cars)
plot(cars$speed, cars$dist)
partition.tree(cars.tr, add = T, col = 2)
iris.tr <- tree(Species~., data = iris)
iris.tr1 <- snip.tree(iris.tr, nodes = c(12, 7))
iris.label <- c('S', 'C', 'V')[iris[, 5]]
plot(iris[, 3], iris[, 4], type = 'n')
text(iris[, 3], iris[, 4], labels = iris.label)
partition.tree(iris.tr1, add = T, col = 2, cex = 1.5)

# データマイニングパッケージWekaのRバージョンであるRWekaには、C4.5のアルゴリズムによる
# J48関数がある。以下に実行例を示す。
# RWekaパッケージ実行に当たっては、JAVAのインストールが必要になりそうです。

install.packages('RWeka', dependencies = TRUE); library(RWeka)
iris.j48 <- j48(Species~., data = iris)
iris.j48

install.packages('party', dependencies = TRUE); library(party)
plot(iris.j48)
plot(iris.j48, type = c('extended'))


# パッケージRWekaのplot関数は、パッケージpartyの作図関数を借用している。
# パッケージpartyには2分木の制御と作図に関連する関数がある。2分木を制御する関数はctreeである。
# 回帰木の場合は、棒グラフ、ヒストグラム、箱ひげ図、密度分布曲線、生存曲線などを
# 木のノードあるいはターミナルに加えることが出来る。
# その例を以下に示す。

cars.ctr <- ctree(dist ~., data = cars)
plot(cars.ctr)
t.style <- node_hist(cars.ctr, ymax = 0.06, xscale = c(0, 150), col = 'red', fill = hsv(0.6, 0.5, 1))
plot(cars.ctr, terminal_panel = t.style)


# 以上