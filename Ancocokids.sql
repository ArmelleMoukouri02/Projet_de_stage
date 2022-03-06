/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de cr�ation :  30/03/2021 19:05:59                      */
/*==============================================================*/
-- 
drop database if exists ancocokids;
CREATE database ancocokids;
use ancocokids;
drop table if exists Administrateur;

drop table if exists Article;

drop table if exists Categorie;

drop table if exists Client;

drop table if exists Commande;

drop table if exists Donnation;

drop table if exists Fournisseur;

drop table if exists Ligne_Commande;

drop table if exists Livraison;

drop table if exists Livraison_Effectuee;

drop table if exists ModeLivraison;

drop table if exists Ville;

/*==============================================================*/
/* Table : Administrateur                                       */
/*==============================================================*/
create table Administrateur
(
   AdminId              int not null,
   UtilNom              varchar(254),
   UtilPrenom           varchar(254),
   UtilSexe             national char(1),
   UtilAdresse          varchar(254),
   UtilTelephone        int,
   UtilMotdePasse       varchar(254),
   UtilLogin            varchar(254),
   VilleId              int not null,
   AdminAdresse         varchar(254),
   AdminMot_de_passe    varchar(254),
   AdminNom             varchar(254),
   primary key (AdminId)
);

/*==============================================================*/
/* Table : Article                                              */
/*==============================================================*/
create table Article
(
   ArtId                int not null,
   FourId               int not null,
   CatId                int not null,
   ArtNom               varchar(254),
   PrixArt              int,
   QteArt               int,
   Tauxremise           int,
   ArtDescription       varchar(254),
   TVA                  int,
   primary key (ArtId)
);

/*==============================================================*/
/* Table : Categorie                                            */
/*==============================================================*/
create table Categorie
(
   CatId                int not null,
   CatNom               varchar(254),
   primary key (CatId)
);

/*==============================================================*/
/* Table : Client                                               */
/*==============================================================*/
create table Client
(
   ClientId             int not null,
   UtilNom              varchar(254),
   UtilPrenom           varchar(254),
   UtilSexe             char(1),
   UtilAdresse          varchar(254),
   UtilTelephone        int,
   UtilMotdePasse       varchar(254),
   UtilLogin            varchar(254),
   VilleId              int not null,
   AdresseCli           int,
   TelephonrCli         int,
   Mot_de_passe         int,
   NomCli               int,
   primary key (ClientId)
);

/*==============================================================*/
/* Table : Commande                                             */
/*==============================================================*/
create table Commande
(
   CmdId                int not null,
   CmdDate              datetime,
   Total                int,
   CmdDescription       varchar(254),
   ClientId             int,
   primary key (CmdId)
);

/*==============================================================*/
/* Table : Donnation                                            */
/*==============================================================*/
create table Donnation
(
   DonId                int not null,
   DonNom               varchar(254),
   QteDon               int,
   NatureDon            varchar(254),
   ClientId             int,
   primary key (DonId)
);

/*==============================================================*/
/* Table : Fournisseur                                          */
/*==============================================================*/
create table Fournisseur
(
   FourId               int not null,
   FourNom              varchar(254),
   FourPrenom           varchar(254),
   FourAdresse          varchar(254),
   FourTelephone        int,
   Fouremail            varchar(254),
   primary key (FourId)
);

/*==============================================================*/
/* Table : Ligne_Commande                                       */
/*==============================================================*/
create table Ligne_Commande
(
   LigCmd_Id            int not null,
   ArtId                int not null,
   CmdId                int not null,
   QteCmd               int,
   DateLigCmd           datetime,
   primary key (LigCmd_Id)
);

/*==============================================================*/
/* Table : Livraison                                            */
/*==============================================================*/
create table Livraison
(
   LivId                int not null,
   ModeLiv_Id           int not null,
   LivDate              datetime,
   LivDescription       varchar(254),
   primary key (LivId)
);

/*==============================================================*/
/* Table : Livraison_Effectuee                                  */
/*==============================================================*/
create table Livraison_Effectuee
(
   LivEff_Id            int not null,
   CmdId                int not null,
   LivId                int not null,
   DateLivEff           datetime,
   NbreLivEff           int,
   primary key (LivEff_Id)
);

/*==============================================================*/
/* Table : ModeLivraison                                        */
/*==============================================================*/
create table ModeLivraison
(
   ModeLiv_Id           int not null,
   ModeLivNom           varchar(254),
   ModeLiv_Description  varchar(254),
   primary key (ModeLiv_Id)
);

/*==============================================================*/
/* Table : Ville                                                */
/*==============================================================*/
create table Ville
(
   VilleId              int not null,
   VilleNom             varchar(254),
   primary key (VilleId)
);

alter table Administrateur add constraint FK_Association_2 foreign key (VilleId)
      references Ville (VilleId) on delete cascade on update cascade;

alter table Article add constraint FK_Association_3 foreign key (FourId)
      references Fournisseur (FourId) on delete cascade on update cascade;

alter table Article add constraint FK_Association_4 foreign key (CatId)
      references Categorie (CatId) on delete cascade on update cascade;

alter table Client add constraint FK_Association_21 foreign key (VilleId)
      references Ville (VilleId) on delete cascade on update cascade;

alter table Commande add constraint FK_Association_10 foreign key (ClientId)
      references Client (ClientId) on delete cascade on update cascade;

alter table Donnation add constraint FK_Association_1 foreign key (ClientId)
      references Client (ClientId) on delete cascade on update cascade;

alter table Ligne_Commande add constraint FK_Association_6 foreign key (ArtId)
      references Article (ArtId) on delete cascade on update cascade;

alter table Ligne_Commande add constraint FK_Association_7 foreign key (CmdId)
      references Commande (CmdId) on delete cascade on update cascade;

alter table Livraison add constraint FK_Association_5 foreign key (ModeLiv_Id)
      references ModeLivraison (ModeLiv_Id) on delete cascade on update cascade;

alter table Livraison_Effectuee add constraint FK_Association_8 foreign key (CmdId)
      references Commande (CmdId) on delete cascade on update cascade;

alter table Livraison_Effectuee add constraint FK_Association_9 foreign key (LivId)
      references Livraison (LivId) on delete cascade on update cascade;

