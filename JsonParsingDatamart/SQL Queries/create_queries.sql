CREATE TABLE `stg_movie_dtl` (
  `Movie_dtl_id` int NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Year` year DEFAULT NULL,
  `Runtime` int DEFAULT NULL,
  `Release_date` date DEFAULT NULL,
  `Storyline` varchar(4000) DEFAULT NULL,
  `Category` varchar(1000) DEFAULT NULL,
  `Director` varchar(100) DEFAULT NULL,
  `Writer` varchar(2000) DEFAULT NULL,
  `Actor` varchar(2000) DEFAULT NULL,
  `Process_id` varchar(20) NOT NULL,
  `Date_created` datetime NOT NULL,
  PRIMARY KEY (`Movie_dtl_id`)
)
;


CREATE TABLE `stg_director` (
`director_id` int auto_increment primary key,
  `Movie_dtl_id` int NOT NULL,
  `Directors` varchar(2000) DEFAULT NULL,
  `Process_id` varchar(20) NOT NULL,
  `Created_Date` datetime NOT NULL
);

CREATE TABLE `stg_writer` (
`Writer_id` int auto_increment primary key,
  `Movie_dtl_id` int NOT NULL,
  `Writers` varchar(2000) DEFAULT NULL,
  `Process_id` varchar(20) NOT NULL,
  `Created_Date` datetime NOT NULL
);

CREATE TABLE `stg_actor` (
`Actor_id` int auto_increment primary key,
  `Movie_dtl_id` int NOT NULL,
  `Actors` varchar(2000) DEFAULT NULL,
  `Process_id` varchar(20) DEFAULT NULL,
  `Created_date` datetime NOT NULL
) ;

CREATE TABLE `stg_category` (
`category_id` int auto_increment primary key,
  `Movie_dtl_id` int NOT NULL,
  `Categories` varchar(1000) DEFAULT NULL,
  `Process_id` varchar(20) DEFAULT NULL,
  `Created_Date` datetime NOT NULL
) ;

CREATE TABLE `dim_movie_scd` (
	`MovieSK` int NOT NULL,
  `MovieNK` int NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `release_version` int NOT NULL,
  `Year` year DEFAULT NULL,
  `Runtime` int DEFAULT NULL,
  `Release_date` date DEFAULT NULL,
  `Storyline` varchar(4000) DEFAULT NULL,
  `Process_id` varchar(20) NOT NULL,
  `Date_created` datetime NOT NULL,
  `scd_start` datetime NOT NULL,
  `scd_end` datetime DEFAULT NULL,
  PRIMARY KEY (`MovieSK`)
) ;


CREATE TABLE `fct_movie` (
	`MovieSK` int NOT NULL,
    no_of_actors int,
    no_of_directors int,
    no_of_writers int,
  `Process_id` varchar(20) NOT NULL,
  `Date_created` datetime NOT NULL,
  PRIMARY KEY (`MovieSK`)
);
ALTER TABLE fct_movie
ADD FOREIGN KEY (MovieSK) REFERENCES dim_movie_scd(MovieSK);

CREATE TABLE `dim_actors` (
  `ActorSK` int NOT NULL auto_increment,
  `name` varchar(200) DEFAULT NULL,
  `birthname` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `birthplace` varchar(100) DEFAULT NULL,
  `Process_id` varchar(20) NOT NULL,
  `Created_date` datetime NOT NULL,
  PRIMARY KEY (`ActorSK`)
) ;

CREATE TABLE `movie_actor_bridge` (
	`MovActBridgeSK` int NOT NULL,
	`MovieSK` int NOT NULL,
    ActorSK  int NOT NULL,
  `Process_id` varchar(20) NOT NULL,
  `Date_created` datetime NOT NULL,
  PRIMARY KEY (`MovActBridgeSK`)
);

ALTER TABLE movie_actor_bridge
ADD FOREIGN KEY (MovieSK) REFERENCES fct_movie(MovieSK);

ALTER TABLE movie_actor_bridge
ADD FOREIGN KEY (ActorSK) REFERENCES dim_actors(ActorSK);

CREATE TABLE `dim_directors` (
  `DirectorSK` int NOT NULL auto_increment,
  `name` varchar(200) DEFAULT NULL,
  `birthname` varchar(50) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `birthplace` varchar(100) DEFAULT NULL,
  `Process_id` varchar(20) NOT NULL,
  `Created_date` datetime NOT NULL,
  PRIMARY KEY (`DirectorSK`)
) ;

CREATE TABLE `movie_director_bridge` (
	`MovDirBridgeSK` int NOT NULL,
	`MovieSK` int NOT NULL,
    DirectorSK  int NOT NULL,
  `Process_id` varchar(20) NOT NULL,
  `Date_created` datetime NOT NULL,
  PRIMARY KEY (`MovDirBridgeSK`)
);

ALTER TABLE movie_director_bridge
ADD FOREIGN KEY (MovieSK) REFERENCES fct_movie(MovieSK);

ALTER TABLE movie_director_bridge
ADD FOREIGN KEY (DirectorSK) REFERENCES dim_directors(DirectorSK);

CREATE TABLE `dim_writer` (
  `writerSK` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `Process_id` varchar(20) NOT NULL,
  `Created_date` datetime NOT NULL,
  PRIMARY KEY (`writerSK`)
) ;

CREATE TABLE `movie_writer_bridge` (
	`MovWriBridgeSK` int NOT NULL,
	`MovieSK` int NOT NULL,
    WriterSK  int NOT NULL,
  `Process_id` varchar(20) NOT NULL,
  `Date_created` datetime NOT NULL,
  PRIMARY KEY (`MovWriBridgeSK`)
);

ALTER TABLE movie_writer_bridge
ADD FOREIGN KEY (MovieSK) REFERENCES fct_movie(MovieSK);

ALTER TABLE movie_writer_bridge
ADD FOREIGN KEY (WriterSK) REFERENCES dim_writer(WriterSK);


CREATE TABLE `dim_category` (
  `CategorySK` int NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `Process_id` varchar(20) NOT NULL,
  `Created_date` datetime NOT NULL,
  PRIMARY KEY (`CategorySK`)
);
CREATE TABLE `movie_category_bridge` (
	`MovCatBridgeSK` int NOT NULL,
	`MovieSK` int NOT NULL,
    CategorySK  int NOT NULL,
  `Process_id` varchar(20) NOT NULL,
  `Date_created` datetime NOT NULL,
  PRIMARY KEY (`MovCatBridgeSK`)
);

ALTER TABLE movie_category_bridge
ADD FOREIGN KEY (MovieSK) REFERENCES fct_movie(MovieSK);

ALTER TABLE movie_category_bridge
ADD FOREIGN KEY (CategorySK) REFERENCES dim_category(CategorySK);