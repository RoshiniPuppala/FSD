/*creating and insserting data into  Movies table*/
CREATE TABLE Movies(movieId int(10) PRIMARY KEY, title varchar(20), release_year varchar(20), director_Id int(10));
INSERT INTO Movies VALUES (101, "Bahubali1", '2015', 1101),(102, "Mirchi", '2013', 1102),(103, "Rebel", '2012', 1103),(104, "Billa", '2009', 1104);

/*creating and insserting data into Directors table*/
CREATE TABLE Directors (director_Id int(10) PRIMARY KEY, director_name varchar(20));
INSERT INTO Directors VALUES (1101, "Rajamouli"),(1102, "Koratala Shiva"),(1103, "Raghava Lawrence"),(1105, "Mehar Ramesh");

/*creating and insserting data into Genres table*/
CREATE TABLE Genres (genre_Id int(10) PRIMARY KEY, genre_name varchar(20));
INSERT INTO Genres VALUES (191,"Drama"),(192, "Rom-Com"),(193, "Action"),(194, "Triller");

/*creating and insserting data into Movie_Genres*/
CREATE TABLE Movie_Genres (movie_Id int(10) PRIMARY KEY, genre_Id int(10));
INSERT INTO mMovie_Genres VALUES (101, 191),(102, 192);,(103, 1993);


/*Write a query to retrieve the movie title and the corresponding director name for all movies.*/
SELECT m.title, d.director_name FROM Movies m, Directors d where m.director_Id = d.director_Id;

/*Write a query to retrieve the movie title, release year, and the corresponding director name (if available) for all movies.*/
SELECT m.title, m.release_year, d.director_name FROM Movies m left join Directors d on m.director_Id = d.director_Id;

/*Write a query to retrieve the director name and the titles of the movies they have directed (if available) for all directors.*/
SELECT  d.director_name, m.title FROM Directors d left join Movies m on m.director_Id = d.director_Id;

/*Write a query to retrieve the movie title, release year, and the corresponding director name (if available) for all movies and directors.*/
SELECT m.title, m.release_year, d.director_name FROM Movies m left join Directors d on m.director_Id = d.director_Id
UNION
SELECT m.title, m.release_year, d.director_name from Movies m right join Directors d on m.director_Id = d.director_Id;

/*Write a query to retrieve the movie title and genre name for all combinations of movies and genres.*/
SELECT m.title, g.genre_name FROM Movies m join Movie_Genres mg on m.movieId = mg.movie_Id join Genres g 
on mg.genre_Id = g.genre_Id;
