# 2019年4月6日 『Rによるデータサイエンス』 Ⅱ部 12章6篇　時系列　ARMA/ARIMAモデル

# 『Rによるデータサイエンス』Ⅱ部 12章6篇　ARMA/ARIMAモデル
# ●12章6篇の構成
# 12-6 ARMA/ARIMAモデル
#  12-6-1 ARMA/ARIMAモデルとは
#  12-6-2 arima関数とモデルの推定
#  12-6-3 モデルの選択

# ●12章6篇 時系列　ARMA/ARIMAモデルのゴール
# ・ARMA/ARIMAモデルの基本概念を理解する
# ・arima関数を使って、モデルの推定ができるようになる
# ・モデルの選択ができるようになる


# ●12-6 ARMA/ARIMAモデル
# ●12-6-1 ARMA/ARIMAモデルとは
# 自己回帰モデルp Σ i = 1 aiYt - i + etに誤差の移動平均q Σ j = 1 bjet - jを加えたモデル

# Yt = p Σ i = 1 aiYt - i + et + q Σ j = 1 bjet - j

# を自己回帰移動平均(ARMA: AutoRegressive Moving Average)モデルと呼び
# 通常、ARMA(p, q)で表す。定義式から分かるように、ARモデルはARMAモデルの特殊なケースである。

# Ytのd階の差分演算子Δd YtのARMAモデルを、自己回帰和分移動平均(ARIMA: AUtoRegressive Integrated Moving Average)モデルと呼び、
# ARIMA(p, d, q)で表す。
# ARIMAモデルは、1960年代末にボックス(Box)とジェンキンス(Jenkins)によって提案されていることから、
# 彼らの名前を冠してボックス-ジェンキンス(Box-Jenkins)法とも呼ばれている。


# ●12-6-2 arima関数とモデルの推定
# パッケージstatsには、単変量時系列データを当てはめるARIMAモデル関数arima関数が用意されている。
# 以下に関数のシンタックスを記す。

# arima(x, order = c(0, 0, 0), ...)

# 引数xは、時系列データオブジェクトであり、orderは自己回帰の次数pｍ差分の階数d、過去の残差の移動平均の次数qを指定する引数である。
# 次にデータlhを使ったarima(2, 0, 1)の例を示す。

(lh.ari <- arima(lh, order = c(2, 0, 1)))

# 返された係数を用いたARIMA(2, 0, 1)モデルを以下に示す。
# arima関数の結果の項目は、summary関数で確認できる。

# yt = 2.3946 + 1.1765Yt - 1 - 0.5044Yt-2 - 0.5080et - 1 + et

summary(lh.ari)

# モデル評価に関連する情報として、$sigma2(残差の分散σ2)、対数尤度 $logik、AIC情報量規準、
# $aic、残差 $residualsなどが計算される。


# ●12-6-3 モデルの選択
# arima関数を用いる際、最も基本低菜問題は、引数orderのp, d, qをいくらにするかである。
# p, d, qを決める一つの方法は、ある範囲内のp, d, qの全ての組合せの中から、情報量規準(AICやBICなど)値が最も小さい
# 組合せを用いる方法である。

# 次に、データlhを使って、p, d, qを求める例として、pは1から4まで、
# dは0から1まで、qは0から4までの全ての組合せの中から最適なp, d, qを求める簡単なプログラムを示す。
# 情報量規準はAICを採用している。

library(stats)
deta <- lh; T <- 0
for(p in 1:4)
  for(d in 0:1)
    for(q in 0:4){
      fit <- arima(data, order = c(p, d, q))
      T <- T + 1
      if(T == 1){
        minaic <- fit$aic
        orderP <- p; orderD <- d; orderQ <- q;
      }else{
        if (fit$aic < minaic){
        minaic <- fit$aic;
        orderP <- p; orderD <- d; orderQ <- q;
    }
  }  
}    

# 求めたp, d, qはそれぞれ3, 0, 0で、この結果はlh.arモデルと同じである。

(fit <- arima(lh, order = c(3, 0, 0)))

# 返された結果を小数点以下3桁まで丸めたARIMA(3, 0, 0)モデルを次に示す。

# Yt = 2.395 + 0.645Yt - 1 - 0.0634Yt - 2 - 0.220Yt - 3 + et


# ARIMAモデルを診断(残差分析)するツールとして、tsdiag関数がある。
# データlhのARIMA(3, 0, 0)モデルの診断図を以下に示す。
# 診断図の上部は、残差のプロット、中部は残差の自己相関のプロット、
# 下部は引数gof.lagに対応するリュング-ボックス検定のp値のプロットである。

tsdiag(fit, gof.lag = 12)

# arima関数で求めたモデルの予測値は、predict関数を使って求めることが出来る。


# 以上