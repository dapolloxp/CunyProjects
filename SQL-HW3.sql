USE it_system;

CREATE TABLE rooms
(
	roomid int PRIMARY KEY,
    room_name varchar(100) NOT NULL UNIQUE
);

INSERT INTO rooms (roomid, room_name) VALUES (1, "101");
INSERT INTO rooms (roomid, room_name) VALUES (2, "102");
INSERT INTO rooms (roomid, room_name) VALUES (3, "Auditorium A");
INSERT INTO rooms (roomid, room_name) VALUES (4, "Auditorium B");

select * from rooms;

CREATE TABLE users
(
	userid int PRIMARY KEY,
    username varchar(100) NOT NULL UNIQUE,
    groupid int,
    CONSTRAINT fk_user_securitygroup FOREIGN KEY (groupid)
    REFERENCES security_group(groupid)    
    
);

CREATE TABLE security_group
(
	groupid int PRIMARY KEY,
    group_name varchar(100) NOT NULL UNIQUE
    
);

INSERT INTO users (userid, username, groupid) VALUES (1, "Modesto", 1);
INSERT INTO users (userid, username, groupid) VALUES (2, "Ayine", 1);
INSERT INTO users (userid, username, groupid) VALUES (3, "Chris",2);
INSERT INTO users (userid, username, groupid) VALUES (4, "Cheong",2);
INSERT INTO users (userid, username, groupid) VALUES (5, "Saulat",3);
INSERT INTO users (userid, username) VALUES (6, "Heidy");


SELECT * FROM users;


## adding Modesto and Ayline to IT group
INSERT INTO security_group (groupid, group_name) VALUES (1, "I.T");
INSERT INTO security_group (groupid, group_name) VALUES (2, "Sales");
INSERT INTO security_group (groupid, group_name) VALUES (3, "Administration");
INSERT INTO security_group (groupid, group_name) VALUES (4, "Operations");

select * from security_group;

CREATE TABLE security_group_rooms
(
	groupid int NOT NULL REFERENCES security_group(groupid),
	roomid int NOT NULL REFERENCES rooms(roomid),
    
    CONSTRAINT pk_rooms_groups PRIMARY KEY(groupid, roomid)
);
SELECT * FROM security_group_rooms;

INSERT INTO security_group_rooms(groupid, roomid) VALUES(1,1);
INSERT INTO security_group_rooms(groupid, roomid) VALUES(1,2);
INSERT INTO security_group_rooms(groupid, roomid) VALUES(2,2);
INSERT INTO security_group_rooms(groupid, roomid) VALUES(2,3);

##  All groups, and the users in each group. A group should appear even if there are no users assigned to the group.

select group_name, username from users as u 
left JOIN security_group as g on u.groupid = g.groupid;


### All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been
### assigned to them.

SELECT r.room_name AS "Room", g.group_name AS "Group"
FROM rooms as r 
LEFT JOIN security_group_rooms AS sgr ON sgr.roomid = r.roomid
LEFT JOIN security_group as g ON g.groupid = sgr.groupid;

## A list of users, the groups that they belong to, and the rooms to which they are assigned. 
##This should be sported alphabetically by the user, then by group, then by room

SELECT u.username as "User", g.group_name as "Group", r.room_name as "Room"
FROM users as u
LEFT JOIN security_group as g ON g.groupid = u.groupid
LEFT JOIN security_group_rooms as sgr ON sgr.groupid = g.groupid
LEFT JOIN rooms as r ON r.roomid = sgr.roomid
group by username, group_name, room_name
order by username, group_name, room_name;
