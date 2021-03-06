# 2019年1月16日 『Rによるデータサイエンス』 3章

# 『Rによるデータサイエンス』 3章
# 3章の構成
# 3-1 データの演算
#  3-1-1 算術演算
#  3-1-2 比較演算
#  3-1-3 論理演算
#  3-1-4 行列の演算
#  3-1-5 対角行列と逆行列
# 3-2 固有値と特異値の分解
#  3-2-1 固有値
#  3-2-2 特異値分解
# 3-3 基本統計量

# 3章のゴール
# ・Rで基礎的な演算が出来るようになる
# ・算術、比較、論理、行列演算の違いを理解する
# ・Rで固有値と特異値の演算が出来るようになる
# ・Rで基本統計量を演算が出来るようになる

# ■3-1 データの演算
# ●3-1-1 算術演算
# 算術演算はべクトル、マトリックス、データフレーム、リストにも有効である
# 以下の例ではベクトルxとyにそれぞれ整数を代入して計算している

x <- c(1, 2, 3, 4); y <- c(4, 2, 3, 1)   # 変数xとyにデータを代入する
x + y   # x + yを表示する

x * y   # x * yを表示する

x / y   # x / yを表示する

x ^ y   # x ^ yを表示する


# ●3-1-2 比較演算
# 比較演算は<, >, <=, >=, ==, !+といった記号で表され、大きいか小さいか、
# 等しいか等データの値を比較するための演算である
# 以下の例では前の例で作ったベクトルxとyに格納されている要素をそれぞれ比較して結果を表示している

x > y   # xがyより大きいかを表示する

x < y   # xがyより小さいかを表示する

x >= y   # xがyより大きいか等しいかを表示する

x <= y   # xがyより小さいか等しいかを表示する

x == y   # xとyが等しいかを表示する

x != y   # xとyが等しくないかを表示する


# ●3-1-3 論理演算
# 論理演算は真(True)と偽(False)のいずれかを返す演算である
# 以下の記号で表される

# 1. 否定(NOT)
#  記号:!
#  例:!(F)
#  出力結果:TRUE

# 2. 積(AND)
#  記号: &
#  例: T & T
#  出力結果: TRUE

# 3. 積(AND)
#  記号: &&
#  例: T && T
#  出力結果: TRUE

# 4. 和(OR)
#  記号: |
#  例: T | F
#  出力結果: TRUE

# 5. 和(OR)
#  記号: ||
#  例: T || F
#  出力結果: TRUE

# 6. 排他的論理和(xor)
#  記号: xor
#  例: xor(T, T)
#  出力結果: FALSE

Lx <- c(T, T, F, F); Ly <- c(T, F, F, T)   # Lx Lyにデータを代入する

Lx & Ly   # LxとLyの積(AND)を表示する

Lx && Ly　# LxとLyの積(AND)を表示する

Lx | Ly　# LxとLyの和(OR)を表示する

Lx || Ly　# LxとLyの和(OR)を表示する


# ●3-1-4 行列の演算
# 行列の代数和演算、両行列に対応する要素の掛け算、割り算は算術演算と同じである
# Rでの行列を使った積演算には以下の3つがあるが、ここでは行列積のみを紹介する

# 1. 行列積
# 2. 行列クロス積(Crossprod)
# 3. 行列外積(Outer)

A <- matrix(c(1, 2, 1, 4), 2, 2)   # Aにマトリックスでデータを代入する
D <- matrix(c(4, 2, 3, 4, 2, 1), 2, 3)   # Dにマトリックスでデータを代入する

A %*% D   # AとDの積演算を表示する


# ●3-1-5 対角行列と逆行列
# ・対角行列
# 行列の対角要素以外のすべての要素が0である行列を対角行列と呼ぶ
# Rではdiag関数を使って対角要素のみを指定することで対角行列を作ることが出来る
# 以下の例では、対角要素を6, 7, 3にした例を紹介する

diag(c(6, 7, 3))   # 対角要素を6, 7, 3の対角行列を作る


# ・逆行列
# Rには逆行列を求めるsolve関数がある
# 以下の例では、行列Aの逆行列を求めている

solve(A)   # 行列Aの逆行列を求める


# ■3-2 固有値と特異値の分解
# ●3-2-1 固有値
# 固有値、固有ベクトルはデータ分析でよく使われる
# Rではeigen関数で正方行列の固有値、固有ベクトルを求めることが出来る
# 以下の例では、行列Aの固有値、固有ベクトルを求めている
# A = {1, 1}
#     {2, 4}

eigen(A)   # 行列Aの固有値、固有ベクトルを表示する

A.eig <- eigen(A)   # A.eigに行列Aの固有値、固有ベクトルを代入する
A.eig$values   # A.eigのvaluesを表示する(つまり固有値を表示する)
A.eig$vectors   # A.eigのvectorsを表示する(つまり固有ベクトルを表示する)

A %*% A.eig$vectors   # 行列AとAの固有ベクトルの積演算を表示する

A.eig$vectors %*% diag(A.eig$values)   # 行列Aの固有ベクトルと固有値の対角要素の積演算を表示する


# ●3-2-2 特異値分解
# ここまでの固有値、固有ベクトル計算は正方形行列を前提にしていた
# 実際には毎回、正方形行列であることは少なく、任意の行列の分解が必要になる
# n行p列の行列Bが与えられた場合、Bを3つの行列の積に分解することを特異値分解と呼ぶ
# Rではsvd関数を使って特異値分解を行うことが出来る
# 以下の例では、行列Dの特異値分解を行っている

(D.s <- svd(D))   # 行列Dの特異値分解をD.sに代入する
(D.s <- svd(D))$d   # 行列Dの特異値分解をD.sに代入し、主体角線行列の対角要素を表示する
(D.s <- svd(D))$u 
(D.s <- svd(D))$v   

D.s$u %*% diag(D.s$d) %*% t(D.s$v)   # 結果は行列Dと同じになる


# ■3-3 基本統計量
# 統計量とは統計データから計算、要約した数量を表す
# 基本統計量は、合計、比率、平均、中央値、最頻値、分散、四分位数を指す
# 代表的な統計量は以下の通り

# 1. 合計
#  関数名:sum

# 2. 算術平均
#  関数名:mean

# 3. 最大値
#  関数名:max

# 4. 最小値
#  関数名:min

# 5. 範囲(最大値 - 最小値)
#  関数名:range

# 6. 中央値
#  関数名:median

# 7. 分散
#  関数名:var(Varianceの略)

# 8. 標準偏差
#  関数名:sd(Standard Deviationの略)

# 9. 分位数
#  関数名:quantile

# 10. 四分位数/平均
#  関数名:summary

# 11. 行・列別の基本統計量を返す
#  関数名:apply

(temp<-1:10)   # tempにデータを代入する
sum(temp)   # 合計を求める
summary(temp)   # データの最小値・最大値・四分位数・平均を表示する


# apply関数
# apply関数を使うとデータセットの中から任意の行・列を選択して、基本統計量を計算することが出来る

# ・apply関数の書式
# apply(X, MARGIN(1|2を指定), FUN, ...)
# Xはデータセットを表す
# MARGINは行は1、列は2を指定する
# FUNは統計量の関数や計算式を指定する

# ・apply関数の利用例
# 以下は、Rにデフォルトで登録されているirisのデータを使って行・列の基本統計量を計算する

apply(iris[,1:4], 2, mean)   # irisの1〜4列の平均を表示する

apply(iris[,1:4], 2, var)   # irisの1〜4列の分散を表示する


# cor関数
# cor関数を使うと相関係数を求めることが出来る
# 以下の例では、irisの最後から5行の相関係数を求めている

cor(iris[, -5])   # irisの最後から5行の相関係数を表示する

# var関数
# var関数を使うと分散を求めることが出来る
# 以下の例では、irisの最後から5行の分散を求めている

var(iris[, -5])   # irisの最後から5行の分散を表示する

# cov関数
# cov関数を使うと共分散を求めることが出来る
# 以下の例では、irisの最後から5行の共分散を求めている

cov(iris[, -5])   # irisの最後から5行の共分散を表示する


# 以上