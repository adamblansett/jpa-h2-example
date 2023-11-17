CREATE TABLE ArcheType ( 
	Name                 VARCHAR(100) NOT NULL  PRIMARY KEY  ,
	Use                  VARCHAR(25)     ,
	Desc                 VARCHAR(132)     
 );

CREATE TABLE InjestRepository ( 
	ConnectionName       VARCHAR(100) NOT NULL    ,
	DataBase             VARCHAR(80) NOT NULL    ,
	Schema               VARCHAR(80) NOT NULL    ,
	Table                VARCHAR(80) NOT NULL    ,
	Field                VARCHAR(80) NOT NULL    ,
	FieldType            VARCHAR(25)     ,
	FieldLen             INTEGER     ,
	FieldPrecision       INTEGER     ,
	ID                   INTEGER NOT NULL  PRIMARY KEY  ,
	CONSTRAINT pk_ConnectionName UNIQUE ( ConnectionName )
 );

CREATE TABLE PrepareRepository ( 
	ID                   INTEGER NOT NULL  PRIMARY KEY  ,
	Domain               VARCHAR(100) NOT NULL    ,
	Name                 VARCHAR(100) NOT NULL    ,
	FieldName            VARCHAR(100)     ,
	FieldType            VARCHAR(25)     ,
	FieldLen             INTEGER     ,
	FieldPrecision       INTEGER     ,
	ArcheType            INTEGER NOT NULL    ,
	FOREIGN KEY ( ArcheType ) REFERENCES ArcheType( Name )  
 );

CREATE TABLE SubjectArea ( 
	Name                 VARCHAR(100) NOT NULL  PRIMARY KEY  ,
	Schema               VARCHAR(100) NOT NULL    
 );

CREATE TABLE Connection ( 
	Name                 VARCHAR(100) NOT NULL  PRIMARY KEY  ,
	ServerName           VARCHAR(100)     ,
	ServerAdress         VARCHAR(100)     ,
	ServerPort           INTEGER     ,
	UserName             VARCHAR(100)     ,
	UserPsw              VARCHAR(10)     ,
	ConnString           VARCHAR(100)     ,
	Options              VARCHAR(10)     ,
	FOREIGN KEY ( Name ) REFERENCES InjestRepository( ConnectionName )  
 );

CREATE TABLE ExposeRepository ( 
	SubjectAreaName      VARCHAR(100) NOT NULL    ,
	Name                 VARCHAR(100) NOT NULL    ,
	FieldName            VARCHAR(100)     ,
	FieldType            VARCHAR(100)     ,
	FieldPrecision       INTEGER     ,
	FieldLen             INTEGER     ,
	ArcheType            VARCHAR(50) NOT NULL    ,
	ID                   INTEGER NOT NULL  PRIMARY KEY  ,
	CONSTRAINT pk_SubjectAreaName UNIQUE ( SubjectAreaName ),
	FOREIGN KEY ( SubjectAreaName ) REFERENCES SubjectArea( Name )  ,
	FOREIGN KEY ( ArcheType ) REFERENCES ArcheType( Name )  
 );

CREATE TABLE LINK_InjPrep ( 
	ID_Prep              INTEGER NOT NULL    ,
	ID_Inj               INTEGER NOT NULL    ,
	ID                   INTEGER NOT NULL  PRIMARY KEY  ,
	FOREIGN KEY ( ID_Prep ) REFERENCES PrepareRepository( ID )  ,
	FOREIGN KEY ( ID_Inj ) REFERENCES InjestRepository( ID )  
 );

CREATE UNIQUE INDEX unq_ID_Prepare ON LINK_InjPrep ( ID_Prep );

CREATE TABLE LINK_PrepExp ( 
	ID                   INTEGER NOT NULL  PRIMARY KEY  ,
	ID_Exp               INTEGER NOT NULL    ,
	ID_Prep              INTEGER NOT NULL    ,
	FOREIGN KEY ( ID_Exp ) REFERENCES ExposeRepository( ID )  ,
	FOREIGN KEY ( ID_Prep ) REFERENCES PrepareRepository( ID )  
 );

