# 4��1�� �wDataScience Using R�x Day3

# ���O��܂ł̂��炷��
# �wDataScience Using R�xDay3��R�R�[�h�ł��B
# R�ł̃f�[�^�E�n���h�����O�𒆐S�Ɋw�т܂����B
# �O�񓯗l�A�e�R�[�h�̐U�镑���́A�R�����g�̒ʂ�ł��B
# ���킸�����ȁAstores��cars�Ƃ������ϐ�����"C:\Users\�ȉ��̃f�B���N�g��"�́A�u�`�Ŏg�p�����C�Ӗ��̂ł��B
# �������Ŏ��������ꍇ�́A�K�X�ϐ�����ς��Ă��������B

# ��Day3�̍\��
# �E�f�[�^�̗���
# - str�֐�
# - summary�֐�

# - psych�p�b�P�[�W
# - Hmisc�p�b�P�[�W
# - ���̑��̊֐�

# �ESubsetting of data
# - ��(�J����)�̑I��
# - �s�Ɨ�̑I��

# �E�f�[�^�Z�b�g�̕\��
# - head�֐�
# - tail�֐�

# �E��(�J����)�̃f�[�^�^�̕ϊ�
# - as.character�֐�

# �E�l�̒u��
# �E��(�J����)���̕ύX
# - dplyr�p�b�P�[�W���g���Ă̗�(�J����)���̕ύX

# �E��(�J����)�̐V�K�ǉ�
# - dplyr�p�b�P�[�W���g���Ă̗�(�J����)�̐V�K�ǉ�

# �E��(�J����)�̍폜
# �E�e�[�u���̍폜
# �E��(�J����)�̕��ёւ�

# �E�f�[�^�E�n���h�����O
# - �t�B���^�����O
# - ��(�J����)�̃t�B���^�����O�̑g�ݍ��킹
# - subset�֐�
# - �\�[�g�@�\
# - dplyr�p�b�P�[�W���g�����\�[�g
# - �d���l�̍폜
# - �����l�̒u��
# - �����l���폜���ĕ��ς��v�Z����
# - NA(�����l)�ɕ��ϒl��������
# - NA(�����l)�̍폜
# - �O��l�̃L���b�s���O
# - �O��l�̓���

# ��Day3�̃S�[��
#�E�f�[�^�����Ɏg���֐����K������
#�E�f�[�^�E�n���h�����O(�t�B���^�����O�A�\�[�g�A�d���l|�����l|�O��l����)���K������

getwd()
# ���[�L���O�E�f�B���N�g�����o�͂���

setwd("C:\Users\sho-kamura\Desktop\�g���[�j���O\AnalytiXLab\DataScience Using R\#7Data")
# ���[�L���O�E�f�B���N�g����C:\Users\sho-kamura\Desktop\�g���[�j���O\AnalytiXLab\DataScience Using R\#7Data
# �ɕύX����

stores <- read.csv('C:\Users\sho-kamura\Desktop\�g���[�j���O\AnalytiXLab\DataScience Using R\#7Data\stores.csv')
# �ϐ�stores��'C:\Users\sho-kamura\Desktop\�g���[�j���O\AnalytiXLab\DataScience Using R\#7Data\stores.csv'��CSV�t�@�C�����C���|�[�g���A�������

View(stores)
# �ϐ�stores���r���[����


# ���f�[�^�̗���
# ��str�֐�
# str�֐����g���ƁA�f�[�^�Z�b�g�̍\����Ԃ����Ƃ��o����

str(cars)
# �ϐ�cars�̃f�[�^�\����\������

str(stores)
# �ϐ�stores�̃f�[�^�\����\������
# str�֐��̓f�[�^�̍\����Ԃ�

# ��summary�֐�
# summary�֐��́A�f�[�^�Z�b�g�̑S�ẴJ����(��)�̕��z(�ŏ��l/��1�l����/�����l/���ϒl/��3�l����/�ő�l)��Ԃ�
# �v���^(�t�@�N�^�[)�f�[�^�̏ꍇ�́A�v������Ԃ��A������^�f�[�^�ɂ́A��������Ԃ��A
# ���l�^�f�[�^�ɂ́A��{���v�ʂ�Ԃ�

summary(cars)
# �ϐ�cars�̃f�[�^�v���\������

summary(stores)
# �ϐ�stores�̃f�[�^�v���\������

# ��psych�p�b�P�[�W
# psych�p�b�P�[�W���g���ƁA�f�[�^�Z�b�g�̊�{���v�ʂ�Ԃ�

?describe
install.packages('psych')
# �p�b�P�[�Wpsych���C���X�g�[������

library(psych)
# �p�b�P�[�Wpsych�����[�h����

psych::describe(stores)
# �p�b�P�[�Wpsych���g���āA�ϐ�stores�̊�{���v�ʂ�Ԃ�

# ��Hmisc�p�b�P�[�W
# Hmis�p�b�P�[�W���g���ƁA�f�[�^�Z�b�g�̍\����Ԃ�
# �\���Ƃ́A�f�[�^�̍s���A�p�x�A�����l���Ȃǂ�Ԃ�

install.packages('Hmisc')
# �p�b�P�[�WHmisc���C���X�g�[������

library(Hmisc)
# �p�b�P�[�WHmisc�����[�h����

Hmisc::describe(stores)
# �p�b�P�[�WHmisc���g���āA�ϐ�stores�̃f�[�^�\����Ԃ�

# �����̑��̊֐�
# �f�[�^�����ɂ́A���ɂ�nrow�֐��Ancol�֐��Acolnames�֐��Anames�֐��Aclass�֐����悭�g����

nrow(stores)
# �ϐ�stores�̍s����Ԃ�
# nrow�֐��́A�ϐ��̍s����Ԃ��@�\������

ncol(stores)
# �ϐ�stores�̗񐔂�Ԃ�
# ncol�֐��́A�ϐ��̗񐔂�Ԃ��@�\������

dim(stores)
# �ϐ�stores�̍s���E�񐔂�Ԃ�
# dim�֐��́A�ϐ��̍s���E�񐔂�Ԃ��@�\������

colnames(stores)
# �ϐ�stores�̗񖼂�Ԃ�
# colnames�֐��́A�ϐ��̗񖼂�Ԃ��@�\������
# colnames�֐��́A�f�[�^�E�t���[���݂̂�Ԃ�


names(stores) 
# �ϐ�stores�̗񖼂�Ԃ�
# names�֐����A�ϐ��̗񖼂�Ԃ��@�\������
# colnames�֐��Ƃ̈Ⴂ�́Anames�֐��́A�f�[�^�E�t���[���ȊO�̃I�u�W�F�N�g�̗񖼂��Ԃ���_�ɂ���

class(stores$Staff_Cnt)
# �ϐ�stores��Staff_Cnt��̃f�[�^�^�C�v��Ԃ�
# class�֐��́A�ϐ��̃f�[�^�^��Ԃ��@�\������
# ���̗�ł́A�����^(integer)���Ԃ�


# ���f�[�^�̉��H�ƒ��o(subsetting)
# subset�֐����g���ƑΏۂƂȂ�f�[�^�Ɂusubset�v�������́uselect�v�ŏ������w�肵�A�����𖞂����f�[�^���������o�����Ƃ��o����

# ����(�J����)�̑I��
# �f�[�^�E�n���h�����O�̊�b�Ƃ��ė�(�J����)�̑I������������
# Base R�ł�$(�h���}�[�N)���g�����ƂŁA��w�肪�o����
# �Ⴆ�΁Astores$StoreName�̏ꍇ�A�ϐ�stores��StoreName����w�肵�Ă��邱�Ƃ�\��

# ���A�񖼎w�肾���łȂ��A[1:3]��[]���ɐ��l��:�Ŏw�肷�邱�ƂŁA���l�ŗ񐔂��w�肷�邱�Ƃ��o����
# [1:3]�̗�ł́A1�`3��ڂ�I���o����
# [1:3, 5, 11, 14]��,�ŋ�؂邱�ƂŁA����΂��đI�����邱�Ƃ��o����

res1 <- stores$StoreName
# �ϐ�res1�ɕϐ�stores��StoreName���������
# �ϐ���$(�h���}�[�N)�񖼂ŁA�w����I���o����

res2 <- stores[1:3]
# �ϐ�res2�ɕϐ�stores��1�`3���������
# []���ɐ��l��:�Ŏw��ŁA�A�����ė���w�肷�邱�Ƃ��o����

res3 <- stores[c(1:3,5,8,9)]
# �ϐ�res3�ɕϐ�stores��1,3,5,8,9���������
# �f�[�^�Z�b�g���畡�����I������Ƃ��́Ac���g��
# ,�ŋ�؂��āA����΂��đI�����邱�Ƃ��o����

res4 <- stores[c("Location","TotalSales","OperatingCost")]
# �ϐ�res4�ɕϐ�stores��Location, TotalSales, OperatingCost���������

res5 <- stores[-5]
# �ϐ�res5�ɕϐ�stores��5��ڂ���������(�J����)��������
# []��-���g�����ƂŁA�f�[�^�Z�b�g�����(�J����)�𗎂Ƃ����Ƃ��o����

res5_1 <- stores[-5:-14]
# �ϐ�res5_1�ɕϐ�stores��5�`14��ڂ���������(�J����)��������
# []��:���g�����ƂŁA���Ƃ�������͈͎̔w�肪�o����


# ���s�Ɨ�̑I��
# ��(�J����)�����łȂ��A�s(���E)���w�肵�āA�I�����邱�Ƃ��o����
# R�ł͕ϐ���[x,y]�ƁA�s,��Ŏw�肷�邱�Ƃ��o����
# �Ⴆ�΁Astores[1:3,2:5]�̏ꍇ�A�ϐ�stores��1�`3�s�ځA2�`5��ڂ��w�肷�邱�ƂɂȂ�

res6 <- stores[1:3,2:5]
# �ϐ�res6�ɕϐ�stores��1�`3�s�ځA2�`5��ڂ�������

res7 <- stores[1:3,c("Location","TotalSales")]
# �ϐ�res7�ɕϐ�stores��1�`3�s�ځA"Location","TotalSales"�̗��������
# �s���Ɨ񖼎w���g�ݍ��킹���\

res8 <- stores[nrow(stores)-4,c("Location","TotalSales","OperatingCost")]
# �ϐ�res8�ɕϐ�stores�̍s������4���������s��"Location","TotalSales","OperatingCost"�̗��������

res9 <- stores[0:(nrow(stores)-4),c("Location","TotalSales","OperatingCost")]
# �ϐ�res9�ɕϐ�stores��0�s�ځ`�Ō�̍s����4���������s�܂ł�"Location","TotalSales","OperatingCost"�̗��������

View(res9)
# �ϐ�res9�̃f�[�^���r���[����


# ���f�[�^�Z�b�g�̕\��
# R�Ńf�[�^�Z�b�g��\������ɂ́Ahead�֐��Atail�֐��AView�֐����g�����Ƃ�����
# ���ꂼ��̊֐��@�\�͈ȉ��̒ʂ�

# ��head�֐�
# head�֐����g���ƁA�擪����w�肵���s���̃f�[�^�Z�b�g��\���ł���
# �f�t�H���g(�w�肵�Ȃ��ꍇ)�́A6�s���Ԃ�

head(stores,2)
# �ϐ�stores�̐擪2�s�̃f�[�^�Z�b�g��\������

# ��tail�֐�
# tail�֐����g���ƁA��������w�肵���s���̃f�[�^�Z�b�g��\���ł���
# �f�t�H���g(�w�肵�Ȃ��ꍇ)�́A6�s���Ԃ�

tail(stores,3)
# �ϐ�stores�̖���3�s�̃f�[�^�Z�b�g��\������

res10 <- head(stores,10)
# �ϐ�res10�ɁA�ϐ�stores�̐擪10�s��������

res10[c("Location","TotalSales","OperatingCost")]
# �ϐ�res10��"Location","TotalSales","OperatingCost"�񂾂���\������

res10 <- head(stores,10)[c("Location","TotalSales","OperatingCost")]
# �ϐ�res10�ɁA�ϐ�stores�̐擪10�s��"Location","TotalSales","OperatingCost"���\������

# ��View�֐�
# View�֐����g���ƁA�w�肵���ϐ���ʃE�C���h�E�ŕ\�`���ŕ\�����邱�Ƃ��o����
# Excel��CSV�Ƃ������O���t�@�C�����C���|�[�g���A�ǂݍ��񂾍ہA�f�[�^���e���m�F���鎞�Ɏg����

View(res10)
# �ϐ�res10���r���[����

res11 <- stores[stores$TotalSales > 100, 1:10]
# �ϐ�res11�ɁA�ϐ�store��TotalSales��100���傫���s��1�`10��ڂ�������
# �ϐ�res11�ɂ́ATotalSales��100���傫���s�ƁA1�`10��ڂ���������

View(res11)
# �ϐ�res11���r���[����


# ����(�J����)�̃f�[�^�^�̕ϊ�
# ��(�J����)�̃f�[�^�^���֐��ŕϊ����邱�Ƃ��o����
# ��̓I�ɂ�1,5,6,90,1098�Ȃǂ̐��l�^�f�[�^���A"A","c","dfc","XYZ"�Ƃ�����������^�ɕϊ����邱�Ƃ��o����

# ��as.character�֐�
# as.character�֐����g���ƁA������^�ł͂Ȃ��f�[�^�𕶎���^�ɕϊ��ł���

newvar <- as.character(stores$StoreType)
# �ϐ�newvar�ɁA�ϐ�stores��StoreType��̃f�[�^�𕶎���^�ɕϊ����đ������

stores$StoreType
# �ϐ�stores��StoreType����o�͂���

newvar
# �ϐ�newvar���o�͂���

stores$StoreType <- as.character(stores$StoreType)
# �ϐ�stores��StoreType��ɁA�ϐ�stores��StoreType��𕶎���^�f�[�^�ɕϊ����āA�������
# ���̃R�[�h�����s����ƁA�ϐ�stores��StoreType��̃f�[�^��������^�ɏ��������


# ���l�̒u��
# �ϐ��ɕ����i�[�����l�̒�����A���I�����Ēu�����邱�Ƃ��o����

x1 <- c("A","B","C","D","E")
# �ϐ�x1�ɁA�x�N�g���^�ŕ�����"A","B","C","D","E"��������

# Replace "C" by "X"
x1[x1 == "C"]
# �ϐ�x1�ɁA������"C"�v�f��I������

x1[x1 == "C"] <- "X"
# �ϐ�x1�̕�����"C"�v�f�𕶎���"X"�ɒu������

x1
# �ϐ�x1���o�͂���


# ����(�J����)���̕ύX
# �ϐ��Ɋi�[���ꂽ�l�̒u���Ɠ����v�̂ŁA�f�[�^�Z�b�g�̗�(�J����)����ύX�ł���
# �f�[�^�Z�b�g���̗񖼂����S�ɒu������ɂ́A�ȉ��̃R�[�h����������

# colnames(data)[colnames(data)=='ExistingColumn] <- 'NewColumn'
# colnames(�f�[�^�Z�b�g��(�ϐ���))[colnames=='���݂̗�"] <- '�V������'

cl <- colnames(stores)
# �ϐ�c1�ɕϐ�stores�̗�(�J����)����������
# colnames�֐��́A�f�[�^�Z�b�g�̗񖼂݂̂�Ԃ��֐�

cl[cl == "Location"] <- "City"
# �ϐ�c1���̗v�f�A"Location"�񖼂�"City"��������(�񖼂�u������)

cl
# �ϐ�c1���o�͂���

colnames(stores)[colnames(stores)=='Total_Customers'] <- 'TC'
# �ϐ�stores�̗�(�J����)�����̗v�f�A'Total_Customers'�񖼂�'TC'��������


# ��dplyr�p�b�P�[�W���g���Ă̗�(�J����)���̕ύX
# dplyr�p�b�P�[�W���g���Ă���(�J����)����ύX���邱�Ƃ��o����

library(dplyr)
# dplyr�p�b�P�[�W�����[�h����

stores2 <- dplyr::rename(stores,'City'='Location')
# dplyr�p�b�P�[�W���g���A�ϐ�stores��'City'�̗񖼂�'Location'�ɕύX���A�ϐ�stores2�ɑ������


# ����(�J����)�̐V�K�ǉ�
# �l�����Z���g���A��(�J����)��V�����ǉ����邱�Ƃ��o����
# �Ⴆ�΁A���㍇�v���z��\��TotalSales�Ƃ����񂩂�A�^�p��p���Ӗ�����OperatingCost������������A
# ���v���Ӗ�����Profit�Ƃ����V�������ǉ����邱�Ƃ��o����

stores$TotalProfit <- stores$TotalSales - stores$OperatingCost
# �ϐ�stores��TotalProfit��ɁATotalSales�񂩂�OperatingCost����������l��������
# TotalSales�񂩂�OperatingCost����������l���ATotalProfit�V�K��Ƃ��Ēǉ�����


# ��dplyr�p�b�P�[�W���g���Ă̗�(�J����)�̐V�K�ǉ�
stores3 <- dplyr::mutate(stores, NewProfit = TotalSales - OperatingCost)
# dplyr�p�b�P�[�W���g���A�ϐ�stores��TotalSales�񂩂�OperatingCost��������āANewProfit���ǉ�����
# dplyr�p�b�P�[�W��mutate�֐����g���ƁA�V�K���ǉ����邱�Ƃ��o����

stores5 <- dplyr::mutate(stores,
# dplyr�p�b�P�[�W���g���A�ϐ�stores��
  TotalAcqCost = Total_Customers * AcqCostPercust,
  # Total_Customers���AcqCostPercust����|���āATotalAcqCost���ǉ�����
    NetExpenses = OperatingCost + AcqCostPercust,
    # OperatingCost���AcqCostPercust��𑫂��āANetExpenses���ǉ�����
        NewProfit = TotalSales - NetExpenses)
        # TotalSales�񂩂�NetExpenses��������āANewProfit���ǉ�����
        # ��L�̗��ǉ�������ŁA�ϐ�stores5�ɑ������


# ����(�J����)�̍폜
# NULL��ϐ��ɑ�����邱�ƂŁA��(�J����)���폜�ł���

stores5$NewProfit <- NULL
# �ϐ�stores5��NewProfit��ɁANULL��������
# �ϐ�stores5��NewProfit����폜����


# ���e�[�u���̍폜
# rm�֐����g�����ƂŁA�e�[�u�����̂��̂��폜���邱�Ƃ��o����

rm(stores7)
# �ϐ�stores7�̃e�[�u�����폜����


# ����(�J����)�̕��ёւ�
stores[,c(1,2,3,4)]
# �ϐ�stores�̑S�Ă̍s�ƁA1,2,3,4����o�͂���

stores <- stores[,c(1:5,16,6:15)]
# �ϐ�stores�ɁA�S�Ă̍s�ƁA1�`5��ځA16��ځA6�`15��ڂ�������

stores[,c(1:5,16,6:(ncol(stores)-1))]


# ���f�[�^�E�n���h�����O
# ���t�B���^�����O
# >, <, =>, =<�̕s�������g�����ƂŁA�C�ӂ̏����ɍ��v�����s���t�B���^�����O�o����
# &��and��g�ݍ��킹�邱�ƂŁA���������ł̃t�B���^�����O���\

res7 <- stores[stores$TotalSales > 200,]
# �ϐ�res7�ɕϐ�stores��TotalSales�̗�(�J����)�̒��Œl��200���傫���s��������

res8 <- stores[stores$TotalSales>200 & stores$Location =='Delhi',]
# �ϐ�res8�ɕϐ�stores��TotalSales�̗�(�J����)�̒��Œl��200���傫���A
# �X��Location�̗�(�J����)��Delhi�̍s��������


# ����(�J����)�̃t�B���^�����O�̑g�ݍ��킹
# Location��Delhi��Total Sales��200���傫���s�𒊏o���A�X��3�񂾂��𒊏o����

res9 <- stores[stores$TotalSales > 200 & stores$Location =='Delhi', c('Location','TotalSales','Profit')]
# �ϐ�res9�ɁA�ϐ�stores��TotalSales�̗�200���傫���A�X��Location�̗�Delhi�Ɠ������s�𒊏o���A
# 'Location','TotalSales','Profit'�̗񂾂��𒊏o���āA�������


# ��subset�֐�
# subset�֐��ł��A�s�Ɨ�̃t�B���^�����O���o����

res10 <- subset(stores,subset = TotalSales > 200 & Location == 'Delhi',select = c('Location','TotalSales','Profit'))
# �ϐ�res10�ɁA�ϐ�stores��TotalSales��200���傫���ALocation��'Delhi'�Ɠ������A
# 'Location','TotalSales','Profit'��𒊏o���A�������

res11 <- subset(stores,subset=TotalSales > 200 & Location=='Delhi',select = -2)
# �ϐ�res11�ɁA�ϐ�stores��TotalSales��200���傫���ALocation��'Delhi'�Ɠ������A
# 2��ڈȊO�̗�𒊏o���A�������
# select�֐���-(�}�C�i�X)�̈�����ݒ肷�邱�ƂŁA�C�ӂ̗�𗎂Ƃ����Ƃ��o����

res12 <- subset(stores,subset=TotalSales>200 & Location=='Delhi',select=c(-2,-3))
# �ϐ�res12�ɁA�ϐ�stores��TotalSales��200���傫���ALocation��'Delhi'�Ɠ������A
# 2�A3��ڈȊO�𒊏o���A�������

res13 <- subset(stores, subset = TotalSales > 200 & Location =='Delhi', select=c('Location','TotalSales','Profit'))
# �ϐ�res13�ɁA�ϐ�stores��TotalSales��200���傫���ALocation��'Delhi'�Ɠ������A
# 'Location','TotalSales','Profit'��𒊏o���āA�������

# ��which�֐�
# which�֐��ł��A�t�B���^�����O�͉\
# which�֐��́A�x�N�g�����̗v�f(�s�ԍ��A��ԍ��A�A���C�E�C���f�b�N�X)��TRUE/FALSE�ŕԂ��B
# which�֐���subset�֐��̒��Ŏg���Ȃ��_�ɒ��ӂ���

x1 <- c(1,5,8,4,6)
# �ϐ�x1�Ƀx�N�g���^�ŁA1,5,8,4,6��������

which(x1 == 5)
# which�֐����g���āA�ϐ�x1�Ɋi�[����Ă���u5�v�̈ʒu��Ԃ�
# ���̃R�[�h�����s�����2���Ԃ�
# �ϐ�x1�ɂ́A1,5,8,4,6���������Ă���A5��2�Ԗڂ̗v�f�ɂȂ邽�߁A2���Ԃ�

which(x1 != 5)
# which�֐����g���āA�ϐ�x1�Ɂu5�v���i�[����Ă��Ȃ��ʒu��Ԃ�
# ���̃R�[�h�����s�����1, 3, 4, 5���Ԃ�
# �ϐ�x1�ɂ́A1,5,8,4,6���������Ă���A5��2�Ԗڂ̗v�f�ɂȂ邽�߁A2�ȊO�̗v�f���Ԃ�
# which�֐���!(Not���Z�q)�Ƒg�ݍ��킹�Ďg�����Ƃ��\�ł���

stores[which(stores$TotalSales > 200 & stores$Location =='Delhi'),]
# �ϐ�stores��TotalSales��200���傫���ALocation��'Delhi'�Ɠ������s��ϐ�stores�ɑ������


# ���\�[�g�@�\
# order�֐����g���ƃx�N�g���Ɋi�[���ꂽ�v�f�������ŕ��ёւ��A�v�f����Ԃ�
# order�֐��͂����܂ŗv�f����Ԃ����߁A���p�I�ɂ�order�֐���[]�ň͂��Ďg�p����

v1 <- c(10,1,4)
# �ϐ�v1�Ƀx�N�g���^��10,1,4��������

order(v1)
# �ϐ�v1�Ɋi�[���ꂽ�v�f�������ŕ��ёւ���
# �ϐ�v1�ɂ́A10,1,4���i�[����Ă���A�����ŕ��ёւ����1,4,10�ƂȂ�
# order�֐����g���ƁA�v�f�ԍ�2(�܂�1)�A3(�܂�4)�A1(�܂�10)���Ԃ�

v1[order(v1)]
# �ϐ�v1�Ɋi�[���ꂽ�v�f�������ŕ��ёւ��āA�ϐ�v1���o�͂���
# ��������ƕϐ�v1�Ɋi�[���ꂽ�v�f�A10,1,4������1, 4, 10�ŕԂ�

v1[order(v1, decreasing = TRUE)]
# �ϐ�v1�Ɋi�[���ꂽ�v�f���~���ŕ��ёւ��āA�ϐ�v1���o�͂���
# ����decreasing = TRUE���w�肷��ƁA�x�N�g�����̗v�f���~���ŕ��ёւ��邱�Ƃ��o����
# �܂�A�ϐ�v1��10, 4, 1�ŕԂ�


# ���S�Ă̗�(�J����)���c���A�S�Ẵf�[�^��Profit����~���Ń\�[�g����

res14 <- stores[order(stores$Profit, decreasing=TRUE),]
# �ϐ�res14�ɁA�ϐ�stores��Profit����~���ŕ��ёւ��A�������
# ����ɂ���āA�ϐ�stores��Profit�񂪍~���ɂȂ�A���̗���c�����܂ܕϐ�res14�ɑ���ł���
# �������A�s�ԍ����ς�邽�߁A�����̌��ɂ��Ȃ�

res14 <- stores[order(stores$Location,-stores$TotalSales),]
# �ϐ�res14�ɁA�ϐ�stores��Location��������ŕ��ёւ��ATotalSales��������A�������


# ��dplyr�p�b�P�[�W���g�����\�[�g
# dplyr�p�b�P�[�W���g��������Base R���������\�[�g�o����

res15 <- dplyr::arrange(stores,Profit)
# �ϐ�res15�ɁAdplyr�p�b�P�[�W���g���ĕϐ�stores��Profit��������ɕ��ёւ��������
# dplyr�p�b�P�[�W�ł�Base R�R�[�h�Ɠ��l�Ɉ������w�肵�Ȃ��ƁA�����ł̕��ёւ��ɂȂ�

res16 <- dplyr::arrange(stores,desc(Profit))
# �ϐ�res16�ɁAdplyr�p�b�P�[�W���g���ĕϐ�stores��Profit����~���ɕ��ёւ��������
# �~���ŕ��ёւ������鎞�́A����desc�ō~�����w�肷��

# ��Location��������ŕ��ёւ��A���ёւ���Location���Profit����~���ŕ��ѕς���
# dplyr�p�b�P�[�W�͕�����ŏ����E�~����g�ݍ��킹�����ёւ��ɕ֗��ł���

res17 <- dplyr::arrange(stores,Location,desc(Profit)) 
# �ϐ�res17�ɁAdplyr�p�b�P�[�W���g���ĕϐ�stores��Location��������ŕ��ёւ��AProfit����~���ɕ��ёւ��������

res18 <- dplyr::arrange(stores,desc(StoreType),desc(StoreName)) 
# �ϐ�res18�ɁAdplyr�p�b�P�[�W���g���ĕϐ�stores��StoreType����~���ŕ��ёւ��AStoreName����~���ŕ��ёւ��������

# ���d���l�̍폜
# duplicated�֐����g���ƁA�ϐ����ɏd���l�̗L����TRUE/FALSE�ŕԂ�
# �����ł́A[]�Ɉ͂��ĕϐ����o�͂��āA�d���l�̗L���ł͂Ȃ��A�d���l�����̂��̂�Ԃ������𗧂�
# ���A!(Not���Z�q)�Ƒg�ݍ��킹�Ďg�����ƂŁA�ϐ����̃��j�[�N�Ȓl���o�͂ł���

# duplicated�֐���!(Not���Z�q)�̑g�ݍ��킹�ŁA���j�[�N�l(�s)�������o�͂ł��邽�߁A
# �f�[�^�Z�b�g���̏d���f�[�^�폜�ɂ��g����

v1 <- c(1,2,3,3,2,1)
# �ϐ�v1�Ƀx�N�g���^��1,2,3,3,2,1��������

duplicated(v1)
# �ϐ�v1�̏d���l��Ԃ�
# duplicated�֐����g���ƁA�ϐ����ɏd���l�̗L����TRUE/FALSE�ŕԂ�
# ���ׁ̈A���s���ʂ�1(FALSE), 2(FALSE), 3(FALSE), 3(TRUE), 2(TRUE), 1(TRUE)�ƂȂ�
# 4, 5, 6�Ԗڂ�3, 2, 1�͕ϐ�v1��2��o�����Ă���ׁA2��ڂ̏o���ƂȂ�4, 5, 6�Ԗڂɂ�True���Ԃ�

v1[duplicated(v1)]
# �ϐ�v1�̏d���l��Ԃ�
# duplicated�֐���[]�ň͂��ďo�͂���ƁATRUE/FALSE�̓񍀂ł͂Ȃ��A�d���l��Ԃ����Ƃ��o����
# �ϐ�v1�̏ꍇ�A3, 2, 1��Ԃ�

v1[!duplicated(v1)]
# �ϐ�v1�̔�d���l(�܂�A�d�����Ă��Ȃ��l|���j�[�N�Ȓl)��Ԃ�
# duplicated�֐���!(Not���Z�q)��g�ݍ��킹�邱�ƂŁA�ϐ����̃��j�[�N�Ȓl���o�͂ł���
# �ϐ�v1�̏ꍇ�A1, 2, 3���Ԃ�

res19 <- stores[!duplicated(stores$StoreType),]
# �ϐ�res19�ɁA�ϐ�stores��StoreType��̃��j�[�N�ȍs��������
# duplicated�֐��̎��p�I�Ȏg�����Ƃ��āA�d�������s���폜���A���j�[�N�ȍs�������c���g����������
# ���̗�ł́A�ϐ�res19�ɕϐ�stores��StoreType��̃��j�[�N�ȍs�����������Ă�

a <- stores[!(duplicated(stores$StoreType) & duplicated(stores$StoreName)),]
# �ϐ�a�ɁA�ϐ�stores��StoreType���StoreName��̔�d���s(�܂�A���j�[�N�s)��������
# ���̗�ł͕ϐ�a�ɁA�ϐ�stores��StoreType���StoreName��̏d���s���폜���A���j�[�N�ȍs�����������Ă���


# ���w���̃e�X�g�X�R�A�E�f�[�^���g������
# �����ł�Score_Class4�Ƃ���CSV�`���̊O���f�[�^���g���A�d���s���폜����

library(readr)
# readr�p�b�P�[�W�����[�h����

Score_Class4 <- read_csv("C:/Users/sho-kamura/Desktop/�g���[�j���O/AnalytiXLab/DataScience Using R/#7Data/Score_Class4.csv")
# �ϐ�Score_Class4�ɁA�w�肵���p�X��ɂ���CSV�t�@�C�����C���|�[�g���đ������
# ""(�_�u���E�N�I�e�[�V����)�Ŏw�肵���t�@�C���ǂݍ��݃p�X�́A�l�̃p�X�Ȃ̂œK�X�ύX���K�v

View(Score_Class4)
# �ϐ�Score_Class4���r���[����

Uniquerows <- Score_Class4[!duplicated(Score_Class4),]
# �ϐ�Uniquerows�ɁA�ϐ�Score_Class4�̔�d���s(�܂�A���j�[�N�s)��������
# ���̃R�[�h�ɂ���āA���S�ȏd���s���폜�����

Uniquestudent <- Score_Class4[!duplicated(Score_Class4$Student),] 
# �ϐ�Uniquestudent�ɁA�ϐ�Score_Class4��Student��̔�d���s(�܂�A���j�[�N�s)��������
# ���̃R�[�h�ɂ���āA�ϐ�Score_Class4��Student��̏d���s���폜�����
# �܂�AStudent��̐��k���ŏd�������s���폜�����


# �������l�̒u��
# is.na�֐����g���ƁA�ϐ�����NA(�����l)���܂܂�Ă��邩��TRUE/FALSE�ŕԂ�
# duplicated�֐����l�ɁAis.na�֐������̂܂܎g����ʂ͏��Ȃ�
# �����ł́A[]�Ɉ͂��ĕϐ����o�͂��āA�����l��C�ӂ̒l�ɒu������g�����̕����֗��ł���

m = NA
# �ϐ�m��NA(�����l)��������

is.na(m)
# �ϐ�m��NA(�����l)���܂܂�Ă��邩�ǂ�����Ԃ�

v1 <- c(1,2,NA,3)
# �ϐ�v1�Ƀx�N�g���^��1,2,NA,3��������

v1
# �ϐ�v1���o�͂���
# ���̎��_�ł́A�ϐ�v1�Ƀx�N�g���^��1,2,NA,3���������Ă���

v1[is.na(v1)] <- 5
# �ϐ�v1�Ɋ܂܂�Ă���NA(�����l)��5��������
# is.na�֐���[]�ň͂��A�ϐ�v1��NA(�����l)����肵�ANA(�����l)��5�������Ă���
# ���̃R�[�h���s��ɂ́A�ϐ�v1�Ƀx�N�g���^��1, 2, 5, 3���������Ă���


# �������X�Ɋւ���f�[�^���g������
# �ϐ�stores�Ƃ��ĊO���f�[�^��ǂݍ��݁ANA(�����l)��u������

stores$AcqCostPercust[is.na(stores$AcqCostPercust)] <-15
# �ϐ�stores��AcqCostPercust���NA(�����l)��15�ɒu������
# ���̃R�[�h���s��ɂ́A�ϐ�stores��NA(�����l)��15�ɒu�������

# �������l���폜���ĕ��ς��v�Z����
# ���ς��v�Z����ꍇ�́ANA(�����l)���폜���Ă���v�Z����̂��]�܂���
# NA(�����l)���܂܂�Ă���ƁA���ς��e�����󂯂邽�߂ł���
# NA(�����l)���폜����ɂ́Ana.rm = TRUE������ݒ肷��

AC <- stores$AcqCostPercust
# �ϐ�AC�ɁA�ϐ�stores��AcqCostPercust���������

mean(AC)
# �ϐ�AC�̕��ϒl���o�͂���

mean(AC, na.rm = TRUE)
# �ϐ�AC��NA(�����l)���������āA���ϒl���o�͂���
# na.rm������TRUE��ݒ肷�邱�ƂŁA�ϐ�����NA(�����l)���폜���āA���ς����߂邱�Ƃ��o����
# �ϐ�����NA(�����l)���c�����܂ܕ��ς��v�Z����ƁA���ς�NA(�����l)����e�����󂯂邽�߁A
# �{������ݒ肵�ĕ��ς����߂�������p�I�ł���


# ��NA(�����l)�ɕ��ϒl��������
# �f�[�^�Z�b�g����NA(�����l)�������ꍇ�́ANA(�����l)�𕽋ςɒu�������邱�Ƃ���ʓI�ł���
# ���A�u���́AMICE�p�b�P�[�W���g���Ă��o���邪�A�����ł͐G��Ȃ�

stores$AcqCostPercust[is.na(stores$AcqCostPercust)] <- mean(stores$AcqCostPercust)
# �ϐ�stores��AcqCostPercust���NA(�����l)�ɁA�ϐ�stores��AcqCostPercust��̕��ς�������


# ��NA(�����l)�̍폜
# na.omit�֐����g���ƁANA(�����l)���܂ލs���폜���邱�Ƃ��o����

clean <- na.omit(stores)
# �ϐ�clean�ɁA�ϐ�stores��NA(�����l)���܂ލs���폜���āA�������


# ���O��l�̃L���b�s���O
# �f�[�^�Z�b�g���ɖ��炩�ɑ傫���������͏����ȊO��l���܂܂�Ă���ꍇ�A���/�����̃L���b�v���|���邱�Ƃ��o����
# ���������O��l�́A���ς���U��/���U�ꂳ���傫�ȉe����^����ׁA�������K�v�ɂȂ�

stores$AcqCostPercust[stores$AcqCostPercust > 4] <- 2
# �ϐ�stores��AcqCostPercust��ŁA4���傫�Ȓl�����s�́A2�ɒu������

# �E����L���b�v�̐ݒ�
# �f�[�^�Z�b�g���ŋɒ[�ɑ傫�ȊO��l�ɂ͏���L���b�v���|����
# �ɒ[�ɑ傫�ȊO��l�́A���ς���U�ꂳ����

UC <- mean(stores$AcqCostPercust,na.rm = T) + sd(stores$AcqCostPercust,na.rm = T)
# �ϐ�stores��AcqCostPercust���NA(�����l)���폜���Ă���A���ς��v�Z����
# �ϐ�stores��AcqCostPercust���NA(�����l)���폜���Ă���A�W���΍����v�Z����
# �ϐ�UC�ɁA���ςƕW���΍��������đ������
# ���̃R�[�h�ɂ���āA����L���b�v���`���邱�Ƃ��o����
# ���AUC��Upper Cap�̗��ŏ���L���b�v��\��

# �E�����L���b�v
# �f�[�^�Z�b�g���ŋɒ[�ɏ����ȊO��l�ɂ͉����L���b�v���|����
# �ɒ[�ɏ����ȊO��l�́A���ς����U�ꂳ����

LC <- mean(stores$AcqCostPercust,na.rm = T) - sd(stores$AcqCostPercust,na.rm = T)

# �ϐ�stores��AcqCostPercust���NA(�����l)���폜���Ă���A���ς��v�Z����
# �ϐ�stores��AcqCostPercust���NA(�����l)���폜���Ă���A�W���΍����v�Z����
# �ϐ�LC�ɁA���ς���W���΍��������đ������
# ���̃R�[�h�ɂ���āA�����L���b�v���`���邱�Ƃ��o����
# ���ALC��Lower Cap�̗��ŉ����L���b�v��\��


# ���O��l�̓���
# ��`��������L���b�v�Ɖ����L���b�v���g�����ƂŁA�f�[�^�Z�b�g���̊O��l����肷�邱�Ƃ��o����

stores$AcqCostPercust[stores$AcqCostPercust > UC | stores$AcqCostPercust < LC]
# �ϐ�stores��AcqCostPercust��ŕϐ�UC���傫���Ȓl�����s�A
# �������͕ϐ�LC��菬���Ȓl�����s���o�͂���
# ���̃R�[�h�ɂ���āAUC(����L���b�v)���傫�Ȓl(�܂�A�傫�ȊO��l)��
# LC(�����L���b�v)��菬���Ȓl(�܂�A�����ȊO��l)����肷�邱�Ƃ��o����


# �E���肵���傫�ȊO��l������L���b�v�ɒu��
# �傫�ȊO��l����肵����A����L���b�v�ɒu������

stores$AcqCostPercust[stores$AcqCostPercust > UC] <- UC
# �ϐ�stores��AcqCostPercust��ŕϐ�UC���傫�Ȓl�����s���A�ϐ�UC�ɒu������
# ���̃R�[�h�ɂ���āAUC(����L���b�v)���傫�Ȓl(�܂�A�傫�ȊO��l)������L���b�v�ɒu���o����


# �E���肵�������ȊO��l�������L���b�v�ɒu��
# ���x�͏����ȊO��l���A�����L���b�v�ɒu������

stores$AcqCostPercust[stores$AcqCostPercust < LC] <- LC
# �ϐ�stores��AcqCostPercust��ŕϐ�LC��菬���Ȓl�����s���A�ϐ�LC�ɒu������
# ���̃R�[�h�ɂ���āALC(�����L���b�v)��菬���Ȓl(�܂�A�����ȊO��l)�������L���b�v�ɒu���o����


# �E���Ђ��}�ɂ��m�F
# ����E�����L���b�s���O���I�������A���Ђ��}�Ńf�[�^�Z�b�g�̕��z���m�F����
# ���Ђ��}��`�����ƂŎ��o�I�ɊO��l�����݂��Ă��Ȃ������m�F���邱�Ƃ��o����

boxplot(stores$AcqCostPercust)
# �ϐ�stores��AcqCostPercust��̔��Ђ��}���o�͂���

# ������
# �E�d���l�̓���ANA(�����l)�̒u���A�O��l�̓���A�L���b�s���O���A���p�I�ȃR�[�h������
# �E�O���f�[�^�̃C���|�[�g����A�f�[�^�E�n���h�����O�A�O���t�쐬�A���f�����O�܂ł̕W���v���Z�X�͑S�ĕW���������t�@�C��������Ă�����
# �E����Ȓ��q�ŁA���K���˂���R�R�[�h�̃��W���[������i�߂Ă�������

# �ȏ�