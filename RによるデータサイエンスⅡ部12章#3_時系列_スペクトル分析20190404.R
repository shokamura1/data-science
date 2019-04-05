# 2019年4月4日 『Rによるデータサイエンス』 Ⅱ部 12章3篇　時系列　スペクトル分析

# 『Rによるデータサイエンス』Ⅱ部 12章3篇　スペクトル分析
# ●12章3篇の構成
# 12-3 スペクトル分析

# ●12章3篇 時系列　スペクトル分析のゴール
# ・スペクトル分析の概念を理解する
# ・スペクトル分析をRで実装出来るようになる

# ●12-3 スペクトル分析
# 時系列データには、いくつかの成分が混合しているものと考えられる。
# 例えば、トレンド、周期的に変動する成分、ノイズなどである。
# 時系列分析では、周期成分の有無や各成分の強さなどを分析する必要がある。
# 時系列データに隠されている周期性を解析する方法として、スペクトル分析(スペクトル解析とも)がある。
# 時系列における自己共分散Ckのフーリエ変換(Fourier transform)が可能である時、
# 周波数- 1/2 <= f <= 1/2上で定義される関数

# p(f) = +∞ Σ -∞ Cke -2πikf = C0 + s +∞ Σ k=1 Ck cos 2πkf

# をパワースペクトル密度関数(power spectral density function)、略してスペクトラム(spectrum)と呼ぶ。
# また、次の式のように、上記のパワースペクトル密度関数におけるCkに代わって、
# 標本データY1, Y2, ... Ynの自己共分散C^kを用いて定義したものをピリオドグラム(Periodogram)と呼ぶ。

# pj = C^0 + 2 n-1 Σ k=1 C^k cos 2πkfj

# ただし周波数はfj = j/n, j = 0, 1, ..., n/2である。
# ピリオドグラムはスペクトル密度を推定する1つのツールとして知られている。
# パッケージstatsには、ピリオドグラムを用いてスペクトル密度関数を推定するspec.pgram関数が用意されている。
# spec.pgram関数は、FFT(Fast Fourier Transform)でピリオドグラムを求め、対数軸(縦軸)のグラフを作成する。

# spec.pgram関数では、引数spansを用いて修正Daniell平滑化を行うことが可能である。
# 次にspec.pgram関数によるデータUKgas、ldeathsのピリオドグラムと平滑化の例を示す。
# 尚、グラフ表示に当たって、RStudioのグラフエリアが狭いと、
# 'figure margin too large'のエラーが出るため、その際は、RStudioのグラフエリアを拡大することで
# 解決することが出来る。

op <- par(mfrow = c(2, 2), mar = c(5, 4, 4, 2))
spec.pgram(UKgas)
spec.pgram(UKgas, spans = c(3, 3))
spec.pgram(ldeaths)
spec.pgram(ldeaths, spans = c(3, 3)); par(op)

# spec.pgram関数によるピリオドグラムのプロットにおける右側の縦のバーは、
# 95%信頼区間を示す。spec.pgram関数の引数spansに使うパラメーターは移動平均の長さで
# 奇数にする必要がある。

# パッケージstatsには、スペクトルを求めるspectrum関数がある。
# spectrum関数は、spec.pgram関数とspec.arを統合したもので、
# デフォルトには、spec.pgramが設定されている。(method = 'pgram')
# spec.ar関数は、自己回帰によるスペクトラル分析の関数である。
# 以下にデータUKgas、ldeathsを使った自己回帰によるspectrum関数の利用例を示す。

op <- par(mfrow = c(1, 2))
spectrum(UKgas, method = 'ar')
spectrum(ldeaths, method = 'ar'); par(op)


# 以上