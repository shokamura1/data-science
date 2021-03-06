# 2019年4月2日 『Rによるデータサイエンス』 �U部 12章41　時系列

# 『Rによるデータサイエンス』�U部 12章1篇　時系列
# ●12章の構成
# 12-1 基本概念とデータの操作
#  12-1-1 時系列とは
#  12-1-2 時系列データの形式と属性
#  12-1-3 時系列データの図示
#  12-1-4 データオブジェクトの作成
#  12-1-5 ラグ処理
#  12-1-6 差分

# ●12章1篇 時系列分析のゴール
# ・時系列分析の基本概念を理解する
# ・時系列データの各種操作(図示、データオブジェクト作成、ラグ処理、差分)をRで実装出来るようになる

# 本章では、時間とともに変化するデータ、時系列の基本概念及びARモデル、AR-MA/ARIMAモデル、
# ARIFMAモデル、GARCHモデル、成分分解、多変量時系列、カオス時系列などを扱う。


# ●12-1 基本概念とデータの操作
# ●12-1-1 時系列とは
# 時間とともに変動する現象に対して、時間の順序で測定・観察した結果を記録したデータを時系列(time series)とデータと呼ぶ。
# 時系列データは、多くの分野で様々な目的で使われる。
# 日常の生活の中でよく見受けられるものは、心電図や脳波のような医療データ、
# 気温や気圧のような気象データ、株価及び為替のような金融・経済データがある。

# 時系列データは、変動を伴うものである。
# その振る舞いを統計的に分析し、データの変動の特徴を捉え、現象の解明と将来の変動を予測・制御しようとするのが、
# 時系列データ分析の主要な目的である。
# ちなみに、2003年ノーベル経済学賞の受賞対象となった内容は、経済時系列分析に関する内容である。


# ●12-1-2 時系列データの形式と属性
# 時系列データは、通常ある一定の時間間隔で測定・観測したものである。
# 観測・測定値yに関する標本サイズnの時系列データは、測定した時点tをインデックスとして
# 以下のように記される。

# y1, y2, ..., y t - k,..., yt - 1, yt, yt + 1,..., yt + k,...yn - 1, yn

# Rには、マトリックス、データフレームに並んで時系列データオブジェクト形式が用意されている。
# 基本的な時系列データの操作と分析に関する関数は、パッケージstatsに含まれている。
# パッケージdatasetsには、ある女性の血液中の黄玉ホルモンを10分間隔で計測した
# データlhがある。
# 次のようにclass関数が返す結果から、データlhの属性が確認できる。
# 返された結果tsは、time seriesの頭文字で、属性が時系列であることを示す。

class(lh)

# Rにおける時系列データオブジェクトtsは、データに時間などの情報を加えて、
# 構造化したものである。
# 例えば、次に示すデータlhの内部には、時系列が始まる時間を1, 終わる時間を48として
# 観測データが記録されている。

lh

# データlhでは、10分を1つの時間間隔としているが、この時間内では、1回しか観測していないので
# Frequency = 1になっている。
# 1年を単位とし、月毎に観測したデータの場合は、Frequency = 12、四半期ごとに観測した場合は、Frequency = 4となる。
# パッケージdatasetsには、1960年から1986年までのイギリスのガス消費量を四半期毎に観測した時系列データUKgasがある。
# start、end関数を使って時系列データの開始時間と終了時間、frequency関数で時間毎に
# 観測した回数を返す例を以下に示す。

start(UKgas)
end(UKgas)
frequency(UKgas)
UKgas

# Window関数を使うことで、時系列の一部分を切り出すことが出来る。
# 利用例は以下の通り。

window(UKgas, c(1975, 2), c(1979, 3))

# ●12-1-3 時系列データの図示
# 時系列データはts.plot関数を使って、横軸を時間、縦軸を観測・観測値として折れ線グラフを作成することが出来る。
# ts.plot関数は、plotと略すことも可能。
# plot関数は、自動的にオブジェクトの属性を識別するので、オブジェクトが時系列の場合は、
# 自動的にts.plot関数のグラフを表示する。
# 次にデータlh、UKgasの時系列グラフを描く。

op <- par(mfrow = c(2, 1), mar = c(4.5, 4, 1, 1))
ts.plot(lh)
ts.plot(UKgas); par(op)

# ts.plot関数では、通常の作図関数plotと同様に線種や色を自由に設定が出来る。
# パッケージdatasetsには、1974年から1979年までのイギリスで喘息、気管支炎、肺気腫による死亡数を月ごとに記録した
# ldeathsと、これを男女別に分けたmdeaths、fdeathsがある。
# この3種類のデータを1つのグラフに表す例を次に示し、結果を示す。

ts.plot(ldeaths, mdeaths, fdeaths, gpars = list(xlab = '年', ylab = '死亡数', lty = c(1:3), col = c(1:3)))
legend(locator(1), c('全体', '男性', '女性'), lty = c(1:3), col = c(1:3))


# ●12-1-4 データオブジェクトの作成
# 非時系列データオブジェクトは、ts関数、as.ts関数を使うことで、時系列データオブジェクトにすることが出来る。
# ts関数を使う際には、開始時間(start)、時間単位ごとの観測数(frequency)を指定することが必要である。
# 例えば、1から120までの整数を1995年から2004年まで、1年に12回観測したデータとして、
# 時系列オブジェクトを作成するには、次のようにts関数を使う。

temp <- ts(1:120, start = c(1995, 6), frequency = 12)
class(temp)
temp

# この例で分かるように、引数startは時系列が始まる時間を指定する。
# 使う全てのデータを時系列に変換する時は、引数startを指定すると終わる時間は唯一であるので、
# 引数endを指定しても良い。
# as.ts関数は、データマトリックスやデータフレームなどを時系列の属性に変換する。


# ●12-1-5 ラグ処理
# 時系列データを分析する際、データの時間をシフトして比較したりことも少なくない。
# 時間の遅れのことを、時系列ではラグ(lag)と呼ぶ。
# 時点tを基準とした時、Yt-1をYtの1次ラグ、Yt-2を2次ラグ、Yt-kをk次ラグと呼ぶ。
# Rには、ラグ処理を行うlag関数が用意されている。
# 以下にデータldeathsに対して、ラグ処理の例を示す。
# 引数kは、正負の整数である。

ldeaths
lag(ldeaths, k = 5)

# 他にもRには、時系列データの併合を行うts.union関数、ts.intersect関数がある。


# ●12-1-6 差分
# 値YtからYt-1を引いた値ΔYt = Yt - Yt-1を差分(階差)と呼ぶ。
# 時系列データにトレンドを含む場合は、差分操作でトレンドを除去することが出来る。
# Rには差分を求めるdiff関数が用意されている。
# ここで時系列データUKgasの差分を図にした例を示す。
# 右肩上がりのトレンドを持つ時系列データがdiff関数を使うことで、そのトレンドが除去される。

plot(diff(UKgas))

# diff関数には、引数lagがあり、デフォルトは1になっている。
# このlagは、ラグ関数のlagと同じ意味を持っている。
# diff関数の引数lagとlag関数の引数kとの対応関係を、データUKgasを使って示すと以下のようになる。

# diff(UKgas, lag = 2) = UKgas - lag(UKgas, k = -1)

# diff関数には、差分演算を繰り返す引数differencesがあり、デフォルトは1になっている。


# 以上