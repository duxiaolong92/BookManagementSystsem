create database BookManagementSystem
use BookManagementSystem 
create table admin_info(
	adminID int  primary key ,
	adminName varchar(30) not null ,
	password varchar(30) not null
)

alter table reader_info add activate bit 
create table reader_info(
	readerID int  primary key,
	readerName varchar(30) not null ,
	readerPassword varchar(30) not null,
	academy varchar(20) not null,
	className varchar(40) not null,
	tel varchar(20),
	email varchar(100) not null,
	sex varchar(2) check(sex in('女','男'),
	activate bit not null,
)

create table reading_room(
	readingRoomName varchar(30) primary key
)

create table book_type(
	bookTypeName varchar(30) primary key
)

create table book_info(
	bookID int  primary key,
    ISBN varchar(13) not null ,	
	bookName varchar(70) not null,
	press varchar(70) not null,
	author varchar(60) not null,
	price float not null,
	storageTime DateTime not null,
	bookTypeName varchar(30) not null foreign key references book_type(bookTypeName),
	readingRoomName varchar(30) not null foreign key references reading_room(readingRoomName),
	summaryNote Text not null,
    bookImage varchar(100) null,
) 

create table borrow_info(
	readerID int  foreign key references  reader_info(readerID),
	bookID int foreign key references book_info(bookID),
	borrowTime DateTime,
	returnTime DateTime not null,
	primary key(readerID,bookID,borrowTime)
)

create table giveback_info(
	readerID int  foreign key references  reader_info(readerID),
	bookID int  foreign key references book_info(bookID),
	borrowTime DateTime not null,
	returnTime DateTime ,
	fine float,
	primary key(readerID,bookID,returnTime)
)

create table reserve_info(
	readerID int  foreign key references  reader_info(readerID),
	bookID int  foreign key references book_info(bookID),
	reserveTime DateTime ,
	primary key(readerID,bookID ,reserveTime)
)

create table comment_info(
	readerID int  foreign key references  reader_info(readerID),
	bookID int  foreign key references book_info(bookID),
	comment TEXT not null,
	commentTime DateTime not null,
	primary key(readerID,bookID)
)
create table inform_info(
    informID int not null primary key,
    title varchar(20) not null,
    informTime DateTime not null,
    inform text not null,
    informType varchar(20) not null
)

--建立book_info的插入触发器，要求不能插入ISBN相同的书
create trigger book_info_ins on book_info
instead of insert as
begin
	if not exists (select * from inserted where ISBN in (select ISBN from book_info))
		begin
			insert into book_info select * from inserted
		end
	else
		begin
			print '不能输入图书ISBN相同的图书'
			rollback
		end
end
		
--建立admin_info的插入触发器，要求不能插入管理员名字相同的管理员
create trigger admin_info_ins on admin_info
instead of insert as
begin
	if  not exists(select * from inserted where adminName in (select adminName from admin_info))
		begin
			insert admin_info select * from inserted
		end
	else
		begin 
			print '不能输入管理员名字相同的管理员'
			rollback
		end 		
end

--建立reader_info的插入触发器，要求不能插入用户名相同的用户
create trigger reader_info_ins on reader_info
instead of insert as
begin
	if not exists (select readerName from inserted where readerName in (select readerName from reader_info))
		begin
			insert reader_info select * from inserted
		end
	else
		begin
			print '输入的用户名不能相同'
			rollback
		end
end

--建立book_type级联 删除 修改 触发器
create trigger book_type_del_upa on book_type
instead of delete,update
as
	if not exists(select * from inserted)
		begin	
			delete book_info where bookTypeName in (select bookTypeName from deleted)		
			delete book_type where bookTypeName in (select bookTypeName from deleted)			
		end
	else
		begin
			insert book_type select * from inserted
			update book_info set bookTypeName = (select bookTypeName from inserted) where bookTypeName in (select bookTypeName from deleted)	
			delete book_type where bookTypeName in (select bookTypeName from deleted)
		end

--建立reading_room级联 删除 修改 触发器
create trigger reading_room_del_upa on reading_room
instead of delete,update
as
	if not exists(select * from inserted)
		begin	
			delete book_info where readingRoomName in (select readingRoomName from deleted)		
			delete reading_room where readingRoomName in (select readingRoomName from deleted)
			
		end
	else
		begin
			insert reading_room select * from inserted
			update book_info set readingRoomName = (select readingRoomName from inserted) where readingRoomName in (select readingRoomName from deleted)	
			delete reading_room where readingRoomName in (select readingRoomName from deleted)
		end

--建立reader_info级联 删除 修改 触发器
create trigger reader_info_del_upa on reader_info
instead of delete,update
as 
	if not exists(select * from inserted)
		begin
			delete borrow_info where readerID in(select readerID from deleted)
			delete giveback_info where readerID in(select readerID from deleted)
			delete reserve_info where readerID in(select readerID from deleted)
			delete comment_info where readerID in(select readerID from deleted)
			delete reader_info where readerID in(select readerID from deleted)
		end
	else
		if update(readerID)
			begin
				insert reader_info select * from inserted
				update borrow_info set readerID = (select readerID from inserted) where readerID in (select readerID from deleted)
				update giveback_info set readerID = (select readerID from inserted) where readerID in (select readerID from deleted)
				update reserve_info set readerID = (select readerID from inserted) where readerID in (select readerID from deleted)
				update comment_info set readerID = (select readerID from inserted) where readerID in (select readerID from deleted)
				delete reader_info where readerID = (select readerID from deleted)
			end
		else 
			begin
				update reader_info set readerName = (select readerName from inserted),readerPassword = (select readerPassword from inserted),academy = (select academy from inserted),className = (select className from inserted),tel = (select tel from inserted),email = (select email from inserted),sex = (select sex from inserted) ,activate = (select activate from inserted )where readerID = (select readerID from deleted)		
			end
			

--建立book_info级联 删除 修改 触发器
create trigger book_info_del_upa on book_info
instead of delete,update
as 
	if not exists(select * from inserted)
		begin
			delete borrow_info where bookID in(select bookID from deleted)
			delete giveback_info where bookID in(select bookID from deleted)
			delete reserver_info where bookID in(select bookID from deleted)
			delete comment_info where bookID in(select bookID from deleted)
			delete book_info where bookID in(select bookID from deleted)
		end
	else
		if update(bookID)
			begin
				insert book_info select * from inserted
				update borrow_info set bookID = (select bookID from inserted) where bookID in (select bookID from deleted)
				update giveback_info set bookID = (select bookID from inserted) where bookID in (select bookID from deleted)
				update reserve_info set bookID = (select bookID from inserted) where bookID in (select bookID from deleted)
				update comment_info set bookID = (select bookID from inserted) where bookID in (select bookID from deleted)
				delete book_info where bookID = (select bookID from deleted)
			end
		else
			begin
				update book_info set ISBN = (select ISBN from inserted),bookName = (select bookName from inserted),press = (select press from inserted),author = (select author from inserted),price = (select price from inserted),storageTime = (select storageTime from inserted),bookTypeName = (select bookTypeName from inserted),readingRoomName = (select readingRoomName from inserted),summaryNote = (select summaryNote from inserted),bookImage = (select bookImage from inserted) where bookID = (select bookID from deleted)
			end


--借书不能超过5本
create trigger  more_than_5 on borrow_info
after insert 
as 
if (select count(*) from borrow_info where readerID in ( select readerID from inserted) )>5
begin 
print'借书数量不能超过5本'
rollback
end   


--预约书不能超过5本
create trigger  reserve_more_than_5 on reserve_info
after insert 
as 
if (select count(*) from reserve_info where readerID in ( select readerID from inserted) )>5
begin 
print'预约数量不能超过5本'
rollback
end 

--获得读者历史借阅信息触发器
create trigger get_readerBorrow_history on borrow_info
after delete
as
  begin
  insert into giveback_info(readerID,bookID,borrowTime,returnTime) select readerID,bookID,borrowTime,returnTime from deleted
end


--向admin_info 插入数据
select * from admin_info
delete admin_info where adminID>0
insert admin_info values(1,'杜小龙','($,fidEGE')
insert admin_info values(2,'崔丽珊','($,fidEGE')
insert admin_info values(3,'陈卫康','($,fidEGE')

--向reader_info插入数据
select * from reader_info
delete reader_info where readerName = '杜小龙'
insert reader_info values(1,'杜小龙','123456','软件学院','10级一班','18770091747','549262189@qq.com','男')
update reader_info set activate = 1 where email = '549262189@qq.com'
insert reader_info values(2,'崔丽珊','123456','软件学院','10级一班','18770091747','549262189@qq.com','女',0)
insert reader_info values(3,'陈卫康','123456','软件学院','10级一班','18770091747','549262189@qq.com','男')
insert reader_info values(3,'陈卫康','123456','软件学院','10级一班','18770091747','549262189@qq.com','男')
insert reader_info values(10004,'曹佳','-,0agbEAC','软件学院','10级一班','18770091747','549ags2@qq.com','男',1)
insert reader_info values(10005,'曹','-,0agbEAC','软件学院','10级一班','18770091747','549ghd2@qq.com','男',1)
insert reader_info values(10006,'曹佳炜wei','-,0agbEAC','软件学院','10级一班','18770091747','542@qq.com','男',1)
insert reader_info values(10007,'曹佳炜11','-,0agbEAC','软件学院','10级一班','18770091747','54@qq.com','男',1)


select top 1 readerID from reader_info order by readerID desc

update reader_info set readerPassword = '123' where readerID = 1

--向reading_room插入数据
select * from reading_room
insert reading_room values('文学阅览室')
insert reading_room values('科技阅览室')
insert reading_room values('生活阅览室')
insert reading_room values('经管阅览室')
insert reading_room values('历史阅览室')
insert reading_room values('流行阅览室')

--向book_type插入数据
insert book_type values('文学')
insert book_type values('科技')
insert book_type values('生活')
insert book_type values('经管')
insert book_type values('历史')
insert book_type values('流行')

--向inform_info插入数据
insert inform_info values(1,'EBSCO11月培训安排','2012-12-11','关于爱思唯尔ClinicalKey智能检索大赛及开放日活动开始的通知为帮助读者有效利用ASP/ASC+BSP/BSC的资源，ASP/ASC+BSP/BSC集团以及北京中科进出口有限责任公司安排了本月的培训安排计划，请您访问： Training Center ?? 实时课程。请点选注册 (即报名)，填写完数据后，您将收到确认信，请准时与会。请确认您所注册(报名)的场次所介绍数据库，贵单位有订购，以确保您可以使用该数据库。如需浏览已往课程录像，请点选录制的课程。','通知公告')
insert inform_info values(2,'EBSCO11月培训安排','2012-12-11','关于爱思唯尔ClinicalKey智能检索大赛及开放日活动开始的通知为帮助读者有效利用ASP/ASC+BSP/BSC的资源，ASP/ASC+BSP/BSC集团以及北京中科进出口有限责任公司安排了本月的培训安排计划，请您访问： Training Center ?? 实时课程。请点选注册 (即报名)，填写完数据后，您将收到确认信，请准时与会。请确认您所注册(报名)的场次所介绍数据库，贵单位有订购，以确保您可以使用该数据库。如需浏览已往课程录像，请点选 Training Center → 录制的课程。','资源动态')
insert inform_info values(3,'EBSCO11月培训安排','2012-12-11','关于爱思唯尔ClinicalKey智能检索大赛及开放日活动开始的通知为帮助读者有效利用ASP/ASC+BSP/BSC的资源，ASP/ASC+BSP/BSC集团以及北京中科进出口有限责任公司安排了本月的培训安排计划，请您访问：m进行访问。注意事项如下：参加在线教育训练课程，您须具备一台可以上网的计算机，并使用计算机内建的喇叭。如您所用的计算机位于公共区域如图书馆的检索区，请自备耳机。当月各场次信息请点选 Training Center ?? 实时课程。请点选注册 (即报名)，填写完数据后，您将收到确认信，请准时与会。请确认您所注册(报名)的场次所介绍数据库，贵单位有订购，以确保您可以使用该数据库。如需浏览已往课程录像，请点选 Training Center → 录制的课程。','新闻')

--向book_info表中插入数据
select * from book_info
select * from book_info where bookName = '围城'
insert into book_info values('10000','9787111126768','经济学原理（上下）','[美] 曼昆','机械工业出版社','88.0','2012-12-13 01:46:40','文学','文学阅览室','<p>此《经济学原理》的第3版把较多篇幅用于应用与政策，较少篇幅用于正规的经济理论。书中主要从供给与需求、企业行为与消费者选择理论、长期经济增长与短期经济波动以及宏观经济政策等角度深入浅出地剖析了经济学家们的世界观。</p>','http://localhost:8080/book-management-system/images/book/9787111126768.jpg')
delete book_info where bookID > 0
select * from book_info order by storageTime desc

select top 20  CONVERT(NVARCHAR(255),a.summaryNote , 112) as summaryNote,a.bookID,a.ISBN,a.bookName,a.press,a.bookTypeName,a.readingRoomName,a.storageTime,count(b.bookID) as borrowedTimes
  from book_info a  left join giveback_info b on a.bookID = b.bookID 
group by a.bookID,a.ISBN,a.bookName,a.press,a.bookTypeName,a.readingRoomName ,CONVERT(NVARCHAR(255) , a.summaryNote , 112),a.storageTime having a.bookTypeName = '流行' order by borrowedTimes  desc 

select a.bookID,a.ISBN,a.bookName,a.press,a.bookTypeName,a.readingRoomName,count(b.bookID) as borrowedTimes from book_info a  left join giveback_info b on a.bookID = b.bookID group by a.bookID,a.ISBN,a.bookName,a.press,a.bookTypeName,a.readingRoomName having a.bookTypeName = '流行'order by borrowedTimes desc

select *  from book_info a  left join giveback_info b on a.bookID = b.bookID 

(select top 6  * from book_info where summaryNote like '%韩寒%')  
select top 6 bookName from book_info where summaryNote like '%罗伯特%'

select * from book_info where bookTypeName = '文学'
select * from borrow_info where  
delete book_info where ISBN = '9789882075645'

select count(*) as bookNumber from book_info

15
select count(*) as bookListSize from book_info where bookTypeName = '文学'
select top 15 * from book_info where bookTypeName like '%文%' and bookID not in (select top 15 bookID from book_info where bookTypeName like '%文%')

select * from book_info where summaryNote like '%云图%' and bookID in(select bookID from book_info where bookTypeName='文学' and summaryNote like '%的%')



--向giveback_info 插入数据
select * from giveback_info

insert giveback_info values(1,1,'2012-04-05','2012-05-05',null)
insert giveback_info values(1,3,'2012-04-05','2012-05-05',null)
insert giveback_info values(1,4,'2012-04-05','2012-05-05',null)
insert giveback_info values(1,5,'2012-04-05','2012-05-05',null)

insert giveback_info values(2,1,'2012-04-05','2012-05-05',null)
insert giveback_info values(2,3,'2012-04-05','2012-05-05',null)
insert giveback_info values(2,4,'2012-04-05','2012-05-05',null)
insert giveback_info values(2,5,'2012-04-05','2012-05-05',null)

--向reserver_info插入数据
insert reserve_info values(1,1,'2012-05-05')
insert reserve_info values(1,2,'2012-05-05')
insert reserve_info values(1,3,'2012-05-05')
insert reserve_info values(1,4,'2012-05-05')
insert reserve_info values(1,5,'2012-05-05')

insert reserve_info values(2,1,'2022-05-05')
insert reserve_info values(2,2,'2022-05-05')
insert reserve_info values(2,3,'2022-05-05')
insert reserve_info values(2,4,'2022-05-05')
insert reserve_info values(2,5,'2022-05-05')

--向comment_info插入数据
select * from comment_info
select * from reader_info
delete comment_info where readerID = 10000
insert comment_info values(1,1,'你是爱神的箭客服哈金卡是东方红ajksdfhasd','2012-05-05')
insert comment_info values(1,2,'你是爱神的箭客服哈金卡是东方红ajksdfhasd','2012-05-05')
insert comment_info values(1,3,'你是爱神的箭客服哈金卡是东方红ajksdfhasd','2012-05-05')
insert comment_info values(1,4,'你是爱神的箭客服哈金卡是东方红ajksdfhasd','2012-05-05')
insert comment_info values(1,5,'你是爱神的箭客服哈金卡是东方红ajksdfhasd','2012-05-05')

insert comment_info values(2,1,'你是爱神的箭客服哈金卡是东方红ajksdfhasd','2012-05-05')
insert comment_info values(2,2,'你是爱神的箭客服哈金卡是东方红ajksdfhasd','2012-05-05')
insert comment_info values(2,3,'你是爱神的箭客服哈金卡是东方红ajksdfhasd','2012-05-05')
insert comment_info values(2,4,'你是爱神的箭客服哈金卡是东方红ajksdfhasd','2012-05-05')
insert comment_info values(2,5,'你是爱神的箭客服哈金卡是东方红ajksdfhasd','2012-05-05')


select * from reserve_info
delete from reserve_info where readerID >100
select * from book_info
update reserve_info set readerID = 10004 where readerID = 10000

insert reserve_info values(10000,10000,'2007-12-12')

select * from book_info where ISBN = '9787532759064'
delete from book_info where ISBN = '9787540453176'
select * from book_info where bookID = '10001'

select * from inform_info
select top 5 * from inform_info where informType='通知公告'
select top 5 from inform_info where informType='资源动态'

delete comment_info where readerID=10000 and bookID = 10005
select * from comment_info
select * from giveback_info
select * from reader_info

select * from giveback_info
select * from borrow_info
delete  from giveback_info where readerID = 10003
delete  from borrow_info where readerID = 10003


insert giveback_info(readerID,bookID,borrowTime,returnTime) values(select readerID,bookID,borrowTime,returnTime from borrow_info where bookID=10001)


select count(*)  from borrow_info where readerID=10003
