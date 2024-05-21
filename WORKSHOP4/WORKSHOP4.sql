create database Alphabet_Company_DB;
use Alphabet_Company_DB;

create table Country (
    country_id char(36) primary key,
    name varchar(25) unique not null
);

create table musicalgenre (
    id_genre char(36) primary key,
    name varchar(15) not null,
    description varchar(100)
);

create table users (
    user_id char(36) primary key,
    name varchar(50) not null,
    email varchar(30) unique,
    phone varchar(50),
    nickname varchar(20) unique not null,
    password varchar(30) not null,
    musical_genre_fk char(36),
    country_fk char(36),
    foreign key (musical_genre_fk) references musicalgenre(id_genre),
    foreign key (country_fk) references Country(country_id)
);

create table channels (
    id_channel char(36) primary key,
    name varchar(30) not null,
    description varchar(200),
    user_fk char(36),
    foreign key (user_fk) references users(user_id)
);

create table video (
    id_videos char(36) primary key,
    description varchar(200),
    date_upload datetime not null,
    likes int default 0,
    dislikes int default 0,
    user_fk char(36),
    genre_fk char(36),
    channel_fk char(36),
    foreign key (user_fk) references users(user_id),
    foreign key (genre_fk) references musicalgenre(id_genre),
    foreign key (channel_fk) references channels(id_channel)
);

create table comments (
    id_comment char(36) primary key,
    content varchar(200),
    date_creation datetime not null,
    likes int default 0,
    dislikes int default 0,
    user_fk char(36),
    video_fk char(36),
    foreign key (user_fk) references users(user_id),
    foreign key (video_fk) references video(id_videos)
);

create table playlist (
    id_playlist char(36) primary key,
    name varchar(30) not null,
    likes int default 0,
    user_fk char(36),
    foreign key (user_fk) references users(user_id)
);

create table community (
    id_community char(36) primary key,
    name varchar(25) unique not null,
    description varchar(200)
);

create table BankAccount (
    bank_id char(36) primary key,
    bank_name varchar(35),
    account_number varchar(16),
    country_fk char(36),
    user_fk char(36),
    foreign key (country_fk) references Country(country_id),
    foreign key (user_fk) references users(user_id)
);

create table playlist_video_REL (
    id_videos char(36),
    id_playlist char(36),
    primary key(id_videos, id_playlist),
    foreign key (id_videos) references video(id_videos),
    foreign key (id_playlist) references playlist(id_playlist)
);

create table community_user_REL (
    id_community char(36),
    user_id char(36),
    expiration_date datetime,
    primary key(id_community, user_id),
    foreign key (id_community) references community(id_community),
    foreign key (user_id) references users(user_id)
);

create table Subscriber_REL (
    user_id char(36),
    id_channel char(36),
    pay bool default false,
    pay_cost float,
    date_subscriptions datetime not null,
    primary key(user_id, id_channel),
    foreign key (user_id) references users(user_id),
    foreign key (id_channel) references channels(id_channel)
);

delimiter //

create trigger before_insert_country
before insert on Country
for each row
begin
  if new.country_id is null then
    set new.country_id = uuid();
  end if;
end//

create trigger before_insert_musicalgenre
before insert on musicalgenre
for each row
begin
  if new.id_genre is null then
    set new.id_genre = uuid();
  end if;
end//

create trigger before_insert_users
before insert on users
for each row
begin
  if new.user_id is null then
    set new.user_id = uuid();
  end if;
end//

create trigger before_insert_channels
before insert on channels
for each row
begin
  if new.id_channel is null then
    set new.id_channel = uuid();
  end if;
end//

create trigger before_insert_video
before insert on video
for each row
begin
  if new.id_videos is null then
    set new.id_videos = uuid();
  end if;
end//

create trigger before_insert_comments
before insert on comments
for each row
begin
  if new.id_comment is null then
    set new.id_comment = uuid();
  end if;
end//

create trigger before_insert_playlist
before insert on playlist
for each row
begin
  if new.id_playlist is null then
    set new.id_playlist = uuid();
  end if;
end//

create trigger before_insert_community
before insert on community
for each row
begin
  if new.id_community is null then
    set new.id_community = uuid();
  end if;
end//

create trigger before_insert_BankAccount
before insert on BankAccount
for each row
begin
  if new.bank_id is null then
    set new.bank_id = uuid();
  end if;
end//

delimiter ;

ALTER TABLE video
ADD COLUMN Popular BOOLEAN DEFAULT FALSE;

UPDATE video
SET Popular = TRUE
WHERE likes > 20;

UPDATE video
SET Popular = FALSE
WHERE likes <= 20;
