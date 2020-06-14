create database furniturestoresystem;
USE furniturestoresystem; 
drop database furniturestoresystem;
--Start Table Comfy_cms_fragments
CREATE TABLE Comfy_cms_fragments(
fragments_id int Primary key identity,
recordable_type	varchar(50), 
identifier varchar(50),
tag varchar(50),
content text,
boolean bit,
create_at date,
created_att time,
update_at date,
updated_att time
);

--End Table
--Start Table Comfy_cms_categorizations
CREATE TABLE Comfy_cms_categorizations(
categorizations_id int Primary key identity,
Categorized_type varchar(50),
categories_id Int,
snippets_id Int,
files_id Int,
pages_id Int,
FOREIGN KEY (categories_id)REFERENCES Comfy_cms_categories(categories_id),
FOREIGN KEY (snippets_id)REFERENCES Comfy_cms_snippets(snippets_id),
FOREIGN KEY (pages_id)REFERENCES Comfy_cms_pages(pages_id),
FOREIGN KEY (files_id)REFERENCES Comfy_cms_files(files_id),
);
--End Table
--Start Table Comfy_cms_categories
CREATE TABLE Comfy_cms_categories(
categories_id int Primary key identity,
Categorized_type varchar(50),
[label] varchar(50),
sites_id Int,
FOREIGN KEY (sites_id)REFERENCES Comfy_coms_sites(sites_id)
);
--End Table
--Start table Comfy_cms_snippets
CREATE TABLE Comfy_cms_snippets(
snippets_id int Primary key identity,
[label] varchar(50),
Identifier varchar(50),
content	text,
Position Int,
create_at date,
created_att time,
update_at date,
updated_att time,
sites_id int,
FOREIGN KEY (sites_id)REFERENCES Comfy_coms_sites(sites_id),

);
--End Table
--Start Table Comfy_cms_files
CREATE TABLE Comfy_cms_files(
files_id int Primary key identity,
[label] varchar(50),
[Description] text,
Position Int,
create_at date,
created_att time,
update_at date,
updated_att time,
sites_id int ,
FOREIGN KEY(sites_id)REFERENCES Comfy_coms_sites(sites_id)
);
--End Table
--Start table Comfy_coms_sites
CREATE TABLE Comfy_coms_sites(
sites_id int Primary key identity,
[Label] varchar(50),
Identifier varchar(50),
Hostname varchar(50),
[Path] varchar(50),
Locale varchar(50),
create_at date,
created_att time,
update_at date,
updated_att time
);
--End Table
--start Table Comfy_cms_translations 
CREATE TABLE Comfy_cms_translations (
translations_id int primary key identity ,
locale varchar(50),
[label] int,
contant_cache text,
is_published bit,
create_at date,
created_att time,
update_at date,
updated_att time
);
--End Table
--Start Table Comfy_cms_layouts
CREATE TABLE Comfy_cms_layouts(
layouts_id int Primary key identity,
app_layout varchar(50),
label varchar(50),
identifier varchar(50),
content	text,
css	text,
js	text,
position int,
create_at date,
created_att time,
update_at date,
updated_att time,

translations_id int,
sites_id int,

FOREIGN KEY (translations_id)REFERENCES Comfy_cms_translations(translations_id),
FOREIGN KEY (sites_id)REFERENCES Comfy_coms_sites(sites_id),

);
--End Table
--Start Table Comfy_cms_pages
CREATE TABLE Comfy_cms_pages(
pages_id int Primary key identity,
[label] varchar(50),
slog varchar(50),
full_path varchar(50),
content_cache text,
position Int,
children_count Int,
is_published bit,
create_at date,
created_att time,
update_at date,
updated_att time,
translations_id int,
sites_id int,
FOREIGN KEY (translations_id)REFERENCES Comfy_cms_translations(translations_id),
FOREIGN KEY (sites_id)REFERENCES Comfy_coms_sites(sites_id),
);
--End Table
--Start Table Comfy_cms_revisions
CREATE TABLE Comfy_cms_revisions(
revisions_id int Primary key identity,
record_type varchar(50),
[data] text,
create_at date,
created_att time,
layouts_id int,
snippets_id int,
pages_id int,
FOREIGN KEY (pages_id)REFERENCES Comfy_cms_pages(pages_id),
FOREIGN KEY (layouts_id)REFERENCES Comfy_cms_layouts(layouts_id),
FOREIGN KEY (snippets_id)REFERENCES Comfy_cms_snippets(snippets_id),
);

--End Table









--insert 1
insert into Comfy_cms_fragments
(recordable_type,identifier,tag,content,boolean,create_at,created_att,update_at,updated_att)
values
('marble','marble decor','fancy homes','marble hands with rezin',1,'2020-6-30','22:00:00','2020-3-31','22:30:00');

insert into Comfy_cms_fragments(recordable_type,identifier,tag,content,boolean,create_at,created_att,update_at,updated_att) values('broonze','vintage brass','palaces','vintage brass with broonze and metal edit',1,'2020-7-1','14:00:00','2020-12-1','14:00:00');

insert into Comfy_cms_fragments(recordable_type,identifier,tag,content,boolean,create_at,created_att,update_at,updated_att) values('wood','salvaged wood','work','handmade wooden decor',1,'2020-5-5','18:00:00','2020-10-5','18:00:00');
--insert 2

insert into Comfy_cms_categorizations(Categorized_type
) 
values('wooden');
insert into Comfy_cms_categorizations(Categorized_type) 
values('glass');
insert into Comfy_cms_categorizations(Categorized_type) 
values('metal');
--insert 3
insert into Comfy_cms_categories(Categorized_type,[label]) 
values('sofas','wood/leather ');
insert into Comfy_cms_categories(Categorized_type,[label]) 
values('tables','wood/metal');
insert into Comfy_cms_categories(Categorized_type,[label]) 
values('bookcase','wood');
--insert 4
insert into Comfy_cms_snippets([label],Identifier,content,Position,create_at,created_att,update_at,updated_att) 
values                       ('blanket','industrical','covering for sofas',1,'2020-10-10','20:00:00','2020-12-10','20:00:00');
insert into Comfy_cms_snippets([label],Identifier,content,Position,create_at,created_att,update_at,updated_att) 
values('stand table','wood','for walls',2,'2020-4-3','4:30:00','2020-6-3','5:30:00');
insert into Comfy_cms_snippets([label],Identifier,content,Position,create_at,created_att,update_at,updated_att) 
values('holder','metal','hands for doors',3,'2020-5-5','6:00:00','2020-7-7','6:00:00');
--insert 5
---------------------------------------------------
insert into Comfy_cms_files
([label],[Description],Position,create_at,created_att,update_at,updated_att) 
values
('sofas','wooden industrial covered',3,'2020-6-6','4:30:00','2020-8-8','8:30:00');
insert into Comfy_cms_files([label],[Description],Position,create_at,created_att,update_at,updated_att) 
values ('tables','wooden handmade pieces',5,'2020-3-4','5:00:00','2020-5-8','6:00:00');
insert into Comfy_cms_files([label],[Description],Position,
create_at,created_att,update_at,updated_att) 
values('bookcase','book wooden holder',2,'2020-7-7','20:00:00','2020-7-12','23:00:00');



-------------------------------------------------------
--insert 6
insert into Comfy_coms_sites([label],Identifier,Hostname,
[Path],Locale,create_at,created_att,update_at,updated_att) 
values('Ikea','website','HTTP','wood','egypt','2020-2-2','20:00:00','2020-5-2','21:00:00');
insert into Comfy_coms_sites([label],Identifier,Hostname,
[Path],Locale,create_at,created_att,update_at,updated_att) 
values('hub furniture','website','HTTP','wood','egypt','2020-4-6','10:00:00','2020-8-6','13:00:00');
insert into Comfy_coms_sites([label],Identifier,Hostname,
[Path],Locale,create_at,created_att,update_at,updated_att) 
values('blend furniture','magazine','HTTP','wood','america','2020-1-4','23:30:00','2020-5-4','20:00:00');
--insert 7
 insert into Comfy_cms_revisions(record_type,[data],
create_at,created_att) 
values('woods','large amounts','2020-6-6','4:30:00');
insert into Comfy_cms_revisions(record_type,[data],
create_at,created_att) 
values('glass','small amounts','2020-3-5','6:00:00');
insert into Comfy_cms_revisions(record_type,[data],
create_at,created_att) 
values('metal','medium','2020-8-5','20:15:00');
--insert 8
insert into Comfy_cms_translations(locale,[label],contant_cache,
is_published,create_at,created_att,update_at,updated_att) 
values('bottom',6,'many',1,'2020-3-15','20:00:00','2020-4-15','10:00:00');
insert into Comfy_cms_translations(locale,[label],contant_cache,
is_published,create_at,created_att,update_at,updated_att) 
values('top',4,'huge',1,'2020-1-20','23:00:00','2020-5-20','15:00:00');
insert into Comfy_cms_translations(locale,[label],contant_cache,
is_published,create_at,created_att,update_at,updated_att)
values('middle',5,'suitable',1,'2020-4-12','23:00:00','2020-5-20','12:30:00');
--insert 9



insert into Comfy_cms_layouts(app_layout,[label],identifier,
content,css,js,position,create_at,created_att,update_at,updated_att) 
values
('layout color','design','decoration','choosing colors for layouts','dimensions and shadow','dimensions',1,'2020-3-5','13:00:00','2020-7-5','23:00:00');
insert into Comfy_cms_layouts(app_layout,[label],identifier,
content,css,js,position,create_at,created_att,update_at,updated_att) 
values
('layout vectors','design','place','defining vectors of layouts','display and tables','functions',2,'2020-3-14','17:00:00','2020-8-16','20:30:00');
insert into Comfy_cms_layouts(app_layout,[label],identifier,
content,css,js,position,create_at,created_att,update_at,updated_att) 
values
('angle furnituring','positioning','decoration','to position the furniture','position','methods',3,'2020-5-19','18:15:00','2020-8-20','23:30:00');
--insert 10
insert into Comfy_cms_pages([label],slog,
full_path,content_cache,position,children_count,is_published,create_at,created_att,update_at,updated_att) 
values('wood','tables','handmades','handmades wooden tables',2,2,1,'2020-1-5','20:30:00','2020-6-13','13:00:00');
insert into Comfy_cms_pages([label],slog,
full_path,content_cache,position,children_count,is_published,create_at,created_att,update_at,updated_att) 
values('metal','bookcases','industrial','book holder metal cases',3,1,1,'2020-5-9','18:30:00','2020-9-7','20:14:00');
insert into Comfy_cms_pages([label],slog,
full_path,content_cache,position,children_count,is_published,create_at,created_att,update_at,updated_att) 
values('marble','decorations','industial','marble addition for decoration',4,2,1,'2020-2-9','23:00:00','2020-8-13','15:15:00');
-------------------
--quries


SELECT *FROM comfy_cms_categories where categorized_type= 'bookcase'
SELECT *FROM comfy_cms_layouts where identifier = 'decoration'
SELECT content_cache FROM comfy_cms_pages
SELECT SUM([label]) FROM comfy_cms_translations
SELECT position 
FROM comfy_cms_files where  position= 5;
SELECT content_cache FROM comfy_cms_pages
SELECT *
FROM comfy_cms_revisions where record_type IN ('wood', 'glass')
SELECT *
FROM comfy_cms_fragments 
ORDER BY identifier,  tag
SELECT *
FROM Comfy_coms_sites where identifier = 'website' or identifier = 'magazine'
SELECT *
FROM comfy_cms_categorizations where NOT categorized_type = 'wooden'
SELECT *
FROM comfy_cms_pages
ORDER BY slog
SELECT DISTINCT locale 
FROM comfy_cms_translations
SELECT *
FROM comfy_cms_layouts 
ORDER BY app_layout
SELECT *
FROM Comfy_coms_sites where [path] = 'wood'


SELECT * FROM Comfy_cms_snippets where [label] = 'blanket' AND Position = 1



SELECT * FROM Comfy_cms_categories 
SELECT hostname FROM Comfy_coms_sites
SELECT *
FROM comfy_cms_pages where [label] LIKE 'm%';
SELECT *
FROM comfy_cms_pages where [label] = 'metal' or [label] = 'wood'
SELECT identifier
FROM Comfy_cms_fragments
WHERE fragments_id > 2

SELECT [Description]
FROM Comfy_cms_files
WHERE Position BETWEEN 2 AND 5;

------------------------------------------
------------------------------------------
--subquery

SELECT Categorized_type ,
[label] ,
  ( SELECT count(*) 
    FROM Comfy_coms_sites
    WHERE Comfy_cms_categories.categories_id = Comfy_coms_sites.sites_id
  )
FROM Comfy_cms_categories;

--
 SELECT recordable_type	, 
identifier ,
tag ,
content ,
  ( SELECT count(*) 
    FROM Comfy_cms_pages
    WHERE Comfy_cms_pages.pages_id= Comfy_cms_fragments.fragments_id
  ) AS boolean
FROM Comfy_cms_fragments;


SELECT * FROM Comfy_cms_revisions 
   WHERE revisions_id IN (SELECT snippets_id 
         FROM Comfy_cms_snippets 
         ) ;
--

--count and group
SELECT create_at, COUNT(*) 
FROM Comfy_cms_pages 
GROUP BY create_at 
ORDER BY 2 ;

SELECT Position, COUNT(*) 
FROM Comfy_cms_files 
GROUP BY Position;

--inner join
SELECT * FROM comfy_cms_categorizations
INNER JOIN Comfy_cms_categories ON comfy_cms_categorizations.categorizations_id = comfy_cms_categories.categories_id
--left join
SELECT update_at FROM comfy_cms_pages
LEFT JOIN comfy_cms_revisions ON comfy_cms_pages.[label]= comfy_cms_revisions.record_type
--right join
SELECT * FROM comfy_cms_categories 
RIGHT JOIN Comfy_cms_categorizations ON Comfy_cms_categorizations.categorizations_id = comfy_cms_categories.categories_id
--full outer join
SELECT identifier,content,css,js FROM Comfy_cms_layouts FULL 
OUTER JOIN comfy_cms_files ON comfy_cms_layouts.position = comfy_cms_files.position
--implicit inner JOIN
SELECT * FROM comfy_cms_snippets , Comfy_cms_fragments
WHERE Comfy_cms_snippets.identifier = comfy_cms_fragments.recordable_type
-----------------------------------------------------------------------------------
--update 
UPDATE comfy_cms_categories SET label='marble' WHERE categories_id= 3 

UPDATE Comfy_coms_sites SET identifier= 'hnadmade' WHERE sites_id= 1  

UPDATE comfy_cms_pages SET children_count= 5  WHERE pages_id = 3 

UPDATE comfy_cms_layouts SET css= 'aligns' WHERE layouts_id = 3

UPDATE comfy_cms_translations SET contant_cache = 'medium' , locale = 'bottom' WHERE translations_id = 2 

--delete
DELETE FROM comfy_cms_translations WHERE translations_id = 9

DELETE FROM comfy_cms_revisions WHERE create_at = '2020-06-06'

DELETE FROM comfy_cms_layouts WHERE layouts_id NOT IN (SELECT pages_id FROM comfy_cms_pages)

DELETE FROM comfy_cms_pages ;

DELETE FROM Comfy_coms_sites WHERE identifier = 'website'
