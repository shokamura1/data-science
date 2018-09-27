# 4月1日 『DataScience Using R』 Day3

# ■前回までのあらすじ
# 『DataScience Using R』Day3のRコードです。
# Rでのデータ・ハンドリングを中心に学びました。
# 前回同様、各コードの振る舞いは、コメントの通りです。
# 言わずもがな、storesやcarsといった変数名や"C:\Users\以下のディレクトリ"は、講義で使用した任意名称です。
# ご自分で実装される場合は、適宜変数名を変えてください。

# ●Day3の構成
# ・データの理解
# - str関数
# - summary関数

# - psychパッケージ
# - Hmiscパッケージ
# - その他の関数

# ・Subsetting of data
# - 列(カラム)の選択
# - 行と列の選択

# ・データセットの表示
# - head関数
# - tail関数

# ・列(カラム)のデータ型の変換
# - as.character関数

# ・値の置換
# ・列(カラム)名の変更
# - dplyrパッケージを使っての列(カラム)名の変更

# ・列(カラム)の新規追加
# - dplyrパッケージを使っての列(カラム)の新規追加

# ・列(カラム)の削除
# ・テーブルの削除
# ・列(カラム)の並び替え

# ・データ・ハンドリング
# - フィルタリング
# - 列(カラム)のフィルタリングの組み合わせ
# - subset関数
# - ソート機能
# - dplyrパッケージを使ったソート
# - 重複値の削除
# - 欠損値の置換
# - 欠損値を削除して平均を計算する
# - NA(欠損値)に平均値を代入する
# - NA(欠損値)の削除
# - 外れ値のキャッピング
# - 外れ値の特定

# ●Day3のゴール
#・データ理解に使う関数を習得する
#・データ・ハンドリング(フィルタリング、ソート、重複値|欠損値|外れ値処理)を習得する

getwd()
# ワーキング・ディレクトリを出力する

setwd("C:\Users\sho-kamura\Desktop\トレーニング\AnalytiXLab\DataScience Using R\#7Data")
# ワーキング・ディレクトリをC:\Users\sho-kamura\Desktop\トレーニング\AnalytiXLab\DataScience Using R\#7Data
# に変更する

stores <- read.csv('C:\Users\sho-kamura\Desktop\トレーニング\AnalytiXLab\DataScience Using R\#7Data\stores.csv')
# 変数storesに'C:\Users\sho-kamura\Desktop\トレーニング\AnalytiXLab\DataScience Using R\#7Data\stores.csv'のCSVファイルをインポートし、代入する

View(stores)
# 変数storesをビューする


# ■データの理解
# ●str関数
# str関数を使うと、データセットの構造を返すことが出来る

str(cars)
# 変数carsのデータ構造を表示する

str(stores)
# 変数storesのデータ構造を表示する
# str関数はデータの構造を返す

# ●summary関数
# summary関数は、データセットの全てのカラム(列)の分布(最小値/第1四分位/中央値/平均値/第3四分位/最大値)を返す
# 要因型(ファクター)データの場合は、計測数を返し、文字列型データには、文字数を返し、
# 数値型データには、基本統計量を返す

summary(cars)
# 変数carsのデータ要約を表示する

summary(stores)
# 変数storesのデータ要約を表示する

# ●psychパッケージ
# psychパッケージを使うと、データセットの基本統計量を返す

?describe
install.packages('psych')
# パッケージpsychをインストールする

library(psych)
# パッケージpsychをロードする

psych::describe(stores)
# パッケージpsychを使って、変数storesの基本統計量を返す

# ●Hmiscパッケージ
# Hmisパッケージを使うと、データセットの構造を返す
# 構造とは、データの行数、頻度、欠損値数などを返す

install.packages('Hmisc')
# パッケージHmiscをインストールする

library(Hmisc)
# パッケージHmiscをロードする

Hmisc::describe(stores)
# パッケージHmiscを使って、変数storesのデータ構造を返す

# ●その他の関数
# データ理解には、他にもnrow関数、ncol関数、colnames関数、names関数、class関数がよく使われる

nrow(stores)
# 変数storesの行数を返す
# nrow関数は、変数の行数を返す機能を持つ

ncol(stores)
# 変数storesの列数を返す
# ncol関数は、変数の列数を返す機能を持つ

dim(stores)
# 変数storesの行数・列数を返す
# dim関数は、変数の行数・列数を返す機能を持つ

colnames(stores)
# 変数storesの列名を返す
# colnames関数は、変数の列名を返す機能を持つ
# colnames関数は、データ・フレームのみを返す


names(stores) 
# 変数storesの列名を返す
# names関数も、変数の列名を返す機能を持つ
# colnames関数との違いは、names関数は、データ・フレーム以外のオブジェクトの列名も返せる点にある

class(stores$Staff_Cnt)
# 変数storesのStaff_Cnt列のデータタイプを返す
# class関数は、変数のデータ型を返す機能を持つ
# この例では、整数型(integer)が返る


# ■データの加工と抽出(subsetting)
# subset関数を使うと対象となるデータに「subset」もしくは「select」で条件を指定し、条件を満たすデータだけを取り出すことが出来る

# ●列(カラム)の選択
# データ・ハンドリングの基礎として列(カラム)の選択が挙げられる
# Base Rでは$(ドルマーク)を使うことで、列指定が出来る
# 例えば、stores$StoreNameの場合、変数storesのStoreName列を指定していることを表す

# 又、列名指定だけでなく、[1:3]と[]内に数値を:で指定することで、数値で列数を指定することも出来る
# [1:3]の例では、1～3列目を選択出来る
# [1:3, 5, 11, 14]と,で区切ることで、列を飛ばして選択することも出来る

res1 <- stores$StoreName
# 変数res1に変数storesのStoreName列を代入する
# 変数名$(ドルマーク)列名で、指定列を選択出来る

res2 <- stores[1:3]
# 変数res2に変数storesの1～3列を代入する
# []内に数値を:で指定で、連続して列を指定することが出来る

res3 <- stores[c(1:3,5,8,9)]
# 変数res3に変数storesの1,3,5,8,9列を代入する
# データセットから複数列を選択するときは、cを使う
# ,で区切って、列を飛ばして選択することも出来る

res4 <- stores[c("Location","TotalSales","OperatingCost")]
# 変数res4に変数storesのLocation, TotalSales, OperatingCost列を代入する

res5 <- stores[-5]
# 変数res5に変数storesの5列目を除いた列(カラム)を代入する
# []と-を使うことで、データセットから列(カラム)を落とすことが出来る

res5_1 <- stores[-5:-14]
# 変数res5_1に変数storesの5～14列目を除いた列(カラム)を代入する
# []と:を使うことで、落としたい列の範囲指定が出来る


# ●行と列の選択
# 列(カラム)だけでなく、行(ロウ)を指定して、選択することも出来る
# Rでは変数名[x,y]と、行,列で指定することが出来る
# 例えば、stores[1:3,2:5]の場合、変数storesの1～3行目、2～5列目を指定することになる

res6 <- stores[1:3,2:5]
# 変数res6に変数storesの1～3行目、2～5列目を代入する

res7 <- stores[1:3,c("Location","TotalSales")]
# 変数res7に変数storesの1～3行目、"Location","TotalSales"の列を代入する
# 行数と列名指定を組み合わせも可能

res8 <- stores[nrow(stores)-4,c("Location","TotalSales","OperatingCost")]
# 変数res8に変数storesの行数から4を引いた行と"Location","TotalSales","OperatingCost"の列を代入する

res9 <- stores[0:(nrow(stores)-4),c("Location","TotalSales","OperatingCost")]
# 変数res9に変数storesの0行目～最後の行から4を引いた行までと"Location","TotalSales","OperatingCost"の列を代入する

View(res9)
# 変数res9のデータをビューする


# ■データセットの表示
# Rでデータセットを表示するには、head関数、tail関数、View関数を使うことが多い
# それぞれの関数機能は以下の通り

# ●head関数
# head関数を使うと、先頭から指定した行数のデータセットを表示できる
# デフォルト(指定しない場合)は、6行が返る

head(stores,2)
# 変数storesの先頭2行のデータセットを表示する

# ●tail関数
# tail関数を使うと、末尾から指定した行数のデータセットを表示できる
# デフォルト(指定しない場合)は、6行が返る

tail(stores,3)
# 変数storesの末尾3行のデータセットを表示する

res10 <- head(stores,10)
# 変数res10に、変数storesの先頭10行を代入する

res10[c("Location","TotalSales","OperatingCost")]
# 変数res10の"Location","TotalSales","OperatingCost"列だけを表示する

res10 <- head(stores,10)[c("Location","TotalSales","OperatingCost")]
# 変数res10に、変数storesの先頭10行と"Location","TotalSales","OperatingCost"列を表示する

# ●View関数
# View関数を使うと、指定した変数を別ウインドウで表形式で表示することが出来る
# ExcelやCSVといった外部ファイルをインポートし、読み込んだ際、データ内容を確認する時に使われる

View(res10)
# 変数res10をビューする

res11 <- stores[stores$TotalSales > 100, 1:10]
# 変数res11に、変数storeのTotalSales列が100より大きい行と1～10列目を代入する
# 変数res11には、TotalSales列が100より大きい行と、1～10列目が代入される

View(res11)
# 変数res11をビューする


# ■列(カラム)のデータ型の変換
# 列(カラム)のデータ型を関数で変換することが出来る
# 具体的には1,5,6,90,1098などの数値型データを、"A","c","dfc","XYZ"といった文字列型に変換することが出来る

# ●as.character関数
# as.character関数を使うと、文字列型ではないデータを文字列型に変換できる

newvar <- as.character(stores$StoreType)
# 変数newvarに、変数storesのStoreType列のデータを文字列型に変換して代入する

stores$StoreType
# 変数storesのStoreType列を出力する

newvar
# 変数newvarを出力する

stores$StoreType <- as.character(stores$StoreType)
# 変数storesのStoreType列に、変数storesのStoreType列を文字列型データに変換して、代入する
# このコードを実行すると、変数storesのStoreType列のデータが文字列型に書き換わる


# ■値の置換
# 変数に複数格納した値の中から、一つを選択して置換することが出来る

x1 <- c("A","B","C","D","E")
# 変数x1に、ベクトル型で文字列"A","B","C","D","E"を代入する

# Replace "C" by "X"
x1[x1 == "C"]
# 変数x1に、文字列"C"要素を選択する

x1[x1 == "C"] <- "X"
# 変数x1の文字列"C"要素を文字列"X"に置換する

x1
# 変数x1を出力する


# ■列(カラム)名の変更
# 変数に格納された値の置換と同じ要領で、データセットの列(カラム)名を変更できる
# データセット内の列名を完全に置換するには、以下のコードを実装する

# colnames(data)[colnames(data)=='ExistingColumn] <- 'NewColumn'
# colnames(データセット名(変数名))[colnames=='現在の列名"] <- '新しい列名'

cl <- colnames(stores)
# 変数c1に変数storesの列(カラム)名を代入する
# colnames関数は、データセットの列名のみを返す関数

cl[cl == "Location"] <- "City"
# 変数c1内の要素、"Location"列名に"City"を代入する(列名を置換する)

cl
# 変数c1を出力する

colnames(stores)[colnames(stores)=='Total_Customers'] <- 'TC'
# 変数storesの列(カラム)名内の要素、'Total_Customers'列名に'TC'を代入する


# ●dplyrパッケージを使っての列(カラム)名の変更
# dplyrパッケージを使っても列(カラム)名を変更することが出来る

library(dplyr)
# dplyrパッケージをロードする

stores2 <- dplyr::rename(stores,'City'='Location')
# dplyrパッケージを使い、変数storesの'City'の列名を'Location'に変更し、変数stores2に代入する


# ■列(カラム)の新規追加
# 四則演算を使い、列(カラム)を新しく追加することが出来る
# 例えば、売上合計金額を表すTotalSalesという列から、運用費用を意味するOperatingCost列を差し引き、
# 利益を意味するProfitという新しい列を追加することが出来る

stores$TotalProfit <- stores$TotalSales - stores$OperatingCost
# 変数storesのTotalProfit列に、TotalSales列からOperatingCost列を引いた値を代入する
# TotalSales列からOperatingCost列を引いた値を、TotalProfit新規列として追加する


# ●dplyrパッケージを使っての列(カラム)の新規追加
stores3 <- dplyr::mutate(stores, NewProfit = TotalSales - OperatingCost)
# dplyrパッケージを使い、変数storesのTotalSales列からOperatingCost列を引いて、NewProfit列を追加する
# dplyrパッケージのmutate関数を使うと、新規列を追加することが出来る

stores5 <- dplyr::mutate(stores,
# dplyrパッケージを使い、変数storesの
  TotalAcqCost = Total_Customers * AcqCostPercust,
  # Total_Customers列とAcqCostPercust列を掛けて、TotalAcqCost列を追加する
    NetExpenses = OperatingCost + AcqCostPercust,
    # OperatingCost列とAcqCostPercust列を足して、NetExpenses列を追加する
        NewProfit = TotalSales - NetExpenses)
        # TotalSales列からNetExpenses列を引いて、NewProfit列を追加する
        # 上記の列を追加した上で、変数stores5に代入する


# ■列(カラム)の削除
# NULLを変数に代入することで、列(カラム)を削除できる

stores5$NewProfit <- NULL
# 変数stores5のNewProfit列に、NULLを代入する
# 変数stores5のNewProfit列を削除する


# ■テーブルの削除
# rm関数を使うことで、テーブルそのものを削除することが出来る

rm(stores7)
# 変数stores7のテーブルを削除する


# ■列(カラム)の並び替え
stores[,c(1,2,3,4)]
# 変数storesの全ての行と、1,2,3,4列を出力する

stores <- stores[,c(1:5,16,6:15)]
# 変数storesに、全ての行と、1～5列目、16列目、6～15列目を代入する

stores[,c(1:5,16,6:(ncol(stores)-1))]


# ■データ・ハンドリング
# ●フィルタリング
# >, <, =>, =<の不等式を使うことで、任意の条件に合致した行をフィルタリング出来る
# &やandを組み合わせることで、複数条件でのフィルタリングも可能

res7 <- stores[stores$TotalSales > 200,]
# 変数res7に変数storesのTotalSalesの列(カラム)の中で値が200より大きい行を代入する

res8 <- stores[stores$TotalSales>200 & stores$Location =='Delhi',]
# 変数res8に変数storesのTotalSalesの列(カラム)の中で値が200より大きく、
# 更にLocationの列(カラム)がDelhiの行を代入する


# ●列(カラム)のフィルタリングの組み合わせ
# Location列がDelhiでTotal Salesが200より大きい行を抽出し、更に3列だけを抽出する

res9 <- stores[stores$TotalSales > 200 & stores$Location =='Delhi', c('Location','TotalSales','Profit')]
# 変数res9に、変数storesのTotalSalesの列が200より大きく、更にLocationの列がDelhiと等しい行を抽出し、
# 'Location','TotalSales','Profit'の列だけを抽出して、代入する


# ●subset関数
# subset関数でも、行と列のフィルタリングが出来る

res10 <- subset(stores,subset = TotalSales > 200 & Location == 'Delhi',select = c('Location','TotalSales','Profit'))
# 変数res10に、変数storesのTotalSalesが200より大きく、Location列が'Delhi'と等しく、
# 'Location','TotalSales','Profit'列を抽出し、代入する

res11 <- subset(stores,subset=TotalSales > 200 & Location=='Delhi',select = -2)
# 変数res11に、変数storesのTotalSalesが200より大きく、Location列が'Delhi'と等しく、
# 2列目以外の列を抽出し、代入する
# select関数に-(マイナス)の引数を設定することで、任意の列を落とすことが出来る

res12 <- subset(stores,subset=TotalSales>200 & Location=='Delhi',select=c(-2,-3))
# 変数res12に、変数storesのTotalSalesが200より大きく、Location列が'Delhi'と等しく、
# 2、3列目以外を抽出し、代入する

res13 <- subset(stores, subset = TotalSales > 200 & Location =='Delhi', select=c('Location','TotalSales','Profit'))
# 変数res13に、変数storesのTotalSalesが200より大きく、Location列が'Delhi'と等しく、
# 'Location','TotalSales','Profit'列を抽出して、代入する

# ●which関数
# which関数でも、フィルタリングは可能
# which関数は、ベクトル内の要素(行番号、列番号、アレイ・インデックス)をTRUE/FALSEで返す。
# which関数はsubset関数の中で使えない点に注意する

x1 <- c(1,5,8,4,6)
# 変数x1にベクトル型で、1,5,8,4,6を代入する

which(x1 == 5)
# which関数を使って、変数x1に格納されている「5」の位置を返す
# このコードを実行すると2が返る
# 変数x1には、1,5,8,4,6が代入されており、5は2番目の要素になるため、2が返る

which(x1 != 5)
# which関数を使って、変数x1に「5」が格納されていない位置を返す
# このコードを実行すると1, 3, 4, 5が返る
# 変数x1には、1,5,8,4,6が代入されており、5は2番目の要素になるため、2以外の要素が返る
# which関数は!(Not演算子)と組み合わせて使うことが可能である

stores[which(stores$TotalSales > 200 & stores$Location =='Delhi'),]
# 変数storesのTotalSales列が200より大きく、Location列が'Delhi'と等しい行を変数storesに代入する


# ●ソート機能
# order関数を使うとベクトルに格納された要素を昇順で並び替え、要素数を返す
# order関数はあくまで要素数を返すため、実用的にはorder関数を[]で囲って使用する

v1 <- c(10,1,4)
# 変数v1にベクトル型で10,1,4を代入する

order(v1)
# 変数v1に格納された要素を昇順で並び替える
# 変数v1には、10,1,4が格納されており、昇順で並び替えると1,4,10となる
# order関数を使うと、要素番号2(つまり1)、3(つまり4)、1(つまり10)が返る

v1[order(v1)]
# 変数v1に格納された要素を昇順で並び替えて、変数v1を出力する
# こうすると変数v1に格納された要素、10,1,4が昇順1, 4, 10で返る

v1[order(v1, decreasing = TRUE)]
# 変数v1に格納された要素を降順で並び替えて、変数v1を出力する
# 引数decreasing = TRUEを指定すると、ベクトル内の要素を降順で並び替えることが出来る
# つまり、変数v1は10, 4, 1で返る


# ●全ての列(カラム)を残し、全てのデータをProfit列を降順でソートする

res14 <- stores[order(stores$Profit, decreasing=TRUE),]
# 変数res14に、変数storesのProfit列を降順で並び替え、代入する
# これによって、変数storesのProfit列が降順になり、他の列も残したまま変数res14に代入できる
# しかし、行番号が変わるため、混乱の元にもなる

res14 <- stores[order(stores$Location,-stores$TotalSales),]
# 変数res14に、変数storesのLocation列を昇順で並び替え、TotalSales列を除き、代入する


# ●dplyrパッケージを使ったソート
# dplyrパッケージを使った方がBase Rよりも速くソート出来る

res15 <- dplyr::arrange(stores,Profit)
# 変数res15に、dplyrパッケージを使って変数storesのProfit列を昇順に並び替え代入する
# dplyrパッケージでもBase Rコードと同様に引数を指定しないと、昇順での並び替えになる

res16 <- dplyr::arrange(stores,desc(Profit))
# 変数res16に、dplyrパッケージを使って変数storesのProfit列を降順に並び替え代入する
# 降順で並び替えをする時は、引数descで降順を指定する

# ●Location列を昇順で並び替え、並び替えたLocation列のProfit列を降順で並び変える
# dplyrパッケージは複数列で昇順・降順を組み合わせた並び替えに便利である

res17 <- dplyr::arrange(stores,Location,desc(Profit)) 
# 変数res17に、dplyrパッケージを使って変数storesのLocation列を昇順で並び替え、Profit列を降順に並び替え代入する

res18 <- dplyr::arrange(stores,desc(StoreType),desc(StoreName)) 
# 変数res18に、dplyrパッケージを使って変数storesのStoreType列を降順で並び替え、StoreName列も降順で並び替え代入する

# ●重複値の削除
# duplicated関数を使うと、変数内に重複値の有無をTRUE/FALSEで返す
# 実務では、[]に囲って変数を出力して、重複値の有無ではなく、重複値をそのものを返す方が役立つ
# 又、!(Not演算子)と組み合わせて使うことで、変数内のユニークな値を出力できる

# duplicated関数と!(Not演算子)の組み合わせで、ユニーク値(行)だけを出力できるため、
# データセット内の重複データ削除にも使われる

v1 <- c(1,2,3,3,2,1)
# 変数v1にベクトル型で1,2,3,3,2,1を代入する

duplicated(v1)
# 変数v1の重複値を返す
# duplicated関数を使うと、変数内に重複値の有無をTRUE/FALSEで返す
# この為、実行結果は1(FALSE), 2(FALSE), 3(FALSE), 3(TRUE), 2(TRUE), 1(TRUE)となる
# 4, 5, 6番目の3, 2, 1は変数v1で2回出現している為、2回目の出現となる4, 5, 6番目にはTrueが返る

v1[duplicated(v1)]
# 変数v1の重複値を返す
# duplicated関数を[]で囲って出力すると、TRUE/FALSEの二項ではなく、重複値を返すことが出来る
# 変数v1の場合、3, 2, 1を返す

v1[!duplicated(v1)]
# 変数v1の非重複値(つまり、重複していない値|ユニークな値)を返す
# duplicated関数と!(Not演算子)を組み合わせることで、変数内のユニークな値を出力できる
# 変数v1の場合、1, 2, 3が返る

res19 <- stores[!duplicated(stores$StoreType),]
# 変数res19に、変数storesのStoreType列のユニークな行を代入する
# duplicated関数の実用的な使い方として、重複した行を削除し、ユニークな行だけを残す使い方がある
# この例では、変数res19に変数storesのStoreType列のユニークな行だけを代入してる

a <- stores[!(duplicated(stores$StoreType) & duplicated(stores$StoreName)),]
# 変数aに、変数storesのStoreType列とStoreName列の非重複行(つまり、ユニーク行)を代入する
# この例では変数aに、変数storesのStoreType列とStoreName列の重複行を削除し、ユニークな行だけを代入している


# ●学生のテストスコア・データを使った例
# ここではScore_Class4というCSV形式の外部データを使い、重複行を削除する

library(readr)
# readrパッケージをロードする

Score_Class4 <- read_csv("C:/Users/sho-kamura/Desktop/トレーニング/AnalytiXLab/DataScience Using R/#7Data/Score_Class4.csv")
# 変数Score_Class4に、指定したパス上にあるCSVファイルをインポートして代入する
# ""(ダブル・クオテーション)で指定したファイル読み込みパスは、個人のパスなので適宜変更が必要

View(Score_Class4)
# 変数Score_Class4をビューする

Uniquerows <- Score_Class4[!duplicated(Score_Class4),]
# 変数Uniquerowsに、変数Score_Class4の非重複行(つまり、ユニーク行)を代入する
# このコードによって、完全な重複行が削除される

Uniquestudent <- Score_Class4[!duplicated(Score_Class4$Student),] 
# 変数Uniquestudentに、変数Score_Class4のStudent列の非重複行(つまり、ユニーク行)を代入する
# このコードによって、変数Score_Class4のStudent列の重複行が削除される
# つまり、Student列の生徒名で重複した行が削除される


# ●欠損値の置換
# is.na関数を使うと、変数内にNA(欠損値)が含まれているかをTRUE/FALSEで返す
# duplicated関数同様に、is.na関数をそのまま使う場面は少ない
# 実務では、[]に囲って変数を出力して、欠損値を任意の値に置換する使い方の方が便利である

m = NA
# 変数mにNA(欠損値)を代入する

is.na(m)
# 変数mにNA(欠損値)が含まれているかどうかを返す

v1 <- c(1,2,NA,3)
# 変数v1にベクトル型で1,2,NA,3を代入する

v1
# 変数v1を出力する
# この時点では、変数v1にベクトル型で1,2,NA,3が代入されている

v1[is.na(v1)] <- 5
# 変数v1に含まれているNA(欠損値)に5を代入する
# is.na関数を[]で囲い、変数v1のNA(欠損値)を特定し、NA(欠損値)に5を代入している
# このコード実行後には、変数v1にベクトル型で1, 2, 5, 3が代入されている


# ●小売店に関するデータを使った例
# 変数storesとして外部データを読み込み、NA(欠損値)を置換する

stores$AcqCostPercust[is.na(stores$AcqCostPercust)] <-15
# 変数storesのAcqCostPercust列のNA(欠損値)を15に置換する
# このコード実行後には、変数storesのNA(欠損値)が15に置換される

# ●欠損値を削除して平均を計算する
# 平均を計算する場合は、NA(欠損値)を削除してから計算するのが望ましい
# NA(欠損値)が含まれていると、平均が影響を受けるためである
# NA(欠損値)を削除するには、na.rm = TRUE引数を設定する

AC <- stores$AcqCostPercust
# 変数ACに、変数storesのAcqCostPercust列を代入する

mean(AC)
# 変数ACの平均値を出力する

mean(AC, na.rm = TRUE)
# 変数ACのNA(欠損値)を除去して、平均値を出力する
# na.rm引数にTRUEを設定することで、変数内のNA(欠損値)を削除して、平均を求めることが出来る
# 変数内にNA(欠損値)が残ったまま平均を計算すると、平均がNA(欠損値)から影響を受けるため、
# 本引数を設定して平均を求める方が実用的である


# ●NA(欠損値)に平均値を代入する
# データセット内のNA(欠損値)が多い場合は、NA(欠損値)を平均に置き換えることも一般的である
# 尚、置換は、MICEパッケージを使っても出来るが、ここでは触れない

stores$AcqCostPercust[is.na(stores$AcqCostPercust)] <- mean(stores$AcqCostPercust)
# 変数storesのAcqCostPercust列のNA(欠損値)に、変数storesのAcqCostPercust列の平均を代入する


# ●NA(欠損値)の削除
# na.omit関数を使うと、NA(欠損値)を含む行を削除することが出来る

clean <- na.omit(stores)
# 変数cleanに、変数storesのNA(欠損値)を含む行を削除して、代入する


# ●外れ値のキャッピング
# データセット内に明らかに大きいもしくは小さな外れ値が含まれている場合、上限/下限のキャップを掛けることが出来る
# こうした外れ値は、平均を上振れ/下振れさせ大きな影響を与える為、処理が必要になる

stores$AcqCostPercust[stores$AcqCostPercust > 4] <- 2
# 変数storesのAcqCostPercust列で、4より大きな値を持つ行は、2に置換する

# ・上限キャップの設定
# データセット内で極端に大きな外れ値には上限キャップを掛ける
# 極端に大きな外れ値は、平均を上振れさせる

UC <- mean(stores$AcqCostPercust,na.rm = T) + sd(stores$AcqCostPercust,na.rm = T)
# 変数storesのAcqCostPercust列のNA(欠損値)を削除してから、平均を計算する
# 変数storesのAcqCostPercust列のNA(欠損値)を削除してから、標準偏差を計算する
# 変数UCに、平均と標準偏差を加えて代入する
# このコードによって、上限キャップを定義することが出来る
# 尚、UCはUpper Capの略で上限キャップを表す

# ・下限キャップ
# データセット内で極端に小さな外れ値には下限キャップを掛ける
# 極端に小さな外れ値は、平均を下振れさせる

LC <- mean(stores$AcqCostPercust,na.rm = T) - sd(stores$AcqCostPercust,na.rm = T)

# 変数storesのAcqCostPercust列のNA(欠損値)を削除してから、平均を計算する
# 変数storesのAcqCostPercust列のNA(欠損値)を削除してから、標準偏差を計算する
# 変数LCに、平均から標準偏差を引いて代入する
# このコードによって、下限キャップを定義することが出来る
# 尚、LCはLower Capの略で下限キャップを表す


# ●外れ値の特定
# 定義した上限キャップと下限キャップを使うことで、データセット内の外れ値を特定することが出来る

stores$AcqCostPercust[stores$AcqCostPercust > UC | stores$AcqCostPercust < LC]
# 変数storesのAcqCostPercust列で変数UCより大きいな値を持つ行、
# もしくは変数LCより小さな値を持つ行を出力する
# このコードによって、UC(上限キャップ)より大きな値(つまり、大きな外れ値)と
# LC(下限キャップ)より小さな値(つまり、小さな外れ値)を特定することが出来る


# ・特定した大きな外れ値を上限キャップに置換
# 大きな外れ値を特定したら、上限キャップに置換する

stores$AcqCostPercust[stores$AcqCostPercust > UC] <- UC
# 変数storesのAcqCostPercust列で変数UCより大きな値を持つ行を、変数UCに置換する
# このコードによって、UC(上限キャップ)より大きな値(つまり、大きな外れ値)を上限キャップに置換出来る


# ・特定した小さな外れ値を下限キャップに置換
# 今度は小さな外れ値を、下限キャップに置換する

stores$AcqCostPercust[stores$AcqCostPercust < LC] <- LC
# 変数storesのAcqCostPercust列で変数LCより小さな値を持つ行を、変数LCに置換する
# このコードによって、LC(下限キャップ)より小さな値(つまり、小さな外れ値)を下限キャップに置換出来る


# ・箱ひげ図による確認
# 上限・下限キャッピングが終わったら、箱ひげ図でデータセットの分布を確認する
# 箱ひげ図を描くことで視覚的に外れ値が存在していないかを確認することが出来る

boxplot(stores$AcqCostPercust)
# 変数storesのAcqCostPercust列の箱ひげ図を出力する

# ■所感
# ・重複値の特定、NA(欠損値)の置換、外れ値の特定、キャッピング等、実用的なコードが多い
# ・外部データのインポートから、データ・ハンドリング、グラフ作成、モデリングまでの標準プロセスは全て標準化したファイルを作っておこう
# ・こんな調子で、復習かねがねRコードのモジュール化を進めていきたい

# 以上