-- задание №1: не могу выполнить, т.к. в файле SQL-файле 'Shop' нет команды, которые заполнили бы данные по заказам покупателей (users).

-- задание №2: Выведите список товаров products и разделов catalogs, который соответствует товару.

select products.name, products.catalog_id, catalogs.name as 'Chapter of the article'  from products join catalogs on products.catalog_id = catalogs.id;

-- задание №3: Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
-- Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.

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
('Moscow', 'Москва'),
('Irkutsk', 'Иркутск'),
('Novgorod', 'Новгород Великий'),
('Kazan', 'Казань'),
('Omsk', 'Омск');

select
	flights.id,
	(select cities.name_RU from cities where cities.label_EN = flights.departure) as DEPART,
	(select cities.name_RU from cities where cities.label_EN = flights.arrival) as ARRIV
from
	flights
order by flights.id;

-- частично подсмотрел в интернете :) ****