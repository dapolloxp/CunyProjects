CREATE DATABASE HowToVideos;


 USE howtovideos;
 
CREATE TABLE videos (
  VideoID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Title nchar(50) NOT NULL,
  length float,
  URL nchar(50)
  );
  

  
  
CREATE TABLE VideoReviews (
	ReviewID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    VideoID int NOT NULL,
    FOREIGN KEY VideoID(VideoID) 
    REFERENCES videos(VideoID),
    Name NCHAR(30),
    Review TEXT(500) NOT NULL,
    Rating int CHECK(RATING >= 0 AND Rating >=5 OR Rating = null)

);

INSERT INTO videos(VideoID, Title, length, URL)
VALUES
	(1, "These Are The Best Horror Movies Of 2018", 11.21, "https://www.youtube.com/watch?v=BCBzRXux6vI"),
    (2, "12 Movies That'll Blow Everyone Away In 2019", 6.33, "https://www.youtube.com/watch?v=tn0r3KiywNQ"),
    (3, "The Ending of Bird Box Explained)", 5.25, "https://www.youtube.com/watch?v=pfugyorn-QE"),
    (4, "BIRD BOX Ending + Monsters Explained!", 10.21, "https://www.youtube.com/watch?v=OEWP31PK4cY"),
    (5, "Horror Movies That Will Blow Everyone Away in 2019", 11.22, "https://www.youtube.com/watch?v=WR46CY0xrgw")
;

INSERT INTO videos(Title, length, URL)
VALUES
	("The True Ending Of Inception FINALLY Revealed", 92, "https://www.youtube.com/watch?v=LiloW0_ivNM" ),
    ("Inception: Ending Explained", 14.58, "https://www.youtube.com/watch?v=e5ado3zJVXw")
;

INSERT INTO VideoReviews(VideoID, Name, Review, Rating)
VALUES
	(1, "John", "This video doesn't give much detail into why the selected horrible movies are the best of 2018", 2),
    (1, "Bill G", "This video hit on all the best 2018 horrow movies. Top notch!", 5),
    (2, "Dave R", "I think they got a good list of movies that are highly anticipated, but I think they missed a few in my opinion", 4),
    (2, "Alex M", "They got the list SPOT ON!", 5),
    (3, "Nadia R", "The reviewer didn't explain the ending properly.", 1),
    (3, "Susan S", "This video sucked. It didn't give additional informationt everyone didn't already know.", 2),
    (4, "Samanta H", "Awesome explaination of Birdbox!", 5),
    (4, "Steven K", "Excellent explaination and great easter eggs that most users probably missed.", 2),
    (5, "Jeff B", "Looking forward to many of these movies in 2019, but they missed a few.", 3),
    (5, "Angela M", "I think the list is spot on.", 4)
;
select * from videos;


INSERT INTO videoreviews(VideoID, Name, Review, Rating)
VALUES
	(1, "David A", "Horrible video.", 0),
    (5, "David A", "This video sucked.", NULL)
    ;

## Join for all reviews
select v.Title, vr.Name, vr.Review, vr.Rating 
from videos as v
inner join VideoReviews as vr
on vr.VideoID = v.VideoID;

## Join for all reviews greater than 3
select v.Title, vr.Name, vr.Review, vr.Rating 
from videos as v
inner join VideoReviews as vr
on vr.VideoID = v.VideoID
where vr.Rating > 3;

## Join both tables and show all videos regardless of whether a review exists
select v.Title, vr.Name, vr.Review, vr.Rating 
from videos as v
left join VideoReviews as vr
on vr.VideoID = v.VideoID;

## Join both tables and show videos that do not have any reviews
select v.Title, vr.Name, vr.Review, vr.Rating 
from videos as v
left join VideoReviews as vr
on vr.VideoID = v.VideoID
where vr.Review IS NULL;





select * from videoreviews;
select * from videos;
