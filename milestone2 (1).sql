create Database DBPROJECT;
/*start 2.1*/
/* a)create tables*/
go;
CREATE Procedure createAllTables
as
CREATE TABLE SystemUser (
username Varchar(20) PRIMARY KEY  ,
Password varchar(20));

CREATE TABLE Stadium (
ID int PRIMARY KEY IDENTITY, name varchar(20) , capacity int , location varchar(20) , status bit);

CREATE Table StadiumManager (
ID int IDENTITY, username varchar(20)  , name varchar(20) , stadium_ID int , Primary key ( Id ) ,
foreign key (stadium_ID) References Stadium(ID) on delete cascade on update cascade, foreign key (username) References SystemUser on delete no action on update no action );

CREATE Table Club (
club_ID int PRIMARY KEY IDENTITY, name Varchar(20) , location varchar(20));

CREATE Table ClubRepresentative (
username varchar(20) , ID int IDENTITY, name varchar(20) ,  club_ID int , PRIMARY KEY ( ID ) ,
foreign key (username ) References SystemUser on delete no action on update no action, foreign key (club_ID) references club on delete cascade on update cascade
);

CREATE Table Matches (ID int PRIMARY KEY IDENTITY , start_Time datetime ,end_time datetime, stadium_ID int , clubHost_ID int , clubGuest_ID int  ,
foreign key (stadium_ID) References Stadium on delete cascade on update cascade, foreign key ( clubHost_ID )references club on delete cascade on update cascade ,
foreign key ( clubguest_ID )references club on delete no action on update no action);

CREATE Table HostRequest (
ID int PRIMARY KEY IDENTITY ,status varchar(20) , Matches_ID int , Stadium_Manager_ID int , club_Representative_ID int
foreign key (Stadium_Manager_ID) References StadiumManager on delete no action on update no action, foreign key(matches_id) References matches on delete cascade on update cascade,
foreign key (club_Representative_ID) References ClubRepresentative on delete no action on update no action );

CREATE Table Fan(
National_id varchar(20) primary key, birth_date datetime , phone_NO int, Name varchar(20), address varchar(20),
 status bit, username varchar(20), foreign key(username) references SystemUser on delete cascade on update cascade);
 
CREATE Table Ticket(
status bit, matches_id int, id int identity , PRIMARY KEY (id )
, foreign key(matches_ID) references Matches on delete cascade on update cascade );

CREATE Table SystemAdmin (
id int identity, name varchar(20),  username varchar(20), PRIMARY KEY(id),
 foreign key(username) references SystemUser on delete cascade on update cascade);

CREATE Table SportsAssociationManager(
id int identity, name varchar(20), username varchar(20),
PRIMARY KEY(id), foreign key(username) references SystemUser on delete cascade on update cascade);

Create Table Ticket_buying_Transaction(fannational_id varchar(20),ticket_id int 
,foreign key(fannational_id)references fan on delete no action on update no action,foreign key(ticket_id)references ticket on delete cascade on update cascade);
/* b)drop tables*/
go;

CREATE Procedure dropAllTables
as
drop table ticket_buying_transaction;
drop table SportsAssociationManager;
drop table SystemAdmin;
drop table Ticket;
drop table fan;
drop table  HostRequest;
drop table  matches;
drop table ClubRepresentative ;
drop table club;
drop table stadiumManager;
drop table Stadium;
drop table systemUser;

/* c)drop all procedures */
go;
CREATE Procedure dropAllProceduresFunctionsViews
as
drop procedure createAllTables,dropAllTables,clearAllTables, addAssociationManager,addNewMatch,
 deleteMatch,deleteMatchesOnStadium,addClub,addTicket,deleteClub,addStadium,
 deleteStadium, blockFan, unblockFan, addrepresentative, addHostRequest,addStadiumManager,
 acceptRequest,rejectRequest ,addFan,purchaseTicket,updateMatchHost,deleteMatchesOnStadium

;


drop view allTickets,allStadiumManagers,allClubs, allAssocManagers, allClubRepresentatives,
allStadiumManagers, allFans, allMatches, allStadiums,allRequests,
clubsWithNoMatches, matchesPerTeam, clubsNeverMatched
;

drop function  viewAvailableStadiumsOn , allUnassignedMatches, allPendingRequests,
upcomingMatchesOfClub ,availableMatchesToAttend, clubsNeverPlayed , 
matchWithHighestAttendance,matchesRankedByAttendance, requestsFromClub;
go;
/* d) trunacte tables*/
create procedure clearAllTables 
as 
exec dropAllTables
exec createAllTables
go;
/*end 2.1*/
/*start 2.2 */
/* a)*/
create view allAssocManagers
as
select s.username,a.password,s.name
from sportsAssociationManager s inner join SystemUser a on s.username=a.username ;
go;
/*b)*/
create view allClubRepresentatives
 as 
 select  r.username,a.password,r.name , c.name as club_name
 from ClubRepresentative r inner join Club c on c.club_ID=r.club_ID  inner join SystemUser a on a.username=r.username;
 go;
 /*c)*/
 create view allStadiumManagers 
 as 
 select m.username ,a.password, m.name , s.name as stadium_name
 from StadiumManager m inner join Stadium s on m.stadium_ID=s.ID inner join SystemUser a on a.username=m.username
 go;
 /* d)*/
 create view allFans
 as 
 select f.username,a.password,f.name , f.National_id , f.birth_date ,f.status
 from fan f inner join SystemUser a on a.username=f.username
 go;
 /*e)*/ 
 create view allMatches
 as 
 select  c1.name as host  , c2.name as guest , m.start_Time
 from Matches m inner join club c1 on c1.club_ID=m.clubHost_ID
               inner join club c2 on m.clubGuest_ID=c2.club_ID
go;
/*f)*/
create view allTickets
as
select c1.name As hostclub ,c2.name As guestclub, S.name As Stadium_name,M.start_time 
from Matches M inner join Club c1 on M.clubHost_ID =c1.club_ID inner join Club c2 on M.clubguest_Id=c2.club_ID 
inner join STADIUM S ON M.stadium_ID=S.id;
go;
/*g)*/
create view allClubs
as
select c.name,c.location
from club c;
go;
/*h)*/
create view allStadiums
as 
select s.name,s.location,s.capacity ,s.status
from stadium s;
go;
/* i)*/
create view allRequests
as
select cr.username as clubrepresentativeusername,m.username as stadiummanagerusername, H.status as status
from HostRequest H inner join ClubRepresentative CR on H.club_Representative_ID=CR.ID inner join
stadiumManager M on H.Stadium_Manager_ID=M.ID; 
go;
/*end 2.2*/
/* start 2.3*/
/*1*/
/*2.3*/
/* (i)*/
create procedure addAssociationManager
@managername varchar(20),
@managerusername varchar(20),
@managerpass varchar(20)
as
if 
 (not exists (select s.username 
from SystemUser s where @managerusername=s.username) )
begin 
insert into SystemUser values (@managerusername ,@managerpass)
insert into SportsAssociationManager
values(@managername,@managerusername);
end ;
go;
/* (ii)*/
create procedure addNewMatch
@hostclubname varchar(20),
@guestclubname varchar(20),
@starttime  datetime,
@endtime datetime
as 
insert into matches (start_Time,end_time,clubHost_ID,clubGuest_ID)
select @starttime,@endtime,c1.club_ID,c2.club_ID
from club c1, club c2 
where @hostclubname=c1.name and @guestclubname=c2.name;
go;
/* (iii)*/
create view clubsWithNOMatches 
as 
select c.name
from club c 
where c.club_ID not in(
select m.clubHost_ID
from matches m
union select k.clubGuest_ID
from matches k)
go;
/*(iv)*/
create procedure deleteMatch
@hostclubname varchar(20),
@guestclubname varchar(20)
as
delete from matches
where
matches.ID in (
select m.ID
from matches m inner join club ch on ch.club_ID=m.clubHost_ID inner join club cg on cg.club_ID=m.clubGuest_ID
where ch.name=@hostclubname and cg.name=@guestclubname)
go;
/*(v)*/
create procedure deleteMatchesOnStadium 
@S1 varchar(20)
as
delete from Matches 
where ID in(
select m.ID
from stadium s inner join Matches m on m.stadium_ID=s.ID 
where s.name=@s1 and m.start_Time>current_timestamp );
go;
/*(vi)*/
create procedure addClub
@name varchar(20) , 
@location varchar(20)
as
begin 
insert into Club ( name , location ) Values ( @name , @location )
end 
go;
/*(vii)*/
create procedure addTicket
@hostclubname varchar(20),
@guestclub varchar(20),
@startingtime datetime
as
insert into Ticket(status,matches_id)
select 1,m.ID
from Matches m inner join club c1 on c1.club_ID=m.clubHost_ID inner join club c2 on m.clubGuest_ID=c2.club_ID
where m.start_Time=@startingtime and c1.name=@hostclubname and c2.name=@guestclub;
go;
/*(viii)*/
create procedure deleteClub
@clubname varchar(20)
as
declare @crusername varchar (20)= (select top 1 cr.username 
from ClubRepresentative cr inner join club c on c.club_ID=cr.club_ID
where c.name=@clubname)
delete from matches 
where ID in(
select m.id
from matches m inner join club cg on cg.club_ID=m.clubGuest_ID
where cg.name=@clubname)
delete from club  where name=@clubname;
/*delete CR*/
delete from SystemUser
where username=@crusername;
go;
/*(ix)*/
create procedure addStadium 
@stadiumname varchar(20),
@stadiumlocation varchar(20),
@stadiumcapacity int
as 
insert into Stadium
values( @stadiumname, @stadiumcapacity, @stadiumlocation, 1);
go;
/*(x)*/
create procedure deleteStadium
@name varchar(20)
as
declare @susername varchar(20)=(select sm.username
from stadium s inner join stadiummanager sm on sm.stadium_ID=s.ID
where s.name=@name)
update Matches
set stadium_ID= null
where stadium_ID
in(select s.ID
from stadium s
where s.name=@name)
delete from HostRequest
where Stadium_Manager_ID
in (select s.ID
from StadiumManager s
where s.username=@susername)
delete from Stadium where Stadium.name=@name;
delete from SystemUser
where username=@susername;
go;
/*(xi)*/ 
create procedure blockFan
@nid varchar(20)
as
update fan
set  status=0 
where national_id = @nid;
go;

/*(xii)*/
create proc unblockFan 
@nid varchar(20)
as
update fan
set  status=1
where national_id = @nid;
go;
/*(xiii)*/
create procedure addrepresentative 
@representativename varchar(20),
@clubname varchar (20),
@representativeusername varchar(20),
@representativePassword varchar(20)
as 
if 
 (not exists (select s.username 
from SystemUser s where @representativeusername=s.username) )
begin 
insert into SystemUser 
values( @representativeusername , @representativePassword); 
insert into ClubRepresentative
select  @representativeusername ,@representativename, c.club_ID
from club c
where c.name = @clubname;
end;
go;
/*(xiv)*/
create function viewAvailableStadiumsON (@ourdatetime datetime)
returns @t table(name varchar(20),location varchar(20),capacity int )
as
Begin 
      insert into @t 
	 select s1.name, s1.location, s1.capacity 
	from Stadium s1 
	except
    (select s.name, s.location, s.capacity
	from
	stadium s inner join matches m on (s.ID= m.stadium_ID)
	where   @ourdatetime between  m.start_Time and m.end_time )
	return 
	
ENd;
go;
/*(xv)*/
create procedure addHostRequest
@clubname varchar(20),
@stadiumname varchar(20),
@matchstartingtime datetime
as
insert into HostRequest 
select 'unhandled', m.id, sm.id, cr.id
from stadium s inner join StadiumManager sm on (s.id = sm.stadium_ID), club c inner join ClubRepresentative cr 
on (c.club_ID = cr.club_ID) inner join matches m on m.clubHost_ID=c.club_ID
where m.start_Time = @matchstartingtime and s.name = @stadiumname and c.name = @clubname;
go;

/*(xvi)*/

create function   allUnassignedMatches (@clubname varchar(20))
returns @t table(guestclub varchar(20), starttime datetime  )
as
Begin 
      insert into @t 
	 select  cg.name as guestclub , m.start_Time 
	from matches m inner join club ch on ch.club_ID=m.clubHost_ID 
    inner join club cg on m.clubGuest_ID=cg.club_ID 
    where ch.name=@clubname and m.stadium_ID is null ;
	return 
	
ENd;
go;
/*(xvii)*/
create procedure addStadiumManager
@managername varchar(20),
@stadiumname varchar(20),
@username varchar(20),
@managerpassword varchar(20)
as
if 
 (not exists (select s.username 
from SystemUser s where @username=s.username) )
begin 
insert into SystemUser values(@username , @managerpassword);
insert into stadiummanager 
select @username, @managername, s.id
from stadium s 
where s.name = @stadiumname
end
go;
/*(xviii)*/
create function AllPendingRequests (@Manager_username  varchar(20))
returns @t table(crname varchar(20),competingname varchar(20), startingtime datetime )
as
Begin 
insert into @t 
select cr.name, case when (m.clubhost_id=cr.club_id) then cg.name else ch.name end , m.start_time
from hostrequest h inner join 
stadiummanager s on (h.stadium_manager_id = s.id) inner join 
matches m on (m.id = h.matches_id) inner join clubrepresentative cr on (cr.club_ID = h.club_Representative_ID)
inner join club ch on (m.clubhost_id = ch.club_ID) inner join club cg on 
(m.clubguest_id = cg.club_ID)
where s.username = @Manager_username and h.status='unhandled';
return 
end
go;
/*(xix)*/
create proc acceptRequest
  @manager_userName varchar(20),
  @hostclub varchar(20),
  @guestClub varchar(20),
  @date datetime  
  as
    update hostrequest
     set status='accepted'
     where id in  (
     select h.ID
     from  matches m
         inner join club c1 on c1.club_ID = m.clubhost_id 
         inner join club c2 on c2.club_ID= m.clubguest_id
         inner join hostrequest h  on h.matches_id=m.id
         inner join stadiumManager s on s.id= h.stadium_manager_id inner join ClubRepresentative cr on cr.club_ID=c1.club_ID 
         where cr.ID=h.club_Representative_ID
        and @manager_userName=s.username and   @hostclub=c1.name and   @guestClub=c2.name and  @date=m.start_time  and h.status='unhandled')
   update matches 
      set stadium_ID = (
      select top 1 s.ID
      from stadium s inner join StadiumManager sm on s.ID=sm.stadium_ID  
      where sm.username=@manager_userName 
      )where id in(
     select m.id from
     matches  m inner join  club ch on ch.club_ID =m.clubHost_ID inner join club cg on cg.club_ID=m.clubGuest_ID
      where  ch.name=@hostclub and @guestClub=cg.name and  @date=m.start_time  and m.stadium_ID is null)
      /* generate tickets*/
      declare @i int =0;
      declare @stadiumcapacity int =( select top 1 s.capacity from
      stadium s inner join StadiumManager sm on s.ID=sm.stadium_ID 
      where sm.username=@manager_userName)

      declare @matchid int =(select top 1 m.id from
     matches  m inner join  club ch on ch.club_ID =m.clubHost_ID inner join club cg on cg.club_ID=m.clubGuest_ID
      where  ch.name=@hostclub and @guestClub=cg.name and  @date=m.start_time )
      while @i < @stadiumcapacity
      begin
      insert into Ticket
      values(1,@matchid)
      set @i=@i+1 
     end
go; 
/*(xx)*/
  create proc rejectRequest
  @manageruserName varchar(20),
  @hostclub varchar(20),
  @guestClub varchar(20),
  @date datetime  
  as
    update hostrequest
     set status='rejected'
     where id in  (
     select  h.ID
  from  matches m
         inner join club c1 on c1.club_ID = m.clubhost_id 
         inner join club c2 on c2.club_ID= m.clubguest_id
         inner join hostrequest h  on h.matches_id=m.id
         inner join stadiumManager s on s.id= h.stadium_manager_id 
         inner join ClubRepresentative cr on cr.club_ID=c1.club_ID 
         where cr.ID=h.club_Representative_ID and @manageruserName=s.username and   @hostclub=c1.name and   @guestClub=c2.name and  @date=m.start_time );
 go;
  /*xxi*/
Create procedure addFan 
@Fname varchar(20) ,
@Fusername varchar(20) ,
@Fpassword varchar(20) ,
@FNational_ID varchar(20) ,
@birthdate datetime , 
@add varchar(20) ,
@phoneNo INT 
as 
if 
 (not exists (select s.username 
from SystemUser s where @Fusername=s.username) )
begin 
insert into SystemUser 
values( @Fusername , @Fpassword); 
INSERT INTO FAN  Values
(@FNational_ID,  @birthdate , @phoneNo ,@fname,  @add ,1,@Fusername) ;
end ;
go;
/*xxii*/
create function upcomingMatchesOfClub(@clubname varchar(20) )
returns @t table (clubname varchar(20) , competinClubname varchar(20) ,
startTime dateTime , StadiumName varchar(20) ) 
as 
begin 
insert into @t 
select @clubname , case when (ch.name=@clubname)then cg.name else ch.name end , ma.start_time , s.name
from 
matches ma inner join club ch on ( ch.club_id =ma.clubhost_id ) inner join 
club cg on ( cg.club_id = ma.clubguest_id) inner join stadium s on s.id=ma.stadium_id 
where (cg.name=@clubname or ch.name=@clubname) and ma.start_time>current_timestamp ;
return
end
go;
/*(xxiii)*/
create function availableMatchestoattend (@date datetime)
returns @t table(hostclubname varchar(20),competingclubname varchar(20), startingtime datetime, stadiumhost varchar(20) )
as
Begin 
insert into @t 
select  ch.name, cg.name, m.start_Time, s.name
from matches m inner join club ch on(m.clubHost_ID = ch.club_ID) inner join club cg on (m.clubGuest_ID = cg.club_ID) 
inner join stadium s on (m.stadium_ID= s.id) inner join Ticket t on (m.id = t.matches_id)
where t.status = 1 and m.start_Time > @date
group by  ch.name, cg.name, m.start_Time, s.name
return
end
go;
/*(xxiv)*/
create procedure purchaseTicket 
@nationalid varchar(20),
@hostingname varchar(20),
@competingname varchar(20),
@matchdate datetime
as
declare @fanstatus int =(
select top 1  f.status
from fan f 
where f.National_id = @nationalid
)
declare @tid int =(
select  top 1 t.id
from ticket t inner join matches m on t.matches_id = m.id inner join club ch on ch.club_ID = m.clubHost_ID inner join club cg on cg.club_ID = m.clubGuest_ID
where t.status = 1 and ch.name =@hostingname and cg.name = @competingname  and m.start_Time = @matchdate )
update ticket 
set status = 0 
where id = @tid and @fanstatus = 1
if @fanstatus = 1 and @tid is not null
    insert into Ticket_buying_Transaction values(@nationalid,@tid)
go;
/*xxv*/
create procedure updateMatchHost
@clubname varchar(20),
@guestclubname varchar(20),
@starttime datetime
as
delete from ticket 
where matches_id in(select m.id
from matches m inner join  club ch on ch.club_ID=m.clubHost_ID inner join  club cg on cg.club_ID=m.clubGuest_ID
where m.start_Time=@starttime and ch.name=@clubname and cg.name=@guestclubname)
update matches
set clubHost_ID=clubGuest_ID,clubGuest_ID=clubHost_ID,stadium_ID=null
where id in (select m.ID
from club c1 inner join  matches m on m.clubGuest_ID=c1.club_ID inner join club c2 on c2.club_ID=m.clubHost_ID
where c1.name=@guestclubname and c2.name=@clubname and m.start_Time=@starttime)and clubHost_ID in(select c2.club_ID
from club c1 inner join  matches m on m.clubGuest_ID=c1.club_ID inner join club c2 on c2.club_ID=m.clubHost_ID
where c1.name=@guestclubname and c2.name=@clubname and m.start_Time=@starttime)

go;
/*xxvi*/
create view matchesPerTeam
as 
select c.name,count(*) as countofmatches
from club c inner join matches m on (c.club_ID=m.clubGuest_ID or c.club_ID=m.clubHost_ID)
where m.end_time < CURRENT_timestamp 
group by c.name;
go;
/*xxvii*/
create view clubsNeverMatched
as
select c1.name as club1 , c2.name as club2
 from club c1 ,club c2 
 where c1.club_ID<c2.club_ID and
  not exists (
    select *
    from matches m
    where  (m.clubGuest_ID=c1.club_ID and m.clubHost_ID=c2.club_ID) or (m.clubGuest_ID=c2.club_ID and m.clubHost_ID=c1.club_ID ) );
go; 
/*xxviii*/
go;
Create function clubsNeverPlayed (@repclubname varchar(20))
returns @t table (clubname varchar(20))
as 
Begin 
insert into @t 
select c.name 
from club c
where not exists (
             select ch.club_ID, cg.club_ID
             from matches ma inner join club ch on ( ch.club_ID =ma.clubhost_id ) inner join club cg on 
             ( cg.club_ID = ma.clubguest_id) 
             where (
             (ch.name = @repclubname ) OR ( cg.name = @repclubname ) )
             And (c.club_ID = ch.club_ID or c.club_ID = cg.club_ID ) 
             ) and c.name <> @repclubname
return 
end 
go;
/*xxix*/
create function matchWithHighestAttendance () 
returns @t table ( hostname varchar(20) , guestname varchar(20)) 
as 
begin 
insert into @t 
select ch.name, cg.name
from matches m inner join ticket t on(m.id = t.matches_id )
inner join club ch on (m.clubHost_ID = ch.club_ID)inner join club cg 
on(m.clubGuest_ID = cg.club_ID)

where t.status =0
group by m.ID,ch.name,cg.name
having count(t.id)
>=all(select count(*)
from matches mm inner join ticket tt on mm.ID=tt.matches_id
where tt.status=0
group by mm.ID)
return
end
go;
/*xxx*/
create function matchesRankedByAttendance()
returns @t table(hostname varchar (20),guestname varchar(20),nooftickets int )
as
Begin 
insert into @t
select c1.name as clubhost , c2.name as clubguest ,count(*) as nooftickets
from matches m  inner join club c1 on c1.club_ID=m.clubHost_ID
inner join club c2 on c2.club_ID=m.clubGuest_ID inner join ticket t on t.matches_id=m.ID
where t.status=0 
group by m.ID,c1.name,c2.name
union (
select ch.name, cg.name, 0
from matches ms inner join club ch on ch.club_ID = ms.clubHost_ID 
inner join club cg on cg.club_ID = ms.clubGuest_ID inner join ticket ta on ta.matches_id = ms.id
where ms.ID not in (
        select ma.id
        from matches ma  inner join ticket ti on ti.matches_id=ma.ID
        where ti.status = 0 
        )
group by ms.id, ch.name, cg.name
)
order by count(*) desc
return
end
go;

/*xxxi*/
create function requestsFromClub(@stadiumname varchar(20),@clubname varchar(20))
returns @t table(hostname varchar (20),guestname varchar(20))
as
Begin 
insert into @t
select ch.name, cg.name
from stadium s inner join StadiumManager sm on sm.stadium_ID=s.ID inner join HostRequest hr 
on hr.Stadium_Manager_ID=sm.ID inner join Matches m on m.ID=hr.Matches_ID inner join ClubRepresentative cr 
on cr.club_ID=m.clubHost_ID and hr.club_Representative_ID=cr.ID inner join club ch on m.clubHost_ID=ch.club_ID 
inner join club cg on cg.club_ID=m.clubGuest_ID
where s.name=@stadiumname and ch.name=@clubname
return
end
go;
/*insert into SystemUser values ('zahra', '111')
insert into SystemUser values ('Dareen', '222')
insert into SystemUser values ('shosho', '333')
insert into SystemUser values ('yasso', '444')
insert into SystemUser values ('sama', '555')
insert into SystemUser values ('rawan', '666')
insert into SystemUser values ('salma', '777')
insert into SystemUser values ('farah', '888')
insert into SystemUser values ('bla', '999')
insert into SystemUser values ('blabla', '000')
insert into Stadium values ('guc', 5, 'tagmo3', 0)
insert into Stadium values ('auc', 5, 'tagmo3', 0)
insert into Stadium values ('bue', 5, 'sheroo2', 1)
insert into Stadium values ('giu', 5, 'wherever', 1)
insert into StadiumManager values ('zahra', 'Zahra', 3)
insert into StadiumManager values ('Dareen', 'Dareen', 4)
insert into club values ('ahly', 'cairo')
insert into club values ('zamalek', 'cairo1')
insert into club values ('pyramids', 'cairo2')
insert into club values ('future', 'cairo3')
insert into ClubRepresentative values ('shosho','shahenda', 1)
insert into ClubRepresentative values ('yasso','yasmin', 2)
insert into ClubRepresentative values ('sama','sama', 3)
insert into ClubRepresentative values ('rawan','rawan', 4)
insert into matches values ('2024-5-3 09:10:00','2024-5-3 10:10:00', 3, 1, 2 )
insert into matches values ('2022-6-3 09:10:00', '2022-6-3 10:10:00',2, 2, 3)
insert into matches values ('2022-7-3 09:10:00','2022-7-3 10:10:00', 1, 1, 2 )
select * from club
insert into HostRequest values ('accepted', 1, 1, 1) select * from hostrequest
insert into HostRequest values ('unhandled', 2, 1, 2)
insert into HostRequest values ('accepted', 3, 2, 1)
insert into Fan values (123, '2002-5-3 09:10:00', '11', 'salma', 'rehab', 1, 'salma')
insert into Fan values (344, '2002-5-3 09:10:00', '20', 'farah', 'rehab', 1, 'farah')
insert into ticket values(0, 1)
insert into ticket values(0, 1)
insert into ticket values(1, 1)
insert into ticket values(1, 3)
insert into ticket values(1, 2)
insert into SystemAdmin values ('bla', 'bla')
insert into SportsAssociationManager values ('blabla', 'blabla')
insert into Ticket_buying_Transaction values (123, 1)
insert into Ticket_buying_Transaction values (344, 2)*/



