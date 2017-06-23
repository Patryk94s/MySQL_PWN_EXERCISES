#create database pierwszaDB;
#use pierwszaDB;
#select database();

#wypisanie wszystkich tabel w bazie
#show tables;

#drop database pierwszaDB;

#create database pracownicy;
use pracownicy;

create table Uczestnicy_(

	id int primary key auto_increment, 
	imie varchar(30) not null, 
	nazwisko varchar(50) not null
    
);

#dropuczesticy table uczestnicy;
describe uczestnicy;
alter table uczestnicy change nazwisko nazwisko_u varchar(50);

alter table uczestnicy modify nazwisko_u varchar(20);

alter table uczestnicy ADD pesel varchar(11);

alter table uczestnicy ADD data_urodzenia date;


