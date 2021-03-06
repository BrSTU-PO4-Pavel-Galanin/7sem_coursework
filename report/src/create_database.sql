
CREATE TABLE КомИнвент
(
	КодКомиссии  INTEGER NOT NULL AUTO_INCREMENT,
	Наименование  CHAR(120) NULL,
	UNIQUE КодКомиссии (КодКомиссии)
)
;



ALTER TABLE КомИнвент
	ADD  PRIMARY KEY (КодКомиссии)
;



CREATE TABLE ОП_ИнвенОпис
(
	КодИнвенОпис  INTEGER NOT NULL AUTO_INCREMENT,
	Дата  DATE NOT NULL,
	КодКомиссии  INTEGER NULL,
	КодМоейОрг  INTEGER NULL,
	КодМестаХран  INTEGER NULL,
	UNIQUE КодИнвенОпис (КодИнвенОпис)
)
;



ALTER TABLE ОП_ИнвенОпис
	ADD  PRIMARY KEY (КодИнвенОпис)
;



CREATE TABLE ОП_ПриказСоздКомИнвент
(
	КодПриказСоздКомИнвент  INTEGER NOT NULL AUTO_INCREMENT,
	Дата  DATE NOT NULL,
	КодМоейОрг  INTEGER NULL,
	КодКомиссии  INTEGER NULL,
	КодМестаХран  INTEGER NULL,
	UNIQUE КодПриказСоздКомИнвент (КодПриказСоздКомИнвент)
)
;



ALTER TABLE ОП_ПриказСоздКомИнвент
	ADD  PRIMARY KEY (КодПриказСоздКомИнвент)
;



CREATE TABLE СП_ДолжСотр
(
	КодДолжСотр  INTEGER NOT NULL AUTO_INCREMENT,
	Наименование  CHAR(120) NOT NULL,
	UNIQUE КодДолжСотр (КодДолжСотр)
)
;



ALTER TABLE СП_ДолжСотр
	ADD  PRIMARY KEY (КодДолжСотр)
;



CREATE TABLE СП_ЕдХран
(
	КодЕдХран  INTEGER NOT NULL AUTO_INCREMENT,
	Наименование  CHAR(120) NOT NULL,
	UNIQUE КодЕдХран (КодЕдХран)
)
;



ALTER TABLE СП_ЕдХран
	ADD  PRIMARY KEY (КодЕдХран)
;



CREATE TABLE СП_МестаХран
(
	КодМестаХран  INTEGER NOT NULL AUTO_INCREMENT,
	Наименование  CHAR(120) NOT NULL,
	UNIQUE КодМестаХран (КодМестаХран)
)
;



ALTER TABLE СП_МестаХран
	ADD  PRIMARY KEY (КодМестаХран)
;



CREATE TABLE СП_МоиОрг
(
	КодМоейОрг  INTEGER NOT NULL AUTO_INCREMENT,
	Наименование  CHAR(120) NOT NULL,
	УНП  INTEGER NULL,
	UNIQUE КодМоейОрг (КодМоейОрг)
)
;



ALTER TABLE СП_МоиОрг
	ADD  PRIMARY KEY (КодМоейОрг)
;



CREATE TABLE СП_Номенкл
(
	КодНоменкл  INTEGER NOT NULL AUTO_INCREMENT,
	Наименование  CHAR(120) NOT NULL,
	КодЕдХран  INTEGER NULL,
	КодПроизв  INTEGER NULL,
	Опис  VARCHAR(4096) NULL,
	UNIQUE КодНоменкл (КодНоменкл)
)
;



ALTER TABLE СП_Номенкл
	ADD  PRIMARY KEY (КодНоменкл)
;



CREATE TABLE СП_Произв
(
	КодПроизв  INTEGER NOT NULL AUTO_INCREMENT,
	Наименование  CHAR(120) NOT NULL,
	UNIQUE КодЕдХран (КодПроизв)
)
;



ALTER TABLE СП_Произв
	ADD  PRIMARY KEY (КодПроизв)
;



CREATE TABLE СП_Сотр
(
	КодСотр  INTEGER NOT NULL AUTO_INCREMENT,
	Наименование  CHAR(120) NOT NULL,
	КодДолжСотр  INTEGER NULL,
	UNIQUE КодСотр (КодСотр)
)
;



ALTER TABLE СП_Сотр
	ADD  PRIMARY KEY (КодСотр)
;



CREATE TABLE ТабличнаяЧасть_Номенкл
(
	id  INTEGER NOT NULL AUTO_INCREMENT,
	КодНоменкл  INTEGER NULL,
	КодИнвенОпис  INTEGER NULL,
	Цена  DECIMAL(16,2) NULL,
	ФактичКол  INTEGER NULL,
	КолПоБухУч  INTEGER NULL,
	НедостКол  INTEGER NULL,
	ИзлишкиКол  INTEGER NULL,
	UNIQUE id (id)
)
;



ALTER TABLE ТабличнаяЧасть_Номенкл
	ADD  PRIMARY KEY (id)
;



CREATE TABLE ТабличнаяЧасть_СоставКомис
(
	id  INTEGER NOT NULL AUTO_INCREMENT,
	КодКомиссии  INTEGER NULL,
	КодСотр  INTEGER NULL,
	UNIQUE id (id)
)
;



ALTER TABLE ТабличнаяЧасть_СоставКомис
	ADD  PRIMARY KEY (id)
;



ALTER TABLE ОП_ИнвенОпис
	ADD FOREIGN KEY R_6 (КодМестаХран) REFERENCES СП_МестаХран(КодМестаХран)
;


ALTER TABLE ОП_ИнвенОпис
	ADD FOREIGN KEY R_7 (КодМоейОрг) REFERENCES СП_МоиОрг(КодМоейОрг)
;


ALTER TABLE ОП_ИнвенОпис
	ADD FOREIGN KEY R_17 (КодКомиссии) REFERENCES КомИнвент(КодКомиссии)
;



ALTER TABLE ОП_ПриказСоздКомИнвент
	ADD FOREIGN KEY R_8 (КодМоейОрг) REFERENCES СП_МоиОрг(КодМоейОрг)
;


ALTER TABLE ОП_ПриказСоздКомИнвент
	ADD FOREIGN KEY R_9 (КодМестаХран) REFERENCES СП_МестаХран(КодМестаХран)
;


ALTER TABLE ОП_ПриказСоздКомИнвент
	ADD FOREIGN KEY R_18 (КодКомиссии) REFERENCES КомИнвент(КодКомиссии)
;



ALTER TABLE СП_Номенкл
	ADD FOREIGN KEY R_4 (КодПроизв) REFERENCES СП_Произв(КодПроизв)
;


ALTER TABLE СП_Номенкл
	ADD FOREIGN KEY R_5 (КодЕдХран) REFERENCES СП_ЕдХран(КодЕдХран)
;



ALTER TABLE СП_Сотр
	ADD FOREIGN KEY R_3 (КодДолжСотр) REFERENCES СП_ДолжСотр(КодДолжСотр)
;



ALTER TABLE ТабличнаяЧасть_Номенкл
	ADD FOREIGN KEY R_13 (КодИнвенОпис) REFERENCES ОП_ИнвенОпис(КодИнвенОпис)
;


ALTER TABLE ТабличнаяЧасть_Номенкл
	ADD FOREIGN KEY R_14 (КодНоменкл) REFERENCES СП_Номенкл(КодНоменкл)
;



ALTER TABLE ТабличнаяЧасть_СоставКомис
	ADD FOREIGN KEY R_15 (КодСотр) REFERENCES СП_Сотр(КодСотр)
;


ALTER TABLE ТабличнаяЧасть_СоставКомис
	ADD FOREIGN KEY R_16 (КодКомиссии) REFERENCES КомИнвент(КодКомиссии)
;


