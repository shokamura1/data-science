# 4月1日 『DataScience Using R』 Day5

# ■前回までのあらすじ
# 『DataScience Using R』Day5のRコードです。
# 以前にアップしたテキスト・ファイルよりも今回のRファイルの方が正確です。
# コーディングには、以下をご参照ください。

# ●Day5の構成
# ・miceパッケージを使っての欠損値の特定
# ・オブジェクトの削除
# ・ラベリング(Binning)とカテゴリー変数の作成
# ・ifelse関数
# ・データの結合
# - Merge関数の構文
# - dplyrパッケージを使う場合

#・データの追加(Appending)
# - cbind()関数
# - rbind()関数

# ・paste関数

# ・グループ毎の集計
# - dplyrパッケージを使った場合

# ・パイプ機能
# ・カラム(列)の削除

# ・ファクター
# ・カテゴリー変数
# - 数値の文字列型データから数値型データへの変換
# - 数値の要因型データのベクトルは、数値型データに変換する時の注意点
# - factor関数、ordered関数を使ってのカテゴリー変数への変換


# ●Day5のゴール
# ・外れ値と欠損値の扱い方を習得する
# ・オブジェクトの削除、ラベリング(Binning)とカテゴリー変数の作成、ifelse関数を習得する
# ・データの結合、データの追加、パイプ機能を習得する
# ・ファクターの概念を理解する
# ・カテゴリー変数、特に変数間に順序の有る無しを理解する


# ●外部データのインポート

library(readr)
# readrパッケージをロードする

stores <- read_csv("C:/Users/sho-kamura/Desktop/トレーニング/AnalytiXLab/DataScience Using R/#7Data/stores.csv")
# 変数storesに、C:/Users/sho-kamura/Desktop/トレーニング/AnalytiXLab/DataScience Using R/#7Data/に置かれているstores.csvファイルを読み込み、代入する

View(stores)
# 変数storesをビューする


# ●miceパッケージを使って、NA(欠損値)を置換する

install.packages("mice")
# パッケージmiceをインストールする

library(mice)
# パッケージmiceをロードする

s <- mice(data = stores, m = 2, method = "pmm", maxit = 5, seed = 500)
# miceパッケージを使う
# 変数storesをデータセットとして使用、pmm(平均予測マッチング)で置換、5回の反復回数、500から開始する
# 変数sに代入する


# ●miceパッケージで使われている引数の意味は以下の通り
# ・m
# mは2種類の置換の可能性があることを表す
# つまり、欠損値に対して、置換できる値が2つあることを示す

# ・maxit
# maxitは、アルゴリズムが欠損値を置換する値を計算するのに必要な反復(ループ)回数を示す

# ・method
# methodは、置換が行われる方法を示す

# pmmは、Predictive Mean Matchingの略で、予測平均マッチングを表す
# logregは、Logistic Regressionの略で、ロジステック回帰を表す

# 上記以外の詳細を調べたい場合は、?mice()で調べることが可能

ImputedValues <- s$imp
# 変数ImputedValuesに、変数sのimp列を代入する

completeData <- complete(s,2)
# 変数completeDataに、変数sに置換候補2に置換して、代入する
# 欠損値の置換候補が2つある為、complete関数を使うことで、欠損値を置換することがで居る


# ●オブジェクトの削除
# rm関数を使うことで、オブジェクトを削除することが出来る
# rmは、removeのrmと覚える

rm(s)
# 変数sを削除する


# ●ビニングとカテゴリー作成
# 継続型変数の範囲を任意に定義することが出来る
# 例えば100以下は'Low'、100～200は'Mid'、200～300は'High'等、任意の範囲で定義出来る

# 変数storesのTotalSales列を対象に新たなカテゴリー列を追加する
# 変数storesのTotalSales列の値を以下の基準で'Low', 'Mid', 'High', 'VeryHigh'の4カテゴリーに分類する
# 追加する新たな列はPerformanceCat(パフォーマンス分類)と名づける


# ●TotalSales列の値に基づくPerformanceCat列の分類基準
# TotalSales < 100 - "Low"
# TotalSales列の値が100より小さい時は'Low'と定義する

# TotalSales >= 100 and < 200 - 'Mid'
# TotalSales列の値が100以上、200未満の時は'Mid'と定義する

# TotalSales = 200-300 - 'High'
# TotalSales列の値が200～300の間の場合は'High'と定義する

# TotalSales > 300 - 'VeryHigh'
# TotalSales列の値が300より大きい場合は'VeryHigh'と定義する


# ●上記の分類基準を元にRコードで実装
stores$PerformanceCat <- 'Low'
# 変数storesのPerformanceCat列に'Low'を代入する

stores$PerformanceCat[stores$TotalSales >=100 & stores$TotalSales <200] <- 'Mid'
# 変数storesのTotalSales列が100以上で、200未満の場合は、PerformanceCat列に'Mid'を代入する
# []内で'Mid'の分類基準を定義する

stores$PerformanceCat[stores$TotalSales >=200 & stores$TotalSales <300] <- 'High'
# 変数storesのTotalSales列が200以上で、300未満の場合は、PerformanceCat列に'High'を代入する

stores$PerformanceCat[stores$TotalSales >=300] <- 'Very High'
# 変数storesのTotalSales列が300以上の場合は、PerformanceCat列に'very High'を代入する

stores$PerformanceCat[is.na(stores$TotalSales)] <- 'NA'
# 変数storesのTotalSales列が欠損値の場合は、PerformanceCat列に'NA'を代入する

# ●ifelse文
# ifelse構文は、ifelse(条件, <真の値>, <偽の値>)となる
# ifelse文を使うことで条件判定をすることが出来、更に条件分岐に応じて値を変数に格納することも出来る

x <- -10
# 変数xに-10を代入する

ifelse(x > 0,'positive','negative')
# 変数xが0より大きい場合は、'positive'を返し、そうでない場合は'negative'を返す
# このifelse文では、変数xは-10のため、0より小さいため、'negative'が返る

stores$PC <- ifelse(stores$TotalSales < 100, 'Low', 'High')
# 変数storesのPC列に、TotalSales列が100より小さい場合は'Low'を返し、そうでない場合は'High'を返す
# ifelse文で条件分岐させて、変数に値を代入させることも可能である


# ●ネスト化したifelse文
# ifelse文内にifelse文を書き、ネスト化することも出来る

ifelse(x == 0, 'zero',ifelse(x > 0, 'positive','negative'))
# 変数xが0と等しい場合は、'zero'を返し、
# 変数xが0より大きい場合は、'positive'を返し、そうでない場合は'negative'を返す


# ●ifelse文を使ってTotalSales列の値を元に'Low','Mid','High'をPerformanceCat列に代入する
# 先の分類基準を元に、ifelse文を使って実装すると下記のようになる

stores$PC <- ifelse(stores$TotalSales < 100,'Low',
# 変数storesのTotalSales列が100より小さい場合は'Low'をPC列に代入する
      
      ifelse(stores$TotalSales <= 200,'Mid',
      # 変数storesのTotalSales列が200以下の場合は'Mid'をPC列に代入する
      
          ifelse(stores$TotalSales <= 300,'High','Very High')))
          # 変数storesのTotalSales列が300以下の場合は'High'を、それ以外の場合は'Very High'をPC列に代入する

res1 <- stores[c('TotalSales','PC')]
# 変数res1に、変数storesのTotalSales列とPC列を代入する

res1$PC <- as.factor(res1$PC)
# 変数res1のPC列に、同列を要因型(ファクター)変数に変換して代入する

summary(res1$PC)
# 変数res1のPC列を要約して出力する

# ■データの結合
# データの結合は、他のテーブルからカラム(列)を追加することを指す
# Excelのvlookup関数に相当する機能になる

# ●Merge関数
# Merge関数の構文は、merge(x = テーブル名1, y = テーブル名2, by.x = テーブル名1のカラム(列), by.y= テーブル名2のカラム(列) all)となる

# ・Inner Join
# Inner Joinは、二つのテーブル内で共通する行だけを結合する
# Merge関数のデフォルト結合はInner Joinになる


# ・Full Join
# Full Joinは、二つのテーブルの全ての行を結合する
# 引数all = Trueに設定するとFull Joinになる

# ・Left Join
# Left Joinは、二つのテーブルの一つ目のテーブルの全データを取り出し、
# 二つ目のテーブル内で一つ目のテーブルと共通した行だけを結合する
# 引数all.x = Trueに設定するとLeft Joinになる

# ・Right Join
# Right Joinは、二つのテーブルの二つ目のテーブルの全データを取り出し、
# 一つ目のテーブル内で二つ目のテーブルと共通した行だけを結合する
# 引数all.y = Trueに設定するとRight Joinになる


# ●JOINを使ってのテーブル結合
# JOINを使って二つの異なるテーブルを結合することが出来る

# ・二つの異なるテーブルで、共通列の名前が同じ場合
# 例えば、二つの異なるテーブルに共通の列CustomerIDがあった場合、by = "CustomerID"と指定することで、共通列を指定できる

# ・二つの異なるテーブルで、共通列の名前が異なる場合
# 二つのテーブル間で、共通列の名前が異なる場合は、by.x = "CustomerID", by.y = "CustID"と指定する


# ●データのインポート

library(readr)
# readrパッケージをロードする

demographic <- read_csv("C:/Users/sho-kamura/Desktop/トレーニング/AnalytiXLab/DataScience Using R/#7Data/Demographic_Data_Class4.csv")
# "C:/Users/sho-kamura/Desktop/トレーニング/AnalytiXLab/DataScience Using R/#7Data/パス上にある
# Demographic_Data_Class4のCSVファイルを、変数Demographic_Data_Class4に代入する

View(demographic)
# 変数Demographicをビューする

library(readr)
# readrパッケージをロードする

txn <- read_csv("C:/Users/sho-kamura/Desktop/トレーニング/AnalytiXLab/DataScience Using R/#7Data/Transaction_Summary _Class4.csv")
# "C:/Users/sho-kamura/Desktop/トレーニング/AnalytiXLab/DataScience Using R/#7Data/パス上にある
# Transaction_Summary_Class4のCSVファイルを、変数Transaction_Summary_Class4に代入する

View(txn)
# 変数txnをビューする


# ●InnerJoinでのテーブル結合
InnerJoin <- merge(x = demographic, y = txn,
# ファイルdemographicとtxnをマージする
                   by.x = "CustName", by.y = "CustomerName")
                    # demographicのCustName列とtxnのCustomerName列を共通列に指定し、変数InnerJoinに代入する

View(InnerJoin)
# 変数InnerJoinをビューする

# ●FullJoinでのテーブル結合
FullJoin <- merge(x = demographic, y = txn,
# ファイルdemographicとtxnをマージする
                  by.x = "CustName",by.y = "CustomerName",all = TRUE)
                  # demographicのCustName列とtxnのCustomerName列を共通列に指定し、Full Joinで結合し、変数FullJoinに代入する

View(FullJoin)
# 変数FullJoinをビューする


# ●LeftJoinでのテーブル結合
LeftJoin <- merge(x = demographic, y = txn,
# ファイルdemographicとtxnをマージする
                  by.x = "CustName",by.y = "CustomerName",all.x = TRUE)
                  # demographicのCustName列とtxnのCustomerName列を共通列に指定し、Left Joinで結合して、変数FullJoinに代入する

View(LeftJoin)
# 変数LeftJoinをビューする


# ●RightJoinでのテーブル結合
RightJoin <- merge(x = demographic, y = txn,
# ファイルdemographicとtxnをマージする
                   by.x = "CustName",by.y = "CustomerName",all.y = TRUE)
                    # demographicのCustName列とtxnのCustomerName列を共通列に指定し、Right Joinで結合して、変数FullJoinに代入する

View(RightJoin)
# 変数RightJoinをビューする


# ●dplyrパッケージを使っての結合
# Base RのMerge関数と合わせて、dplyrパッケージを使っても結合が出来る
# ただし、Joinの種類が一部、Merge関数と異なるので注意が必要になる

# dplyrパッケージを使った構文は、下記の通り

# dplyr::jointype(x,y,by=)

# jointypeでinner_join、left_join、right_join、semi_join、anti_joinなどJoinの種類を指定する
# xで一つ目のテーブルを指定し、yで二つ目のテーブルを指定する
# by=で一つ目と二つ目のテーブルでの共通列名を=でつないで指定する

library(dplyr)
# dplyrパッケージをロードする

# ●dplyrパッケージを使ったInnerJoinでのテーブル結合

IJ <- dplyr::inner_join(demographic,txn,by=c("CustName"="CustomerName"))
# dplyrパッケージを使って、demographicとtxnをInnerJoinで結合する

# demographicファイルのCustName列とtxnファイルのCustomerName列を共通列に指定し、変数IJに代入する
# 変数IJはInnerJoinの略である

View(IJ)
# 変数IJをビューする


# ●dplyrパッケージを使ったLeftJoinでのテーブル結合

LJ <- dplyr::left_join(demographic,txn,by= c("CustName"="CustomerName"))
# dplyrパッケージを使って、demographicとtxnをLeftJoinで結合する

# demographicファイルのCustName列とtxnファイルのCustomerName列を共通列に指定し、変数LJに代入する
# 変数LJはLeftJoinの略である

View(LJ)
# 変数LJをビューする


# ●dplyrパッケージを使ったRightJoinでのテーブル結合

RJ <- dplyr::right_join(demographic,txn,by= c("CustName"="CustomerName"))
# dplyrパッケージを使って、demographicとtxnをRightJoinで結合する
# demographicファイルのCustName列とtxnファイルのCustomerName列を共通列に指定し、変数RJに代入する
# 変数RJはRightJoinの略である

View(RJ)
# 変数RJをビューする


# ●dplyrパッケージを使ったSemiJoinでのテーブル結合
# SemiJoinは、InnerJoinと同様に二つのテーブルの共通した行を返す
# しかし、カラム(列)は、一つ目のテーブルの列だけを返す

SJ <- dplyr::semi_join(demographic,txn,by= c("CustName"="CustomerName"))
# dplyrパッケージを使って、demographicとtxnをSemiJoinで結合する
# demographicファイルのCustName列とtxnファイルのCustomerName列を共通列に指定し、変数SJに代入する
# 変数SJはSemiJoinの略である

View(SJ)
# 変数SJをビューする

summary(demographic$CustName)
# demographicファイルのCustName列の要約を出力する

summary(txn$CustomerName)
# txnファイルのCustmerName列の要約を出力する


# ●dplyrパッケージを使ったAntiJoinでのテーブル結合
# AntiJoinは、LeftJoinと同様に二つのテーブルの一つ目のテーブルの全データを取り出し、
# 二つ目のテーブル内で一つ目のテーブルと共通した行だけを結合する
# しかし、カラム(列)は、一つ目のテーブルの列だけを返す

AJ <- dplyr::anti_join(demographic,txn,by= c("CustName"="CustomerName"))
# dplyrパッケージを使って、demographicとtxnをAntiJoinで結合する
# demographicファイルのCustName列とtxnファイルのCustomerName列を共通列に指定し、変数AJに代入する
# 変数AJはAntiJoinの略である

View(AJ)
# 変数AJをビューする


# ●バインディングとペースティング
# バインディングとペースティングは、アペンディングとは異なるので注意が必要
# バインディングは、rbind関数とcbind関数を使う

# Same no of columns and With same column names
rbind() # row bind
# rbind関数は、行方向に変数をまとめる
# rbind関数は、二つのテーブルのロウ(行)数が同じ必要がある

# Same no of rows
cbind()
# cbind関数は、列方向に変数をまとめる
# cbind関数は、二つのテーブルのカラム(列)数が同じ必要がある


v1 <- c(1,2,3)
# 変数v1にベクトル型で1,2,3を代入する

v2 <- c('A','B','C')
# 変数v2にベクトル型で'A','B','C'を代入する

v3 <- c('D','E','F')
# 変数v3にベクトル型で'D','E','F'を代入する

v4 <- c(4,'A','D')
# 変数v4にベクトル型で4,'A','D'を代入する

v5 <- c(1,2,3)
# 変数v5にベクトル型で1,2,3を代入する

df <- data.frame(v1,v2)
# 変数dfにデータ・フレーム型で変数v1(格納されている値は1,2,3)と変数v2(格納されている値は'A','B','C')を代入する

df2 <- data.frame(v5)
# 変数df2にデータ・フレーム型で変数v5(格納されている値は1,2,3)を代入する

r1 <- cbind(df,v3)
# 変数r1に変数dfと変数v3をcbind関数を使って、列方向(縦方向)に並べてまとめて、代入する
# 実行するとデータ・フレーム型変数dfに格納されたベクトル型変数v1とv2、v3が縦方向に並び、まとめられる

r1
# 変数r1を出力する

r2 <- rbind(df,v4)
# 変数r2に変数dfと変数v4をrbind関数を使って、行方向(横方向)に並べてまとめて、代入する

r2
# 変数r2を出力する

r3 <- rbind(df,df2)
# 変数r3に変数dfと変数df2をrbind関数を使って、行方向(横方向)に並べてまとめて、代入する
# 実行するとエラーが返る


# ●Paste関数
# Paste関数を使うと、二つの変数の値を区切り文字で結合することが出来る

a <- c("a","b","c")
# 変数aにベクトル型変数で"a","b","c"を代入する

b <- c("y","w","q")
# 変数bにベクトル型変数で"y","w","q"を代入する

paste(a,b,sep = "_")
# paste関数を使って、変数aと変数bを_(アンダーバー)を使って、結合する
# このコードの出力結果は、"a_y" "b_w" "c_q"となる


# ●グループ毎の集計
# グループ毎の集計を行うことでExcelのピボット・テーブル集計が可能になる
# Rでのグループ毎の集計には二つの方法がある

# 1つめはBase RのGroup By関数を使う方法
# もう一つはdplyrパッケージを使う方法である
# ここではdplyrパッケージを使う方法を紹介する

# ●dplyrパッケージを使う方法
# dplyrパッケージを使う場合は、以下の構文になる
# dplyr - group_by() + summarise() or mutate()

t <- dplyr::group_by(stores, Location)
# 変数tに、dplyrパッケージを使って、変数storesのLocation列でグループ化する

t
# 変数tを出力する

Result <- dplyr::summarise(t, SumOfTotalSales = sum(TotalSales))
# 変数Resultに、dplyrパッケージを使って、変数tを要約する
# 変数TotalSalesの合計値をSumOfTotalSalesに代入する

Result2 <- dplyr::mutate(t, SumOfTotalSales = sum(TotalSales))
# 変数Result2に、dplyrパッケージを使って、変数tに追加する
# 変数TotalSalesの合計値をSumOfTotalSalesに代入する


# ●%>%(パイプ)機能
# %>%(パイプ)機能を使うと、Rのコードをつなぐことが出来る

library(dplyr)
# dplyrパッケージをロードする

res3 <- dplyr::group_by(stores,Location) %>% dplyr::summarise(sumofTotalSales = sum(TotalSales))
# 変数res3にdplyrパッケージを使って、変数storesのLocation列をグループ化する
# パイプ機能でつなぐ
# dplyrパッケージを使って、変数storesのTotalSales列を合計して、sumofTotalSales列として要約する
# 上記を変数res3に代入する

# 上記のコードを実行すると、Location(Chennai, Delhi, Kolkata, Mumbai)ごとのTotalSalesの合計を集計することが出来る

View(res3)
# 変数res3をビューする

Res <- stores %>% dplyr::group_by(Location, StoreType) %>%
  # 変数resに変数storesを代入する
  # パイプ機能でつなぐ
  # dplyrパッケージを使って、Location列とStoreType列をグループ化する
  # パイプ機能でつなぐ
  dplyr::summarise(SumOfTotalSales = sum(TotalSales), AvgofOC = mean(OperatingCost))
  # dplyrパッケージを使って、変数storesのTotalSales列を合計して、sumofTotalSales列として要約する
  # dplyrパッケージを使って、変数storesのOperatingCost列の平均を、AvgofOC列として要約する
  

# ●dplyrパッケージを使ったカラム(列)の削除
# dplyrパッケージを使い、カラム(列)削除を行うことも出来る
# mutate関数とNULLを使う

c <- stores %>% dplyr::mutate(StoreCode = NULL)
# 変数cに変数storesを代入する
# パイプ機能でつなぐ
# dplyrパッケージを使い、StoreCode列を削除する


# ●要因型変数(ファクター)
# 文字列型の変数で、データ例として性別、方向、都市名などが挙げられる
# Rにおいてファクターは、1からn番目まで昇順で数値が振られ数値型データとして保存される
# 全てのレベルは、アルファベット順で保存される

class(stores$StoreType)
# 変数storesのStoreType列のデータ型を返す

summary(stores$StoreType)
# 変数storesのStoreType列の要約を返す

f <- as.numeric(stores$StoreType) 
# 変数fに、変数storesのStoreType列を数値型データに変換して代入する
# as.numeric関数は、変数のデータ型を数値型に変換する


# ●文字列型データを要因型データに変換せず、文字列型データのままインポートする
# read.csv関数のパス指定直後に,stringsAsFactors = FALSEの引数を設定することで、
# 文字列型データを要因型データに変換せず、そのまま文字列型データとしてインポート出来るようになる

library(readr)
# readrパッケージをロードする

stores2 <- read.csv("C:/Users/sho-kamura/Desktop/トレーニング/AnalytiXLab/DataScience Using R/#7Data/stores.csv",stringsAsFactors = FALSE)
# 変数stores2に、C:/Users/sho-kamura/Desktop/トレーニング/AnalytiXLab/DataScience Using R/#7Data/に置かれているstores.csvファイルを読み込み、代入する
# stringsAsFactors = FALSEの引数を設定することで、文字列型データを要因型データに変換されなくなる


# ●数値の文字列型データのベクトルは、簡単に数値型データに変換出来る
# 文字列型データを数値型データに変換するには、as.numeric関数を使う

c1 <- c("45","66","34","66","45","34","56","45","66")
# 変数c1に、文字列型データのベクトルで"45","66","34","66","45","34","56","45","66"を代入する
# ここでは、数値を""(ダブル・クオテーション)で囲い、数値型データとしてではなく、文字列型データとして扱っている

class(c1)
# 変数c1のデータ型を出力する
# 上記の通り、数値を""(ダブル・クオテーション)で囲っているため、データ型は文字列型になる

as.numeric(c1)
# 変数c1のデータ型を数値型データに変換する

# ●数値の要因型データのベクトルは、数値型データに変換するとレベル・インデックスが返される
# 実際の値ではないので、注意が必要

f1 <- c("45","66","34","66","45","34","56","45","66")
# 変数f1に、文字列型データのベクトルで"45","66","34","66","45","34","56","45","66"を代入する

f1 <- as.factor(f1)
# 変数f1に、変数f1を要因方データに変換して、代入する

f1
# 変数f1を出力する

as.numeric(f1)
# 変数f1を数値型データに変換する
# 数値型データに変換すると、1～nの数値に変換されるが、これは間違いになる


# ●数値の要因型データのベクトルは、まず文字列型データに変換し、それから数値型に変換する
# 要因型データをそのまま数値型データに変換するとエラーになるが、一度、文字列型データに変換してから、
# 数値型データに変換することで、エラーを避けることが出来る

as.numeric(as.character(f1))
# 変数f1を文字列型データに変換し、数値型データに変換する


# ●factor関数、ordered関数を使ってのカテゴリー変数への変換
# 例えば、変数v1は1, 2, 3としてコーディングされている
# 1を赤、2を青、3を緑にしたい
# こういった場合、factor関数、ordered関数を使うことで、1,2,3といった数値型データに赤, 青, 黄色といったラベルを付けることが出来る

# カテゴリー・データには、factor関数を使い、順序を示すデータにはordered関数を使う
# カテゴリー・データは、赤、青、黄などで順序関係がないデータを指す
# 順序を示すデータは、高、中、低の順序関係があるデータを指す


# ●factor関数を使って数値型データをカテゴリー・データに変換する
v1 <- c(11,22,33,11)
# 変数v1にベクトル型変数で11,22,33,11を代入する

v1 <- factor(v1,levels = c(1,2,3),labels = c("red", "blue", "green"))
# 変数v1のレベルを1, 2, 3に設定し、ラベル"red", "blue", "green"を設定して、変数v1に代入する


# ●ordered関数を使って数値型データを順序関係のあるデータに変換する
v2 <- c(1,2,3,2)
# 変数v2にベクトル型変数で1,2,3,2を代入する

v2 <- ordered(v2,levels = c(1,2,3), labels = c("Low", "Medium", "High"))
# 変数v2にレベルを1, 2, 3の順番に設定し、ラベル"Low", "Medium", "High"を設定し、変数v2に代入する

v2 <- ordered(v2, labels = c("Low", "Medium", "High"))
# 変数v2にレベルを1, 2, 3の順番に設定し、ラベル"Low", "Medium", "High"を設定し、変数v2に代入する

v2[v2>2]
# 2より大きい変数v2を出力する

v2[v2>'Low']
# 'Low'より大きい変数v2を出力する

class(v2)
# 変数v2のデータ型を出力する

as.numeric(v2)
# 変数v2を数値型データに変換する


# ■所感
# ・ぎっしり600行。グッタリンコ。
# ・基礎的なRコーディングの勘所は大分、身に付いてきた
# ・意味不明なエラーに悩まされることなく、サクサクしています


# 以上