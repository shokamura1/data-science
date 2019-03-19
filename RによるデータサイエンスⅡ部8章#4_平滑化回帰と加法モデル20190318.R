# 2019年3月18日 『Rによるデータサイエンス』 Ⅱ部 8章

# 『Rによるデータサイエンス』Ⅱ部 8章
# ●8章の構成
# 8-5 平滑化回帰と加法モデル
#  8-5-1 平滑化回帰
#  8-5-2 加法モデル
# 8-6 補遺と注釈

# ●8章 平滑化回帰と加法モデルのゴール
# ・平滑化回帰と加法モデルの概念を理解する
# ・平滑化回帰と加法モデルをRで実装できるようになる
# ・平滑化回帰と加法モデルのバリエーションを理解する

# ●8-5 平滑化回帰と加法モデル
# ●8-5-1 平滑化回帰
# lm関数、glm関数、nls関数が対応出来ない複雑なデータの回帰モデル説明のため、
# 以下の人口データを用いる。生成されたx1を横軸、y1を縦軸とした散布図を示す。

x1 = seq(-10, 10, 0.1);set.seed(10)
y1 = 50 * sin(x1) + x1^2 + 10 * rnorm(length(x1), 0, 1)
plot(x1, y1)

# データy1を目的変数、y1を説明変数とした非線形回帰モデルを考える場合、
# 散布図から思いつくのは多項式回帰モデルである。
# 次の3種類の多項式回帰モデルのコマンドと、その回帰モデルによる予測値を散布図に加えるコマンドを示す。

lm.p2 <- fitted(lm(y1~poly(x1, 2)))   # 2次多項式モデルの予測値
lines(x1, lm.p2, lty = 4, col = 4, lwd = 2)

lm.p5 <- fitted(lm(y1~poly(x1, 5)))   # 5次多項式モデルの予測値
lines(x1, lm.p5, lty = 2, col = 2, lwd = 2)

lm.p8 <- fitted(lm(y1~poly(x1, 8)))   # 8次多項式モデルの予測値
lines(x1, lm.p8)

legend(locator(1), c('poly(x1, 2)', 'poly(x1, 5)', 'poly(x1, 8)'),
       col = c(4, 2, 1), lty = c(4, 2, 1), lwd = 2)   # 凡例の表示

# 結果を見て分かるようにこのデータに於いては、多項式によるモデルの当てはめの精度が良いとは言えない。
# このように複雑に変化するデータの回帰方法として、平滑化回帰の方法がある。
# 平滑化回帰を詳しく解説する紙面がない為、ここではRに用意されているsmooth.spline関数、
# ksmooth関数、supsmu関数、lowess関数を用いた平滑化コマンドの例を示す。

# ・smooth.spline関数による平滑化
par(mfrow = c(2, 2), oma = c(2, 2, 2, 2), mar = c(2, 2, 2, 2))
plot(x1, y1, main = 'smooth.spline関数による平滑結果')
lines(smooth.spline(x1, y1), col = 2, lwd = 2)

# ・ksmooth関数による平滑化
plot(x1, y1, main = 'ksmooth関数による平滑結果')
lines(ksmooth(x1, y1), col = 4, lwd = 2)

# ・supsmu関数による平滑化
plot(x1, y1, main = 'supsmu関数による平滑結果')
lines(supsum(x1, y1), col = 3, lwd = 2)

# ・lowess関数による平滑化
plot(x1, y1, main = 'lowess関数による平滑結果')
lines(supsum(x1, y1, f = 0.1), col = 5, lwd = 2)


# ●8-5-2 加法モデル
# 加法回帰モデル(additive regression model)、単に加法モデルとも言うは、
# 次のような式で表されるモデルである。

# y = a + f1(x1) + f2(x2) + … + fi(xi) + … + fn(xn) + 残差

# yは目的変数、xiは説明変数、fiは説明変数の変換を行う関数である。
# 線形回帰モデル及びnls関数による非線形回帰モデルは、加法モデルの特殊なケースと考えられる。

# 一般化線形モデルを加法モデル化した時、一般化加法モデル(GAM: Generalised Additive Model)と呼ぶ。
# Rのパッケージmgcvに一般化加法モデルのgam関数がある。
# gam関数では、それぞれの説明変数を平滑化関数をリンクして用いることも出来る。

# データairqualityを用いて、その使用法を示す。
# airqualityには欠損値があるので、na.exclude関数を使い、欠損値を除いたデータセットを作成する。
# ここでは用いるすべての説明変数について平滑化スプラインをリンクすることにする。
# 平滑化スプラインsmooth.splineの略記号はsである。
# 次にその実行例を示す。加法モデルの要約は、summary関数で返される。

install.packages('mgcv'); library(mgcv)
airq2 <- na.exclude(airquality[,1:4])
airq.gam <- gam(Ozone~s(Solar.R) + s(Wind) + s(Temp), data = airq2)
summary(airq.gam)


# 加法モデルと一般化線形もでるの当てはめの良さを比較するため、それぞれのAIC値を次に示す。
# AICの値から、加法モデルが線形回帰モデルより当てはめが良いと言えよう。

AIC(airq.gam)
airq.gam <- glm(Ozone~Solar.R + Wind + Temp, data = airq2)
AIC(airq.gam)


# ●8-6 補遺と注釈
# 回帰分析は、データ分析の中で最も話題が豊富な分野である。
# 本章で説明した方法以外にもよく知られている方法として、線形・非線形混合効果モデル、
# 局所回帰モデル、ロバスト回帰モデル、射影追跡回帰モデル、樹木モデル(tree-based model)、
# ニューラルネットワークモデル(neural network model)などがある。

# ・線形・非線形混合効果モデル
# 線形・非線形混合効果モデル(non-linear mixed-effects models)に関しては、
# パッケージnlmeの中にlme関数、nlme関数がある。
# 又、同パッケージの中には、モデルのベイジアン情報量基準(BIC: Bayesian Information Criterion)を求めるBIC関数がある。

# ・局所回帰モデル(local regression model)
# 局所的に回帰モデルを当てはめる一つの方法である。
# 平滑化関数lowessは、局所多項式を採用している。パッケージstatsの中には、
# 局所回帰関数loessがある。loess関数は局所多項式による回帰モデルである。

# ・ロバスト回帰モデル(robust regression model)
# 最小2乗法で求めた残差が、あるサンプルの影響で正規分布から大きく乖離した場合、
# そのサンプルを除外して、回帰モデルを作成する頑健(ロバスト)な回帰分析方法である。
# MASSパッケージ内にロバスト回帰分析を行うrlm関数がある。

# ・射影追跡回帰モデル(projection pursuit regression model)
# 射影した説明変数に加法モデルを適用する方法である。
# MASSパッケージに射影追跡回帰関数pprがある。
# fMultivarパッケージには、線形回帰モデル、一般線形モデル、加法モデル、射影追跡回帰モデル、
# ニューラルネットワークを扱うregFit関数がある。


# 以上