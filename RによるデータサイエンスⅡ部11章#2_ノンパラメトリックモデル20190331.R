# 2019年3月31日 『Rによるデータサイエンス』 Ⅱ部 11章2篇　生存分析ノンパラメトリックモデル

# 『Rによるデータサイエンス』Ⅱ部 11章2篇　生存分析ノンパラメトリックモデル
# ●11章の構成
# 11-2 ノンパラメトリックモデル
#  11-2-1 ノンパラメトリックの推定法
#  11-2-2 survfit関数
#  11-2-3 生存関数の検定

# ●11章 生存分析ノンパラメトリックのゴール
# ・ノンパラメトリック推定法の基本概念を理解する
# ・survfit関数の3つの異なる推定法を知る
# ・survfit関数の3つの異なる信頼区間を知る
# ・生存関数の検定方法を知る
# ・パッケージsurvivalを使って、Rで実装できるようになる


# ●11-2 ノンパラメトリックモデル
# ●11-2-1 ノンパラメトリックモデルの推定法
# ノンパラメトリックの推定方法とは、確率分布を仮定せずに生存時間を推定する方法で、
# 経験分布による推定法とハザード関数による推定法がある。

# (1) 経験分布による推定法
# 打ち切りがない完全データであれば、収集データに基づいた累積分布関数、
# つまり、経験分布関数F(t)を用いて推定することが出来る。

# S^(t) = 1 - F(t)

# これは後述するカプラン-マイヤー(Kaplan-Meier)推定法の特殊ケースである。
# カプラン-マイヤー推定法は、条件付き確率の考え方に基づき、次のように定義される。

# S^(t) = Π ti < t (1 - di / ri)

# ここで、diは時点tiの死亡数、riは時点tiの直前までイベントが生じる可能性のある観察対象者の数(リスクセット)である。


# (2) ハザード関数による推定法
# カプラン-マイヤー推定量を用いて、累積ハザード関数を推定することが出来る。
# 累積ハザード関数及びその推定量はそれぞれ

# H(t) = -log S(t), H^(t) = -log S^(t) である。

# カプラン-マイヤー推定量から求めたハザードの推定量
# H^(t) = Σ ti <= t di / ri をネルソン(Nelson)推定量、あるいはネルソン-アーラン(Nelson-Aalen)推定量と呼ぶ。
# これは小サンプルに有効であると言われている。ネルソン推定量を修正した

# H(t) = Σ ti <= t di - 1 Σ k = 0 1 / ri - k'
# S^(t) = exp {- H^(t)} をフレミング-ハリントン(Fleming-Harrington)推定量と呼ぶ。


# ●11-2-2 survfit関数
# パッケージsurvivalには、ノンパラメトリック法による生存時間を当てはめるsurvfit関数がある。
# survfit関数のシンタックスは以下の通り。

# survfit(formula, data, type = ' ', ...)

# 引数formulaでは、次に示す例のようにSurvオブジェクト形式の目的変数と説明変数を指定する。
# 引数typeでは、用いる推定量を指定する。survfit関数には3種類の推定方法が用意されている。
# デフォルトに設定されているカプラン-マイヤー推定法の他にフレミング-ハリントン推定法、fh2推定法がある。
# 次にデータgehanの生存時間timeを目的変数、投薬したか否かのデータを記録したtreat列を説明変数としてsurvfit関数の
# 使用例を示す。その他の引数は、デフォルトの値を使った。

ge.sf <- survfit(Surv(time, cens)~treat, data = gehan)
ge.sf

# このようにデータgehanにおける投薬郡と対照郡ごとの標本数、イベントの件数、中央値、両側の区間推定に関する情報が返される。
# summary関数で、各標本の生存時間time、リスクセットn.risk、イベントの数n.event、
# 推定された生存確率survival、標準誤差std.err、95%信頼区間の上下限値を呼び出すことが出来る。

summary(ge.sf)

# 次のようにplot関数を使うと生存確率の推定値のプロットを返す。

plot(ge.sf, lty = 1:2)
legend(locator(1), c('6-MP投与郡', '対照郡'), lty = c(1, 2))

# 次にgehanの投薬郡のみのデータについて、カプラン-マイヤー法による生存曲線と90%の信頼区間を示す作図例と結果を示す。

ge2 <- subset(gehan, treat == '6-MP')
ge2.s <- survfit(Surv(time, cens)~treat, conf.int = .9, data = ge2)
plot(ge2.s, mark.t = F)
legend(locator(1), lty = c(1, 2), legend = c('生存曲線', '90%信頼区間'))

# カプラン-マイヤー推定量は漸近的に正規分布に従うことが知られており、
# 標準偏差は、次の式を用いて推定することが出来る。
# S^(t){Σ ti <= t di / ri(ri - di)}1/2

# ネルソン推定量の標準偏差は次の式で求める。
# {Σ ti <= t di / ri(ri - di)}1/2

# survfit関数には、信頼区間を推定する方法を指定する引数conf.typeがある。
# 引数conf.typeは、'none', 'log', 'log-log',の中から一つ選択出来る。
# デフォルトは'log'になっている。'none'の場合は、信頼区間を返さない。
# それぞれのconf.typeは次の式で返される。

# 'plain':      S^+- z1-α/2se(S^)
# 'log':        exp[log S^ +- z1-α/2se(H^)]
# 'log-log':    exp{-exp[log H^ +- z1-α/2se(log H^)]}

# ここでS^は生存関数の推定値S^(t)、H^はハザード関数の推定値H^(t)、seは標準誤差を示す。

# 'plain'と'log'で求めた信頼区間の上限値は1を越える場合があるが、その時には1を越える部分は切り捨てる。
# 'log-log'による計算結果は1以内に収まる。
# 次にデータge2の3種類の('plain', 'log', 'log-log')のconf.typeの信頼区間を求めて図にする例を結果を以下に示す。

plot(ge2.s, conf.int = TRUE, mark.t = F)
lines(survfit(Surv(time, cens)~treat, data = ge2, conf.type = 'plain'), mark.t = F,
      conf.int = TRUE, lty = 3, col = 3)
lines(survfit(Surv(time, cens)~treat, data = ge2, conf.type = 'log-log'),
      mark.t = F, conf.int = TRUE, lty = 4, col = 4)
legend(locator(1), c('log', 'plain', 'log-log'), lty = c(1, 3, 4), col = c(1, 3, 4))

# survfit関数には、信頼区間を指定する引数conf.intがあり、デフォルトはconf.int = .95(95%の信頼区間)になっている。
# 引数conf.intの値は、自由に指定することが出来る。

# survfit関数における引数typeにfleming-harrington(fhと略す)、あるいはfh2を指定すると、
# フレミング-ハリントン推定量を返す。
# 異なる推定法の結果を考察する際に必要となる生存曲線のプロットを作成する例を次に示し、
# 結果を図示する。

ge2.s <- survfit(Surv(time, cens)~treat, data = ge2)
ge2.fh <- survfit(Surv(time, cens)~treat, data = ge2, type = 'fleming-harrington')
ge2.fh2 <- survfit(Surv(time, cens)~treat, data = ge2, type = 'fh2')

plot(ge2.s, conf.int = F, mark.t = F)
lines(ge2.fh, lty = 2)
lines(ge2.fh, lty = 3, col = 2)
legend(locator(1), lty = 1:3, legend = c('Kaplan-Meier', 'Fleming-Harrington', 'fh2'))


# ●11-2-3 生存関数の検定
# データgehanのような2郡(投薬郡, 対照郡など)以上の観測値が得られ時には、
# 郡ごとの生存曲線の間の差の有意性について検定を必要とする場合がある。
# 最も広く使われている検定方法は、ログ・ランク(log-rank)検定法である。
# ログ・ランク検定法は、郡ごとのイベント有りと無しに集計したクロス表のカイ2乗値の推定値を検定等計量とする。

# パッケージsurvivalには、検定行う関数survdiff関数が用意されている。
# survdiff関数は、G-rhoファミリの検定を行う。
# 引数rho = 0にすると、ログ・ランク検定、rho = 1にすると、
# ゲーハン-ウィルコクソン(Gehan-Wilcoxon)検定を行う。
# デフォルトはrho = 0が設定されている。以下にデータgehanの生存曲線のログ・ランク検定の例を示す。

survdiff(Surv(time)~treat, data = gehan)

# ログ・ランク検定のp値は約0.003であるので、仮に通常よく用いられている有意水準5%を基準とすると、
# 両郡(投薬郡と対照郡)の生存曲線には有意な差が認められる。


# 以上