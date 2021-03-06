# 2019年4月4日 『Rによるデータサイエンス』 �U部 12章2篇　時系列　自己共分散と自己相関

# 『Rによるデータサイエンス』�U部 12章2篇　自己共分散と自己相関
# ●12章2篇の構成
# 12-2 自己共分散と自己相関

# ●12章2篇 時系列　自己共分散と自己相関のゴール
# ・時系列分析における基本統計量にあたる自己共分散と自己相関の概念を理解する
# ・自己共分散と自己相関をRで実装出来るようになる


# ●12-2 自己共分散と自己相関
# 通常のデータの基本的な属性を表す統計量として、平均、分散、相関係数等が使われる。
# これに対して時系列では、平均、自己共分散(autocovariance)、自己相関(autocorrelation)のような統計量がある。

# 時系列{y1, y2, ..., yn}の標本平均は、μ^ = 1 / n n Σ t = 1 Yt
# で定義されている。

# 時系列の平均や自己共分散が時間が経過しても変化しない場合、その時系列を定常時系列といい
# これらの性質が何らかの形で変化するものを非定時時系列という。

# 定常時系列の場合、標本データのYtとYt - kとの標本自己共分散関数は、
# C^k = 1 / n n Σ t = k + 1 (Yt - μ^)(Yt-k - μ^)
# で定義され、

# 標本自己相関関数は、
# R^k = C^k / C^0
# で定義される。パッケージstatsには、自己相関、自己共分散を求めるacf関数がある。
# acf関数のシンタックスは以下の通り。

# acf(x, type = 'correlation', plot = TRUE, ...)

# 引数xは時系列データ、引数typeには'correlation’(自己相関)、'covariance'(自己共分散)、
# 'partial'(偏相関)の中から一つ選んで指定することが出来る。
# デフォルトは'correlation'になっている。引数plotは図示を指定する引数であり、
# デフォルトはplot = TRUEになっているので、自動的に作図される。
# 図示のデフォルトはplot.acf関数のデフォルト値に従う。又、欠損値の扱いに関する引数na.actionなどがある。
# データUKgasを使ったacf関数の使用例を以下に示す。

acf(UKgas)

# 図から横軸1, 2, 3, 4, 5のところの自己相関係数の値が大きく、データUKgasは1年単位の
# 周期性が顕著に出ている。横の破線は95%の信頼区間を表す。
# 信頼区間は引数ciを使って指定する。例えば、信頼区間を90%にする場合は、
# 以下ののように書く。

acf(UKgas, ci = 0.9)

# データに周期性とトレンドがある場合、diff関数を使って除去することも出来る。
# diff関数の引数lagを1, 2, 3, 4にしたデータUKgasの差分を求める例を以下に示す。
# ここではまずUKgasを対数変換し、差分を計算している。
# これは出力される図から分かるように、データUKgasのトレンドが直線ではなく、
# 指数関数に近いからである。

op <- par(mai = rep(0.25, 4), mfrow = c(4, 1))
for (i in 1:4)plot(diff(log(UKgas), lag = i))
par(op)   # デフォルトの状態に戻す

# データUKgasは四半期データであり、四半期ごとに周期を持っているので、
# diff関数の引数lagを4にした差分によって、周期成分が除去されている。
# 又、異なる2つの時系列データ間の相互共分散および相互関数は、ccf関数で求めることが出来る。
# 次にデータmdeathsとfdeathsとの相互相関を求めるccf関数の利用例を示す。

ccf(mdeaths, fdeaths)

# 出力結果から、両時系列データは強い相関と周期性を持っていることが読み取れる。
# 偏自己共分散・相関はpacf関数で求めることが出来る。

pacf(mdeaths, fdeaths)


# 以上