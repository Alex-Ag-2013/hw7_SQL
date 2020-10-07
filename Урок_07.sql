-- ������� �1: �� ���� ���������, �.�. � ����� SQL-����� 'Shop' ��� �������, ������� ��������� �� ������ �� ������� ����������� (users).

-- ������� �2: �������� ������ ������� products � �������� catalogs, ������� ������������� ������.

select products.name, products.catalog_id, catalogs.name as 'Chapter of the article'  from products join catalogs on products.catalog_id = catalogs.id;

-- ������� �3: ����� ������� ������� ������ flights (id, from, to) � ������� ������� cities (label, name).
-- ���� from, to � label �������� ���������� �������� �������, ���� name � �������. �������� ������ ������ flights � �������� ���������� �������.

drop table if exists flights;
create table flights(
id serial primary key,
departure varchar(200) null,
arrival varchar(200) null
);

insert into flights (departure, arrival) values
('Moscow', 'Omsk'),
('Novgorod', 'Kazan'),
('Irkutsk', 'Moscow'),
('Omsk', 'Irkutsk'),
('Moscow', 'Kazan');

drop table if exists cities;
create table cities(
id serial primary key,
label_EN varchar(200) null,
name_RU varchar(200) null);

insert into cities (label_EN, name_RU) values
('Moscow', '������'),
('Irkutsk', '�������'),
('Novgorod', '�������� �������'),
('Kazan', '������'),
('Omsk', '����');

select
	flights.id,
	(select cities.name_RU from cities where cities.label_EN = flights.departure) as DEPART,
	(select cities.name_RU from cities where cities.label_EN = flights.arrival) as ARRIV
from
	flights
order by flights.id;

-- �������� ���������� � ��������� :) ****