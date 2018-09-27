# 4��1�� �wDataScience Using R�x Day5

# ���O��܂ł̂��炷��
# �wDataScience Using R�xDay5��R�R�[�h�ł��B
# �ȑO�ɃA�b�v�����e�L�X�g�E�t�@�C�����������R�t�@�C���̕������m�ł��B
# �R�[�f�B���O�ɂ́A�ȉ������Q�Ƃ��������B

# ��Day5�̍\��
# �Emice�p�b�P�[�W���g���Ă̌����l�̓���
# �E�I�u�W�F�N�g�̍폜
# �E���x�����O(Binning)�ƃJ�e�S���[�ϐ��̍쐬
# �Eifelse�֐�
# �E�f�[�^�̌���
# - Merge�֐��̍\��
# - dplyr�p�b�P�[�W���g���ꍇ

#�E�f�[�^�̒ǉ�(Appending)
# - cbind()�֐�
# - rbind()�֐�

# �Epaste�֐�

# �E�O���[�v���̏W�v
# - dplyr�p�b�P�[�W���g�����ꍇ

# �E�p�C�v�@�\
# �E�J����(��)�̍폜

# �E�t�@�N�^�[
# �E�J�e�S���[�ϐ�
# - ���l�̕�����^�f�[�^���琔�l�^�f�[�^�ւ̕ϊ�
# - ���l�̗v���^�f�[�^�̃x�N�g���́A���l�^�f�[�^�ɕϊ����鎞�̒��ӓ_
# - factor�֐��Aordered�֐����g���ẴJ�e�S���[�ϐ��ւ̕ϊ�


# ��Day5�̃S�[��
# �E�O��l�ƌ����l�̈��������K������
# �E�I�u�W�F�N�g�̍폜�A���x�����O(Binning)�ƃJ�e�S���[�ϐ��̍쐬�Aifelse�֐����K������
# �E�f�[�^�̌����A�f�[�^�̒ǉ��A�p�C�v�@�\���K������
# �E�t�@�N�^�[�̊T�O�𗝉�����
# �E�J�e�S���[�ϐ��A���ɕϐ��Ԃɏ����̗L�閳���𗝉�����


# ���O���f�[�^�̃C���|�[�g

library(readr)
# readr�p�b�P�[�W�����[�h����

stores <- read_csv("C:/Users/sho-kamura/Desktop/�g���[�j���O/AnalytiXLab/DataScience Using R/#7Data/stores.csv")
# �ϐ�stores�ɁAC:/Users/sho-kamura/Desktop/�g���[�j���O/AnalytiXLab/DataScience Using R/#7Data/�ɒu����Ă���stores.csv�t�@�C����ǂݍ��݁A�������

View(stores)
# �ϐ�stores���r���[����


# ��mice�p�b�P�[�W���g���āANA(�����l)��u������

install.packages("mice")
# �p�b�P�[�Wmice���C���X�g�[������

library(mice)
# �p�b�P�[�Wmice�����[�h����

s <- mice(data = stores, m = 2, method = "pmm", maxit = 5, seed = 500)
# mice�p�b�P�[�W���g��
# �ϐ�stores���f�[�^�Z�b�g�Ƃ��Ďg�p�Apmm(���ϗ\���}�b�`���O)�Œu���A5��̔����񐔁A500����J�n����
# �ϐ�s�ɑ������


# ��mice�p�b�P�[�W�Ŏg���Ă�������̈Ӗ��͈ȉ��̒ʂ�
# �Em
# m��2��ނ̒u���̉\�������邱�Ƃ�\��
# �܂�A�����l�ɑ΂��āA�u���ł���l��2���邱�Ƃ�����

# �Emaxit
# maxit�́A�A���S���Y���������l��u������l���v�Z����̂ɕK�v�Ȕ���(���[�v)�񐔂�����

# �Emethod
# method�́A�u�����s������@������

# pmm�́APredictive Mean Matching�̗��ŁA�\�����σ}�b�`���O��\��
# logreg�́ALogistic Regression�̗��ŁA���W�X�e�b�N��A��\��

# ��L�ȊO�̏ڍׂ𒲂ׂ����ꍇ�́A?mice()�Œ��ׂ邱�Ƃ��\

ImputedValues <- s$imp
# �ϐ�ImputedValues�ɁA�ϐ�s��imp���������

completeData <- complete(s,2)
# �ϐ�completeData�ɁA�ϐ�s�ɒu�����2�ɒu�����āA�������
# �����l�̒u����₪2����ׁAcomplete�֐����g�����ƂŁA�����l��u�����邱�Ƃ��ŋ���


# ���I�u�W�F�N�g�̍폜
# rm�֐����g�����ƂŁA�I�u�W�F�N�g���폜���邱�Ƃ��o����
# rm�́Aremove��rm�Ɗo����

rm(s)
# �ϐ�s���폜����


# ���r�j���O�ƃJ�e�S���[�쐬
# �p���^�ϐ��͈̔͂�C�ӂɒ�`���邱�Ƃ��o����
# �Ⴆ��100�ȉ���'Low'�A100�`200��'Mid'�A200�`300��'High'���A�C�ӂ͈̔͂Œ�`�o����

# �ϐ�stores��TotalSales���ΏۂɐV���ȃJ�e�S���[���ǉ�����
# �ϐ�stores��TotalSales��̒l���ȉ��̊��'Low', 'Mid', 'High', 'VeryHigh'��4�J�e�S���[�ɕ��ނ���
# �ǉ�����V���ȗ��PerformanceCat(�p�t�H�[�}���X����)�Ɩ��Â���


# ��TotalSales��̒l�Ɋ�Â�PerformanceCat��̕��ފ
# TotalSales < 100 - "Low"
# TotalSales��̒l��100��菬��������'Low'�ƒ�`����

# TotalSales >= 100 and < 200 - 'Mid'
# TotalSales��̒l��100�ȏ�A200�����̎���'Mid'�ƒ�`����

# TotalSales = 200-300 - 'High'
# TotalSales��̒l��200�`300�̊Ԃ̏ꍇ��'High'�ƒ�`����

# TotalSales > 300 - 'VeryHigh'
# TotalSales��̒l��300���傫���ꍇ��'VeryHigh'�ƒ�`����


# ����L�̕��ފ������R�R�[�h�Ŏ���
stores$PerformanceCat <- 'Low'
# �ϐ�stores��PerformanceCat���'Low'��������

stores$PerformanceCat[stores$TotalSales >=100 & stores$TotalSales <200] <- 'Mid'
# �ϐ�stores��TotalSales��100�ȏ�ŁA200�����̏ꍇ�́APerformanceCat���'Mid'��������
# []����'Mid'�̕��ފ���`����

stores$PerformanceCat[stores$TotalSales >=200 & stores$TotalSales <300] <- 'High'
# �ϐ�stores��TotalSales��200�ȏ�ŁA300�����̏ꍇ�́APerformanceCat���'High'��������

stores$PerformanceCat[stores$TotalSales >=300] <- 'Very High'
# �ϐ�stores��TotalSales��300�ȏ�̏ꍇ�́APerformanceCat���'very High'��������

stores$PerformanceCat[is.na(stores$TotalSales)] <- 'NA'
# �ϐ�stores��TotalSales�񂪌����l�̏ꍇ�́APerformanceCat���'NA'��������

# ��ifelse��
# ifelse�\���́Aifelse(����, <�^�̒l>, <�U�̒l>)�ƂȂ�
# ifelse�����g�����Ƃŏ�����������邱�Ƃ��o���A�X�ɏ�������ɉ����Ēl��ϐ��Ɋi�[���邱�Ƃ��o����

x <- -10
# �ϐ�x��-10��������

ifelse(x > 0,'positive','negative')
# �ϐ�x��0���傫���ꍇ�́A'positive'��Ԃ��A�����łȂ��ꍇ��'negative'��Ԃ�
# ����ifelse���ł́A�ϐ�x��-10�̂��߁A0��菬�������߁A'negative'���Ԃ�

stores$PC <- ifelse(stores$TotalSales < 100, 'Low', 'High')
# �ϐ�stores��PC��ɁATotalSales��100��菬�����ꍇ��'Low'��Ԃ��A�����łȂ��ꍇ��'High'��Ԃ�
# ifelse���ŏ������򂳂��āA�ϐ��ɒl���������邱�Ƃ��\�ł���


# ���l�X�g������ifelse��
# ifelse������ifelse���������A�l�X�g�����邱�Ƃ��o����

ifelse(x == 0, 'zero',ifelse(x > 0, 'positive','negative'))
# �ϐ�x��0�Ɠ������ꍇ�́A'zero'��Ԃ��A
# �ϐ�x��0���傫���ꍇ�́A'positive'��Ԃ��A�����łȂ��ꍇ��'negative'��Ԃ�


# ��ifelse�����g����TotalSales��̒l������'Low','Mid','High'��PerformanceCat��ɑ������
# ��̕��ފ�����ɁAifelse�����g���Ď�������Ɖ��L�̂悤�ɂȂ�

stores$PC <- ifelse(stores$TotalSales < 100,'Low',
# �ϐ�stores��TotalSales��100��菬�����ꍇ��'Low'��PC��ɑ������
      
      ifelse(stores$TotalSales <= 200,'Mid',
      # �ϐ�stores��TotalSales��200�ȉ��̏ꍇ��'Mid'��PC��ɑ������
      
          ifelse(stores$TotalSales <= 300,'High','Very High')))
          # �ϐ�stores��TotalSales��300�ȉ��̏ꍇ��'High'���A����ȊO�̏ꍇ��'Very High'��PC��ɑ������

res1 <- stores[c('TotalSales','PC')]
# �ϐ�res1�ɁA�ϐ�stores��TotalSales���PC���������

res1$PC <- as.factor(res1$PC)
# �ϐ�res1��PC��ɁA�����v���^(�t�@�N�^�[)�ϐ��ɕϊ����đ������

summary(res1$PC)
# �ϐ�res1��PC���v�񂵂ďo�͂���

# ���f�[�^�̌���
# �f�[�^�̌����́A���̃e�[�u������J����(��)��ǉ����邱�Ƃ��w��
# Excel��vlookup�֐��ɑ�������@�\�ɂȂ�

# ��Merge�֐�
# Merge�֐��̍\���́Amerge(x = �e�[�u����1, y = �e�[�u����2, by.x = �e�[�u����1�̃J����(��), by.y= �e�[�u����2�̃J����(��) all)�ƂȂ�

# �EInner Join
# Inner Join�́A��̃e�[�u�����ŋ��ʂ���s��������������
# Merge�֐��̃f�t�H���g������Inner Join�ɂȂ�


# �EFull Join
# Full Join�́A��̃e�[�u���̑S�Ă̍s����������
# ����all = True�ɐݒ肷���Full Join�ɂȂ�

# �ELeft Join
# Left Join�́A��̃e�[�u���̈�ڂ̃e�[�u���̑S�f�[�^�����o���A
# ��ڂ̃e�[�u�����ň�ڂ̃e�[�u���Ƌ��ʂ����s��������������
# ����all.x = True�ɐݒ肷���Left Join�ɂȂ�

# �ERight Join
# Right Join�́A��̃e�[�u���̓�ڂ̃e�[�u���̑S�f�[�^�����o���A
# ��ڂ̃e�[�u�����œ�ڂ̃e�[�u���Ƌ��ʂ����s��������������
# ����all.y = True�ɐݒ肷���Right Join�ɂȂ�


# ��JOIN���g���Ẵe�[�u������
# JOIN���g���ē�̈قȂ�e�[�u�����������邱�Ƃ��o����

# �E��̈قȂ�e�[�u���ŁA���ʗ�̖��O�������ꍇ
# �Ⴆ�΁A��̈قȂ�e�[�u���ɋ��ʂ̗�CustomerID���������ꍇ�Aby = "CustomerID"�Ǝw�肷�邱�ƂŁA���ʗ���w��ł���

# �E��̈قȂ�e�[�u���ŁA���ʗ�̖��O���قȂ�ꍇ
# ��̃e�[�u���ԂŁA���ʗ�̖��O���قȂ�ꍇ�́Aby.x = "CustomerID", by.y = "CustID"�Ǝw�肷��


# ���f�[�^�̃C���|�[�g

library(readr)
# readr�p�b�P�[�W�����[�h����

demographic <- read_csv("C:/Users/sho-kamura/Desktop/�g���[�j���O/AnalytiXLab/DataScience Using R/#7Data/Demographic_Data_Class4.csv")
# "C:/Users/sho-kamura/Desktop/�g���[�j���O/AnalytiXLab/DataScience Using R/#7Data/�p�X��ɂ���
# Demographic_Data_Class4��CSV�t�@�C�����A�ϐ�Demographic_Data_Class4�ɑ������

View(demographic)
# �ϐ�Demographic���r���[����

library(readr)
# readr�p�b�P�[�W�����[�h����

txn <- read_csv("C:/Users/sho-kamura/Desktop/�g���[�j���O/AnalytiXLab/DataScience Using R/#7Data/Transaction_Summary _Class4.csv")
# "C:/Users/sho-kamura/Desktop/�g���[�j���O/AnalytiXLab/DataScience Using R/#7Data/�p�X��ɂ���
# Transaction_Summary_Class4��CSV�t�@�C�����A�ϐ�Transaction_Summary_Class4�ɑ������

View(txn)
# �ϐ�txn���r���[����


# ��InnerJoin�ł̃e�[�u������
InnerJoin <- merge(x = demographic, y = txn,
# �t�@�C��demographic��txn���}�[�W����
                   by.x = "CustName", by.y = "CustomerName")
                    # demographic��CustName���txn��CustomerName������ʗ�Ɏw�肵�A�ϐ�InnerJoin�ɑ������

View(InnerJoin)
# �ϐ�InnerJoin���r���[����

# ��FullJoin�ł̃e�[�u������
FullJoin <- merge(x = demographic, y = txn,
# �t�@�C��demographic��txn���}�[�W����
                  by.x = "CustName",by.y = "CustomerName",all = TRUE)
                  # demographic��CustName���txn��CustomerName������ʗ�Ɏw�肵�AFull Join�Ō������A�ϐ�FullJoin�ɑ������

View(FullJoin)
# �ϐ�FullJoin���r���[����


# ��LeftJoin�ł̃e�[�u������
LeftJoin <- merge(x = demographic, y = txn,
# �t�@�C��demographic��txn���}�[�W����
                  by.x = "CustName",by.y = "CustomerName",all.x = TRUE)
                  # demographic��CustName���txn��CustomerName������ʗ�Ɏw�肵�ALeft Join�Ō������āA�ϐ�FullJoin�ɑ������

View(LeftJoin)
# �ϐ�LeftJoin���r���[����


# ��RightJoin�ł̃e�[�u������
RightJoin <- merge(x = demographic, y = txn,
# �t�@�C��demographic��txn���}�[�W����
                   by.x = "CustName",by.y = "CustomerName",all.y = TRUE)
                    # demographic��CustName���txn��CustomerName������ʗ�Ɏw�肵�ARight Join�Ō������āA�ϐ�FullJoin�ɑ������

View(RightJoin)
# �ϐ�RightJoin���r���[����


# ��dplyr�p�b�P�[�W���g���Ă̌���
# Base R��Merge�֐��ƍ��킹�āAdplyr�p�b�P�[�W���g���Ă��������o����
# �������AJoin�̎�ނ��ꕔ�AMerge�֐��ƈقȂ�̂Œ��ӂ��K�v�ɂȂ�

# dplyr�p�b�P�[�W���g�����\���́A���L�̒ʂ�

# dplyr::jointype(x,y,by=)

# jointype��inner_join�Aleft_join�Aright_join�Asemi_join�Aanti_join�Ȃ�Join�̎�ނ��w�肷��
# x�ň�ڂ̃e�[�u�����w�肵�Ay�œ�ڂ̃e�[�u�����w�肷��
# by=�ň�ڂƓ�ڂ̃e�[�u���ł̋��ʗ񖼂�=�łȂ��Ŏw�肷��

library(dplyr)
# dplyr�p�b�P�[�W�����[�h����

# ��dplyr�p�b�P�[�W���g����InnerJoin�ł̃e�[�u������

IJ <- dplyr::inner_join(demographic,txn,by=c("CustName"="CustomerName"))
# dplyr�p�b�P�[�W���g���āAdemographic��txn��InnerJoin�Ō�������

# demographic�t�@�C����CustName���txn�t�@�C����CustomerName������ʗ�Ɏw�肵�A�ϐ�IJ�ɑ������
# �ϐ�IJ��InnerJoin�̗��ł���

View(IJ)
# �ϐ�IJ���r���[����


# ��dplyr�p�b�P�[�W���g����LeftJoin�ł̃e�[�u������

LJ <- dplyr::left_join(demographic,txn,by= c("CustName"="CustomerName"))
# dplyr�p�b�P�[�W���g���āAdemographic��txn��LeftJoin�Ō�������

# demographic�t�@�C����CustName���txn�t�@�C����CustomerName������ʗ�Ɏw�肵�A�ϐ�LJ�ɑ������
# �ϐ�LJ��LeftJoin�̗��ł���

View(LJ)
# �ϐ�LJ���r���[����


# ��dplyr�p�b�P�[�W���g����RightJoin�ł̃e�[�u������

RJ <- dplyr::right_join(demographic,txn,by= c("CustName"="CustomerName"))
# dplyr�p�b�P�[�W���g���āAdemographic��txn��RightJoin�Ō�������
# demographic�t�@�C����CustName���txn�t�@�C����CustomerName������ʗ�Ɏw�肵�A�ϐ�RJ�ɑ������
# �ϐ�RJ��RightJoin�̗��ł���

View(RJ)
# �ϐ�RJ���r���[����


# ��dplyr�p�b�P�[�W���g����SemiJoin�ł̃e�[�u������
# SemiJoin�́AInnerJoin�Ɠ��l�ɓ�̃e�[�u���̋��ʂ����s��Ԃ�
# �������A�J����(��)�́A��ڂ̃e�[�u���̗񂾂���Ԃ�

SJ <- dplyr::semi_join(demographic,txn,by= c("CustName"="CustomerName"))
# dplyr�p�b�P�[�W���g���āAdemographic��txn��SemiJoin�Ō�������
# demographic�t�@�C����CustName���txn�t�@�C����CustomerName������ʗ�Ɏw�肵�A�ϐ�SJ�ɑ������
# �ϐ�SJ��SemiJoin�̗��ł���

View(SJ)
# �ϐ�SJ���r���[����

summary(demographic$CustName)
# demographic�t�@�C����CustName��̗v����o�͂���

summary(txn$CustomerName)
# txn�t�@�C����CustmerName��̗v����o�͂���


# ��dplyr�p�b�P�[�W���g����AntiJoin�ł̃e�[�u������
# AntiJoin�́ALeftJoin�Ɠ��l�ɓ�̃e�[�u���̈�ڂ̃e�[�u���̑S�f�[�^�����o���A
# ��ڂ̃e�[�u�����ň�ڂ̃e�[�u���Ƌ��ʂ����s��������������
# �������A�J����(��)�́A��ڂ̃e�[�u���̗񂾂���Ԃ�

AJ <- dplyr::anti_join(demographic,txn,by= c("CustName"="CustomerName"))
# dplyr�p�b�P�[�W���g���āAdemographic��txn��AntiJoin�Ō�������
# demographic�t�@�C����CustName���txn�t�@�C����CustomerName������ʗ�Ɏw�肵�A�ϐ�AJ�ɑ������
# �ϐ�AJ��AntiJoin�̗��ł���

View(AJ)
# �ϐ�AJ���r���[����


# ���o�C���f�B���O�ƃy�[�X�e�B���O
# �o�C���f�B���O�ƃy�[�X�e�B���O�́A�A�y���f�B���O�Ƃ͈قȂ�̂Œ��ӂ��K�v
# �o�C���f�B���O�́Arbind�֐���cbind�֐����g��

# Same no of columns and With same column names
rbind() # row bind
# rbind�֐��́A�s�����ɕϐ����܂Ƃ߂�
# rbind�֐��́A��̃e�[�u���̃��E(�s)���������K�v������

# Same no of rows
cbind()
# cbind�֐��́A������ɕϐ����܂Ƃ߂�
# cbind�֐��́A��̃e�[�u���̃J����(��)���������K�v������


v1 <- c(1,2,3)
# �ϐ�v1�Ƀx�N�g���^��1,2,3��������

v2 <- c('A','B','C')
# �ϐ�v2�Ƀx�N�g���^��'A','B','C'��������

v3 <- c('D','E','F')
# �ϐ�v3�Ƀx�N�g���^��'D','E','F'��������

v4 <- c(4,'A','D')
# �ϐ�v4�Ƀx�N�g���^��4,'A','D'��������

v5 <- c(1,2,3)
# �ϐ�v5�Ƀx�N�g���^��1,2,3��������

df <- data.frame(v1,v2)
# �ϐ�df�Ƀf�[�^�E�t���[���^�ŕϐ�v1(�i�[����Ă���l��1,2,3)�ƕϐ�v2(�i�[����Ă���l��'A','B','C')��������

df2 <- data.frame(v5)
# �ϐ�df2�Ƀf�[�^�E�t���[���^�ŕϐ�v5(�i�[����Ă���l��1,2,3)��������

r1 <- cbind(df,v3)
# �ϐ�r1�ɕϐ�df�ƕϐ�v3��cbind�֐����g���āA�����(�c����)�ɕ��ׂĂ܂Ƃ߂āA�������
# ���s����ƃf�[�^�E�t���[���^�ϐ�df�Ɋi�[���ꂽ�x�N�g���^�ϐ�v1��v2�Av3���c�����ɕ��сA�܂Ƃ߂���

r1
# �ϐ�r1���o�͂���

r2 <- rbind(df,v4)
# �ϐ�r2�ɕϐ�df�ƕϐ�v4��rbind�֐����g���āA�s����(������)�ɕ��ׂĂ܂Ƃ߂āA�������

r2
# �ϐ�r2���o�͂���

r3 <- rbind(df,df2)
# �ϐ�r3�ɕϐ�df�ƕϐ�df2��rbind�֐����g���āA�s����(������)�ɕ��ׂĂ܂Ƃ߂āA�������
# ���s����ƃG���[���Ԃ�


# ��Paste�֐�
# Paste�֐����g���ƁA��̕ϐ��̒l����؂蕶���Ō������邱�Ƃ��o����

a <- c("a","b","c")
# �ϐ�a�Ƀx�N�g���^�ϐ���"a","b","c"��������

b <- c("y","w","q")
# �ϐ�b�Ƀx�N�g���^�ϐ���"y","w","q"��������

paste(a,b,sep = "_")
# paste�֐����g���āA�ϐ�a�ƕϐ�b��_(�A���_�[�o�[)���g���āA��������
# ���̃R�[�h�̏o�͌��ʂ́A"a_y" "b_w" "c_q"�ƂȂ�


# ���O���[�v���̏W�v
# �O���[�v���̏W�v���s�����Ƃ�Excel�̃s�{�b�g�E�e�[�u���W�v���\�ɂȂ�
# R�ł̃O���[�v���̏W�v�ɂ͓�̕��@������

# 1�߂�Base R��Group By�֐����g�����@
# �������dplyr�p�b�P�[�W���g�����@�ł���
# �����ł�dplyr�p�b�P�[�W���g�����@���Љ��

# ��dplyr�p�b�P�[�W���g�����@
# dplyr�p�b�P�[�W���g���ꍇ�́A�ȉ��̍\���ɂȂ�
# dplyr - group_by() + summarise() or mutate()

t <- dplyr::group_by(stores, Location)
# �ϐ�t�ɁAdplyr�p�b�P�[�W���g���āA�ϐ�stores��Location��ŃO���[�v������

t
# �ϐ�t���o�͂���

Result <- dplyr::summarise(t, SumOfTotalSales = sum(TotalSales))
# �ϐ�Result�ɁAdplyr�p�b�P�[�W���g���āA�ϐ�t��v�񂷂�
# �ϐ�TotalSales�̍��v�l��SumOfTotalSales�ɑ������

Result2 <- dplyr::mutate(t, SumOfTotalSales = sum(TotalSales))
# �ϐ�Result2�ɁAdplyr�p�b�P�[�W���g���āA�ϐ�t�ɒǉ�����
# �ϐ�TotalSales�̍��v�l��SumOfTotalSales�ɑ������


# ��%>%(�p�C�v)�@�\
# %>%(�p�C�v)�@�\���g���ƁAR�̃R�[�h���Ȃ����Ƃ��o����

library(dplyr)
# dplyr�p�b�P�[�W�����[�h����

res3 <- dplyr::group_by(stores,Location) %>% dplyr::summarise(sumofTotalSales = sum(TotalSales))
# �ϐ�res3��dplyr�p�b�P�[�W���g���āA�ϐ�stores��Location����O���[�v������
# �p�C�v�@�\�łȂ�
# dplyr�p�b�P�[�W���g���āA�ϐ�stores��TotalSales������v���āAsumofTotalSales��Ƃ��ėv�񂷂�
# ��L��ϐ�res3�ɑ������

# ��L�̃R�[�h�����s����ƁALocation(Chennai, Delhi, Kolkata, Mumbai)���Ƃ�TotalSales�̍��v���W�v���邱�Ƃ��o����

View(res3)
# �ϐ�res3���r���[����

Res <- stores %>% dplyr::group_by(Location, StoreType) %>%
  # �ϐ�res�ɕϐ�stores��������
  # �p�C�v�@�\�łȂ�
  # dplyr�p�b�P�[�W���g���āALocation���StoreType����O���[�v������
  # �p�C�v�@�\�łȂ�
  dplyr::summarise(SumOfTotalSales = sum(TotalSales), AvgofOC = mean(OperatingCost))
  # dplyr�p�b�P�[�W���g���āA�ϐ�stores��TotalSales������v���āAsumofTotalSales��Ƃ��ėv�񂷂�
  # dplyr�p�b�P�[�W���g���āA�ϐ�stores��OperatingCost��̕��ς��AAvgofOC��Ƃ��ėv�񂷂�
  

# ��dplyr�p�b�P�[�W���g�����J����(��)�̍폜
# dplyr�p�b�P�[�W���g���A�J����(��)�폜���s�����Ƃ��o����
# mutate�֐���NULL���g��

c <- stores %>% dplyr::mutate(StoreCode = NULL)
# �ϐ�c�ɕϐ�stores��������
# �p�C�v�@�\�łȂ�
# dplyr�p�b�P�[�W���g���AStoreCode����폜����


# ���v���^�ϐ�(�t�@�N�^�[)
# ������^�̕ϐ��ŁA�f�[�^��Ƃ��Đ��ʁA�����A�s�s���Ȃǂ���������
# R�ɂ����ăt�@�N�^�[�́A1����n�Ԗڂ܂ŏ����Ő��l���U��ꐔ�l�^�f�[�^�Ƃ��ĕۑ������
# �S�Ẵ��x���́A�A���t�@�x�b�g���ŕۑ������

class(stores$StoreType)
# �ϐ�stores��StoreType��̃f�[�^�^��Ԃ�

summary(stores$StoreType)
# �ϐ�stores��StoreType��̗v���Ԃ�

f <- as.numeric(stores$StoreType) 
# �ϐ�f�ɁA�ϐ�stores��StoreType��𐔒l�^�f�[�^�ɕϊ����đ������
# as.numeric�֐��́A�ϐ��̃f�[�^�^�𐔒l�^�ɕϊ�����


# ��������^�f�[�^��v���^�f�[�^�ɕϊ������A������^�f�[�^�̂܂܃C���|�[�g����
# read.csv�֐��̃p�X�w�蒼���,stringsAsFactors = FALSE�̈�����ݒ肷�邱�ƂŁA
# ������^�f�[�^��v���^�f�[�^�ɕϊ������A���̂܂ܕ�����^�f�[�^�Ƃ��ăC���|�[�g�o����悤�ɂȂ�

library(readr)
# readr�p�b�P�[�W�����[�h����

stores2 <- read.csv("C:/Users/sho-kamura/Desktop/�g���[�j���O/AnalytiXLab/DataScience Using R/#7Data/stores.csv",stringsAsFactors = FALSE)
# �ϐ�stores2�ɁAC:/Users/sho-kamura/Desktop/�g���[�j���O/AnalytiXLab/DataScience Using R/#7Data/�ɒu����Ă���stores.csv�t�@�C����ǂݍ��݁A�������
# stringsAsFactors = FALSE�̈�����ݒ肷�邱�ƂŁA������^�f�[�^��v���^�f�[�^�ɕϊ�����Ȃ��Ȃ�


# �����l�̕�����^�f�[�^�̃x�N�g���́A�ȒP�ɐ��l�^�f�[�^�ɕϊ��o����
# ������^�f�[�^�𐔒l�^�f�[�^�ɕϊ�����ɂ́Aas.numeric�֐����g��

c1 <- c("45","66","34","66","45","34","56","45","66")
# �ϐ�c1�ɁA������^�f�[�^�̃x�N�g����"45","66","34","66","45","34","56","45","66"��������
# �����ł́A���l��""(�_�u���E�N�I�e�[�V����)�ň͂��A���l�^�f�[�^�Ƃ��Ăł͂Ȃ��A������^�f�[�^�Ƃ��Ĉ����Ă���

class(c1)
# �ϐ�c1�̃f�[�^�^���o�͂���
# ��L�̒ʂ�A���l��""(�_�u���E�N�I�e�[�V����)�ň͂��Ă��邽�߁A�f�[�^�^�͕�����^�ɂȂ�

as.numeric(c1)
# �ϐ�c1�̃f�[�^�^�𐔒l�^�f�[�^�ɕϊ�����

# �����l�̗v���^�f�[�^�̃x�N�g���́A���l�^�f�[�^�ɕϊ�����ƃ��x���E�C���f�b�N�X���Ԃ����
# ���ۂ̒l�ł͂Ȃ��̂ŁA���ӂ��K�v

f1 <- c("45","66","34","66","45","34","56","45","66")
# �ϐ�f1�ɁA������^�f�[�^�̃x�N�g����"45","66","34","66","45","34","56","45","66"��������

f1 <- as.factor(f1)
# �ϐ�f1�ɁA�ϐ�f1��v�����f�[�^�ɕϊ����āA�������

f1
# �ϐ�f1���o�͂���

as.numeric(f1)
# �ϐ�f1�𐔒l�^�f�[�^�ɕϊ�����
# ���l�^�f�[�^�ɕϊ�����ƁA1�`n�̐��l�ɕϊ�����邪�A����͊ԈႢ�ɂȂ�


# �����l�̗v���^�f�[�^�̃x�N�g���́A�܂�������^�f�[�^�ɕϊ����A���ꂩ�琔�l�^�ɕϊ�����
# �v���^�f�[�^�����̂܂ܐ��l�^�f�[�^�ɕϊ�����ƃG���[�ɂȂ邪�A��x�A������^�f�[�^�ɕϊ����Ă���A
# ���l�^�f�[�^�ɕϊ����邱�ƂŁA�G���[������邱�Ƃ��o����

as.numeric(as.character(f1))
# �ϐ�f1�𕶎���^�f�[�^�ɕϊ����A���l�^�f�[�^�ɕϊ�����


# ��factor�֐��Aordered�֐����g���ẴJ�e�S���[�ϐ��ւ̕ϊ�
# �Ⴆ�΁A�ϐ�v1��1, 2, 3�Ƃ��ăR�[�f�B���O����Ă���
# 1��ԁA2��A3��΂ɂ�����
# �����������ꍇ�Afactor�֐��Aordered�֐����g�����ƂŁA1,2,3�Ƃ��������l�^�f�[�^�ɐ�, ��, ���F�Ƃ��������x����t���邱�Ƃ��o����

# �J�e�S���[�E�f�[�^�ɂ́Afactor�֐����g���A�����������f�[�^�ɂ�ordered�֐����g��
# �J�e�S���[�E�f�[�^�́A�ԁA�A���Ȃǂŏ����֌W���Ȃ��f�[�^���w��
# �����������f�[�^�́A���A���A��̏����֌W������f�[�^���w��


# ��factor�֐����g���Đ��l�^�f�[�^���J�e�S���[�E�f�[�^�ɕϊ�����
v1 <- c(11,22,33,11)
# �ϐ�v1�Ƀx�N�g���^�ϐ���11,22,33,11��������

v1 <- factor(v1,levels = c(1,2,3),labels = c("red", "blue", "green"))
# �ϐ�v1�̃��x����1, 2, 3�ɐݒ肵�A���x��"red", "blue", "green"��ݒ肵�āA�ϐ�v1�ɑ������


# ��ordered�֐����g���Đ��l�^�f�[�^�������֌W�̂���f�[�^�ɕϊ�����
v2 <- c(1,2,3,2)
# �ϐ�v2�Ƀx�N�g���^�ϐ���1,2,3,2��������

v2 <- ordered(v2,levels = c(1,2,3), labels = c("Low", "Medium", "High"))
# �ϐ�v2�Ƀ��x����1, 2, 3�̏��Ԃɐݒ肵�A���x��"Low", "Medium", "High"��ݒ肵�A�ϐ�v2�ɑ������

v2 <- ordered(v2, labels = c("Low", "Medium", "High"))
# �ϐ�v2�Ƀ��x����1, 2, 3�̏��Ԃɐݒ肵�A���x��"Low", "Medium", "High"��ݒ肵�A�ϐ�v2�ɑ������

v2[v2>2]
# 2���傫���ϐ�v2���o�͂���

v2[v2>'Low']
# 'Low'���傫���ϐ�v2���o�͂���

class(v2)
# �ϐ�v2�̃f�[�^�^���o�͂���

as.numeric(v2)
# �ϐ�v2�𐔒l�^�f�[�^�ɕϊ�����


# ������
# �E��������600�s�B�O�b�^�����R�B
# �E��b�I��R�R�[�f�B���O�̊����͑啪�A�g�ɕt���Ă���
# �E�Ӗ��s���ȃG���[�ɔY�܂���邱�ƂȂ��A�T�N�T�N���Ă��܂�


# �ȏ�