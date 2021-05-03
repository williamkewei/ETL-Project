-- Drop tables if exists
DROP TABLE IF EXISTS netflix_movie_database;

-- Create One table
CREATE TABLE netflix_movie_database (
	id INTEGER PRIMARY KEY,
	title TEXT,
	director TEXT,
	film_cast TEXT,
	country TEXT,
	release_year INTEGER,
	added_year INTEGER,
	film_ratings TEXT,
	duration TEXT,
	genres TEXT,
	description TEXT,
	imdb_rating INTEGER,
	tomatoes_rating TEXT
);

SELECT * FROM netflix_movie_database;
