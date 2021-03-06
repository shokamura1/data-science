# 2019年2月2日 『Rによるデータサイエンス』 4章

# 『Rによるデータサイエンス』 4章
# 4章の構成
# 4-1 棒グラフ
# 4-2 円グラフ
# 4-3 ヒストグラム
# 4-4 折れ線グラフ
# 4-5 箱ひげ図
# 4-6 散布図
#  4-6-1 2次元散布図
#  4-6-2 対散布図(散布図行列)
#  4-6-3 3次元グラフ
# 4-8 作図環境とグラフの利用
#  4-8-1 作図環境

# 4章のゴール
# ・Rで基礎的なグラフを描けるようになる
# ・Rで作図する際の余白などを設定出来るようになる


# ●4-1 棒グラフ
# 棒グラフはデータの大小を表す際に使われる

# ・棒グラフのシンタックス
# Rでの棒グラフのシンタックスは以下の通り

# barplot(x, beside = , horiz = , col = , legend = )
# xは棒グラフにするデータを指定する
# beside = TRUEの場合、1列を1組の棒として描く。つまり1列が5つの階級によって区切られている場合、それぞれの階級ごとに棒グラフが描かれる
# beside = FALSEの場合、1列のデータを1つの棒として描く。つまり1列がいくつの階級に区切られていても、1本の棒グラフとして描かれる
# horiz = TRUEの場合、棒グラフが横方向に描かれる
# horiz = FALSEの場合、棒グラフは縦方向に描かれる
# col = 棒グラフの色を変えることが出来る。利用できる色はcolor()変数で調べる
# legend = 凡例を図内に作成することが出来る

# Rに予め登録されているVADeathsというデータセットを使って棒グラフを描画する

VADeaths   # VADeathsを表示する
barplot(VADeaths)   # VADeathsの棒グラフを表示する

# この関数で表示されるグラフは、VADeathsの1列のデータをそのまま棒グラフにしている
# 具体的には、Rural Male列の場合、70-74 66.0から50-54 11.7までのデータが棒グラフ化されている
# ここで注意したいのは、データの順番と棒グラフの順番が逆になっている点である

# ・棒グラフの順番を整理する
barplot(VADeaths, beside = TRUE)   # VADeathsの棒グラフを表示する

# 引数beside
# そこで引数beside = TRUEを書くと、順番が整理される
# Rural Male列の場合、50-54 11.7を最左、70-74 66.0のデータが最右にプロットされる


# ・棒グラフの色を変える
barplot(VADeaths, beside = TRUE, col = c('lightblue', 'mistyrose', 'lightcyan', 'lavender', 'cornsilk'))　# VADeathsの棒グラフを表示する

# 引数col
# 更に引数colを設定すると、棒グラフの色を変えることが出来る
# この例では、lightblue、mistyrose、lightcyan、lavender、cornsilkを使っている
# ただし、色はRで指定されている657種類から選ぶ必要がある


# ・Rで利用可能な色の調べ方
colors()

# colors関数を使うと、Rで利用可能な色名をリスト表示できる


# ●4-2 円グラフ
# 円グラフはデータの割合を示す際に使われる

# ・円グラフのシンタックス
# Rでの円グラフのシンタックスは以下の通り

# pie(x, col = , radius = , density = , angle = )
# xは円グラフにするデータを指定する
# col = 円グラフの色を変えることが出来る
# radius = は円グラフの大きさを指定する。デフォルトは0.8で-1〜1で指定する
# 1以上を指定すると、円グラフ全体を表示することが出来ない
# density = は、円グラフに斜線を引くことができる。値が大きいほど、斜線の間隔が狭い
# angle = 斜線の角度を調整できる

sales   # salesを表示する

# ・円グラフの表示
pie(sales)   # salesの円グラフを表示する

# ・円グラフの色設定
sales.col <- c('yellow', 'green3', 'purple', 'violetred1', 'cyan')
# sales.colに色データを代入する

# ・色つき円グラフの表示
pie(sales, col = sales.col, radius = 1)   # salesの円グラフをsales.colの色を使って、サイズ1で表示する

# ・斜線付き円グラフの表示
pie(sales, density = 15, angle = 15 + 10 * 1:5)   # salesの円グラフを斜線付きで表示する


# ●4-3 ヒストグラム
# データを階級ごとにまとめ、棒グラフで表現したものをヒストグラムと呼ぶ

# ・ヒストグラムのシンタックス
# Rでのヒストグラムのシンタックスは以下の通り

# hist(x, col = , breaks = , plot = )
# xはヒストグラムにするデータを指定する
# col = ヒストグラムの色を変えることが出来る
# breaks = はヒストグラムの階級数を指定する
# plot = FALSE ヒストグラムに関連した情報を文字列で表示する

# ・ヒストグラムの表示
hist(iris[1:50, 2])   # irisの1〜50行の2列目のデータをヒストグラムとして表示する

# データ名[]で、データ内の任意の箇所、この場合は1〜50行の2列目を指定することが出来る
# [行, 列]の順番での指定になる

# ・色付きヒストグラムの表示
hist(iris[1:50, 2], col = 'lightblue')   # irisの1〜50行の2列目のデータをlightblueのヒストグラムとして表示する

# ・色付きヒストグラムの表示
hist(iris[1:50, 2], breaks = c(1:5), col = 'blue')   # irisの1〜50行の2列目のデータを5つの階級数でblueのヒストグラムとして表示する


# ●4-4 折れ線グラフ
# 折れ線グラフは、データの変化を表現する際に使われる
# 折れ線グラフが作成可能な関数はいくつかあるが、ここではmatplot関数を使う
# 尚、データはVADeathsを使う

# ・折れ線グラフのシンタックス
# Rでのヒストグラムのシンタックスは以下の通り

# matplot(x, type = , pch = , xlab = , ylab = , axes = )
# xは線グラフにするデータを指定する
# type = lは線グラフを描画する。lはlineのlである
# type = bは線グラフ上に数値を描画する
# pch = は線グラフ上にプロットされるマークの種類を指定する
# pch = 1は○、pch = 2は△、ppch =  3

# ・線グラフを表示
matplot(VADeaths, type = 'l')   # VADetahsの線グラフを描画する

# ・数値付き線グラフを表示
matplot(VADeaths, type = 'b')   # VADetahsの数値付き線グラフを描画する

# ・マーク付き線グラフ(枠なしでの描画)
RL <- nrow(VADeaths)   # RLにVADeathsの行数を代入する
matplot(VADeaths, type = 'b', pch = 1:RL, xlab = '', ylab = '', axes = FALSE)
# VADetahsのマーク付き線グラフを、軸の枠なしで描画する

# ・X軸(横軸)の追加
axis(1, 1:RL, rownames(VADeaths))   # 横軸の作成

# ・Y軸(横軸)の追加
axis(2); CL <- ncol(VADeaths)   # 縦軸の作成

# ・凡例の追加
legend(1, max(VADeaths), colnames(VADeaths), col = 1:CL, lty = 1:CL)


# ●4-5 箱ひげ図
# 箱ひげ図はデータの分布を、最大値、最小値、第一四分位、第二四分位(中央値)、
# 第三四分位、第四四分位で表すことが出来る
# 箱ひげ図はboxplot関数で描画する
# ここでは、irisのデータを使う

# ・箱ひげ図の表示
boxplot(iris[,1])   # irisの1列目のデータの箱ひげ図を描く

# ・色付き箱ひげ図の表示
boxplot(iris[,1]~iris[,5], col = 'lightblue')   # irisの1〜5列目のデータを使ってlightblueの箱ひげ図を描く


# ●4-6 散布図
# 散布図は変数間の関係を考察するために、X軸とY軸にプロットするグラフである

# ●4-6-1 二次元散布図
# 二次元散布図は散布図の中で最もシンプルなサンプ図で、1つの変数をX軸、もう一つの変数をY軸に配置する
# plot関数を使うことで、散布図を描くことが出来る
# ここでもirisのデータを使う

# ・散布図を描く
plot(iris[, 1], iris[, 3])   # irisの1列目をX軸に、3列目をY軸にした散布図を描く

# ・散布図の枠のみを描く
plot(iris[, 1], iris[, 3], type = "n")   # irisのデータを使って、散布図の枠だけを描く

# ・データ番号を付与した散布図を描く
text(iris[, 1], iris[, 3])   # irisの1列目をX軸に、3列目をY軸にデータ番号を付与した散布図を描く

# ・irisのデータにラベル付けする
iris.label <- rep(c('S','C', 'V'), rep(50, 3))
# irisのデータを3分割し、S,C,Vとラベル付けし、iris.labelに代入する

# ・散布図の枠のみを描く
plot(iris[, 1], iris[, 3], type = 'n')   # irisのデータを使って、散布図の枠だけを描く

# ・ラベル付けしたデータでサンプル図を描く
text(iris[, 1], iris[, 3], iris.label)   
# irisの1列目をX軸に、3列目をY軸にして、ラベル付けしたデータを使って散布図を描く

# ・X軸にLength of Sepal、Y軸にLength of Petalを設定して散布図を描く
plot(iris[, 1], iris[, 3], type = 'p', xlab = 'Length of Sepal',
     ylab = 'Length of Petal', cex = 2, col = 'red')

# ・散布図の点の固体を識別する
identify(iris[, 1], iris[, 3])   #irisの1列目をX軸に、3列目をY軸のデータ固体を識別できるようにする

# ・色分けした散布図を描く
plot(iris[, 1], iris[, 3], pch = 21, cex = 2,
     bg = c(2, 3, 4)[unclass(iris $ Species)])
#irisの1列目をX軸に、3列目をY軸のデータを使って、円形マーク、三色でirisのSpecies列の品種順に塗りつぶして描画する

# ・サイズを0.8に縮小する
par(cex = 0.8)   # サイズを0.8倍に変える


# ●4-6-2 対散布図(散布図行列)
# 一つの画面に散布図を複数並べた散布図行列を対散布図と呼ぶ
# Rではpairs関数を使う

# ・対散布図を描く
pairs(iris[1:4])   # irisの1〜4列目のデータを使って対散布図を描く

# ・色付き対散布図を描く
pairs(iris[1:4], pch = 21, bg = c('red', 'green3', 'blue')[unclass(iris $ Species)])
# irisの1〜4列目のデータを使い、円形マーク、三色でirisのSpecies列の品種順に塗りつぶして描画する


# ●4-6-3 3次元グラフ
# 3次元空間でデータ配置した散布図を3次元散布図と呼ぶ
# Rで3次元散布図を描くには、scatterplot3d、latticeといったパッケージをダウンロード、インストールする必要がある

# ・scatterplot3dのインストール
install.packages('scatterplot3d');
library(scatterplot3d)

# ・3次元散布図を描く
scatterplot3d(iris[2 : 4])   # irisの2〜4列目のデータを使って3次元散布図を描く

# ・3次元散布図をマークを使って色付けで描く
scatterplot3d(iris[2 : 4], pch = c(1:3)[unclass(iris[,5])],
              color = unclass(iris[, 5]))
# irisの2〜4列目のデータを使って、irisの5列目のデータから3つのマークと色を使って3次元散布図を描く

# ・irisのデータにラベル付けする
iris.lab <- c(rep('S', 50), rep('C', 50), rep('V', 50))
# irisのデータを3分割し、S,C,Vとラベル付けし、iris.labelに代入する

# ・ラベル付けしたデータで3次元散布図を色付けで描く
scatterplot3d(iris[2 : 4], pch = iris.lab, color = unclass(iris[,5]))
# irisの2〜4列目のデータを使って、iris.labのラベルを使い、の5列目のデータから3つ色を使って3次元散布図を描く


# ■4-8 作図環境とグラフの利用
# ●4-8-1 作図環境
# Rでグラフを作成する際には、余白の指定が必要になる場合がある
# 1画面に1つのグラフを作成する際の余白はpar関数にmar引数で設定できる
# mar引数は、mar = c(x1, x2, x3, x4)で指定することが出来る
# x1, x2, x3, x4はそれぞれ下、左、上、右の余白サイズの値(単位は行の高さ、引数mex = 1の倍数)となる
# デフォルトは、par(mar = c(5, 4, 4, 2) +0.1)になっている

# ・散布図を描く
plot(iris[1 : 2])   # irisの1、2列目を使って散布図を描く

# ・余白を設定する
temppar <- par(mar = c(8, 6, 4, 2))   # 下:8、左:6、上:4、右:2の余白を設定し、tempparに代入する

# ・余白を設定した散布図を描く
plot(iris[1 : 2])   # irisの1、2列目を使って散布図を描く

# ・余白設定をデフォルトに戻す
par(temppar)   # tempparをデフォルト設定に戻す


# ●一つのグラフィックスウインドウに複数のグラフを表示する場合
# mar引数の代わりにmai引数を設定することも出来る
# mai引数の単位はインチで、一つの画面に複数のグラフを表示する場合は、par関数に
# mfrow = c(n, m)あるいはmfcol = c(n, m)を使ってグラフの数(n行 × m列)を指定することが必要である
# 引数mfrowを使った場合は、グラフを行の順に、mfcolを使った場合はグラフを列の順に作成する

# ・グラフィックスウインドウを分割する
par <- (mfrow = c(2, 2))   # 画面を2行×2列に分割する

# ・散布図を二つ描く
plot(iris[,2], iris[,3]); plot(iris[,2], iris[,4]);
# irisの2列・3列目を使って散布図を描く
# irisの2列・4列目を使って散布図を描く

# ・箱ひげ図を二つ描く
boxplot(iris[,2]~iris[,5]); boxplot(iris[,3]~iris[,5])
# irisの2〜5列目を使って箱ひげ図を描く
# irisの3〜5列目を使って箱ひげ図を描く


# ●一つのグラフィックスウインドウに複2行×2列の4つのグラフを表示する
# ・グラフィックスウインドウを分割する
temppar <- par(mfrow = c(2, 2), mar = c(1, 1, 1, 1))
# 画面を2行×2列に分割し、下:1、左:1、上:1、右:1の余白を設定して、tempparに代入する

# ・散布図を二つ描く
plot(iris[, 2], iris[, 3]); plot(iris[, 2], iris[, 4]);
# irisの2列・3列目を使って散布図を描く
# irisの2列・4列目を使って散布図を描く

# ・箱ひげ図を二つ描く
boxplot(iris[,2]~iris[,5]); boxplot(iris[,3]~iris[,5])
# irisの2〜5列目を使って箱ひげ図を描く
# irisの3〜5列目を使って箱ひげ図を描く

# ・余白設定をデフォルトに戻す
par(temppar)


# ・新しいグラフィックスウインドウを開く
windows()   # 新しいウインドウを開く


# 以上