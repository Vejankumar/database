create database if not exists log;
use log;

create table if not exists blog (
    id int unsigned primary key,
    blog_url varchar(40),
    created_at Date,
    home varchar(25)
);

create table if not exists category (
    cat_id int unsigned primary key,
    cat_name varchar(40),
    blog_id int unsigned,
    parent_cat_id int unsigned,
    constraint blog_id_fk foreign key (blog_id)
        references blog (id),
    constraint cat_id_fk foreign key (parent_cat_id)
        references category (cat_id)
);



create table if not exists author (
    a_id int unsigned primary key,
    a_name varchar(40),
    skills varchar(40),
    address varchar(40),
    age int
);

create table if not exists post (
    p_id int unsigned primary key,
    p_name varchar(25),
    cat_id int unsigned,
    constraint post_id_fk foreign key (cat_id)
        references category (cat_id)
);
alter table post add DateofCreation Date;


create table if not exists comments (
    com_id int unsigned primary key,
    user_id int unsigned,
    com varchar(40),
    p_id int unsigned,
    constraint comuser_id_fk foreign key (user_id)
        references author (a_id),
    constraint compost_id_fk foreign key (p_id)
        references post (p_id)
);
alter table comments add dateofcomment date;


create table if not exists junc (
    p_id int unsigned,
    a_id int unsigned,
    DOP date,
    constraint juncp_id_fk foreign key (p_id)
        references post (p_id),
    constraint junca_id_fk foreign key (a_id)
        references author (a_id)
);

show create table comments;

show create table junc;

show create table blog;

show create table category;

alter table category drop foreign key blog_id_fk;
alter table category drop column blog_id;

alter table category add blog_id int unsigned not null;

alter table category add constraint blog_id_fk foreign key(blog_id) references blog(id);


alter table blog change column id blog_id int unsigned;

show create table blog;


alter table blog drop home;

insert into author(a_id,a_name,skills,address,age)
values (1,'vejan','watching movies','kasanur',21);

insert into author(a_id,a_name,skills,address,age)
values (2,'aditya','eventorganisation','hyderabad',22);

insert into blog(blog_id,blog_url,created_at)
values (1,'www.google.com','1998-07-3');

insert into blog(blog_id,blog_url,created_at)
values (2,'www.youtube.com','2007-04-6');

insert into category(cat_id,cat_name,blog_id,parent_cat_id)
values(1,'social',2,1);

insert into category(cat_id,cat_name,blog_id,parent_cat_id)
values(2,'entertainment',1,1);

insert into post(p_id,p_name,cat_id)
values (1,'exploreworld',2);

insert into post(p_id,p_name,cat_id)
values (2,'eatsleepcode',1);

insert into junc(p_id,a_id,DOP)
values(1,2,'2012-04-20');

insert into junc(p_id,a_id,DOP)
values(2,1,'2016-12-25');

insert into comments(com_id,user_id,com,p_id)
values(1,2,'Its look nice',1);

insert into comments(com_id,user_id,com,p_id)
values(2,1,'can you share me the link',2);

insert into author(a_id,a_name,skills,address,age)
values (3,'fauzia','makeup','anywhereintheworld',21);

insert into author(a_id,a_name,skills,address,age)
values (4,'sri','videogames','pulivendula',21);

insert into blog(blog_id,blog_url,created_at)
values (3,'www.yahoo.com','1995-12-2');

insert into blog(blog_id,blog_url,created_at)
values (4,'www.gmail.com','2010-05-21');

insert into category(cat_id,cat_name,blog_id,parent_cat_id)
values(3,'horror',3,2);

insert into category(cat_id,cat_name,blog_id,parent_cat_id)
values(4,'thriller',4,3);

insert into post(p_id,p_name,cat_id,DateofCreation)
values (3,'eating',4,'2000-11-9');

insert into post(p_id,p_name,cat_id,DateofCreation)
values (4,'cooking',3,'2003-5-9');

insert into junc(p_id,a_id,DOP)
values(3,4,'2012-04-20');

insert into junc(p_id,a_id,DOP)
values(4,3,'2016-12-25');

insert into comments(com_id,user_id,com,p_id,dateofcomment)
values(3,4,'Its look nice',4,'1967-13-09');

insert into comments(com_id,user_id,com,p_id,dateofcomment)
values(4,3,'can you share me the link',3,'1972-12-23');

update comments set dateofcomment = '1967-09-13'
where com_id = 3;

select * from comments where user_id in (select a_id from author where a_name = "vejan");

select * from category;

select * from post where cat_id in (select cat_id from category where cat_name = "social");
