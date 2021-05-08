# ETL-Project

## Extraction:

### What are our datasources:

* After some research, our group decided to gather data on Netflix's movie and tv show ratings. To complete this project we've collected data from 3 data sources.

1.  We collected our first data through Kaggle, we found a CSV file (https://www.kaggle.com/shivamb/netflix-shows) containing data of tv shows and movies from the Netflix database. The CSV file was then read into Pandas and converted into a dataframe ("netflix_df").
2.  Then, we also found a JSON file on Kaggle, containing data from IMDB (https://www.kaggle.com/gorochu/complete-imdb-movies-dataset).  The file was read into Pandas as a JSON file and then converted into a pandas dataframe. We've also exported the dataframe as a CSV file for future reference.
3.  Lastly, we scrapped the Rotten Tomatoes website (https://www.rottentomatoes.com/browse/dvd-streaming-all) for data containing the title of movies and tv shows and their ratings.  We employed the use of BeautifulSoup and splinter to append the data into lists.  The data was then converted into a pandas dataframe and saved as a CSV file for future reference.

### Problems Encountered:

* Our group initially wanted to gather data in regards to mobile games from both the Google Playstore and the Apple Appstore.  We decided that we wanted to obtain the data from Kaggle and by scrapping both the Google Playstore and Apple Appstore websites.

* We soon realised that our knowledge of web scrapping was not sufficient to handle the complex scrapping methods required for the Appstore.  Similarly, the JSON file from the PlayStore data was so big that it kept crashing our Jupyter Notebooks.  We quickly decided to cut our losses and find a topic that was more realistic for our skillset level.

* Initially we planned to web scrap from the IMDB website to extract the movie ratings, however, we noticed the IMDB website page only contain 250 movies and it doesn't have the next page option. We successfully web scrapped 250 movies' data from the website, but we decided the data is not enough to build our database. So, we used a JSON file that we found to import the IMDB data.

* During the scrapping process of the Rotten Tomatoes website, we formulated a code that would gather the data from the website.  However, the website had more than 18500 separate pieces of data.  The process took over 2 and a half hours and the Rotten Tomatoes website kicked us out after we had gathered data for 9500 titles.

* Additionally, the web scrapping of the Rotten Tomatoes website was a little different to what we had learned in class.  Instead of having a ‘Next Page’ button, the website employed the use of a ‘show more’ button. The show more button added more titles but did not change the page of the website.  Therefore we researched and found (‘browser.find_by_text('Show More').click()’) function.  
    * (These are the reasons we've exported our JSON and web scrapping outputs as CSV to help us with data cleaning and later process.)

## Transformation:
* What data cleaning or transformation was required.

* First, we transformed all our data into pandas DataFrames (CSV, JSON & webs crapped data), this included read the data and create DataFrames.

* After converting the data files, we cleaned each of the DataFrame by:
    1. Checking null values & drop n/a
        * (For the netflix_df we deleted any rows that contain N/A values in column 'date_added' or 'rating'. For our final data we would like to have the date this movie was added to Netflix and the film_rating )
    2. Filter the netflix_df to 'Movies' only. We decided to filter the Netflix data by movies, as 80% of the data related to movies.
    3. In the netflix_df we've also extracted 'year' from the data_added column (originally it's XXXX-XX-XX). The reason for this step is in netflix_df we also have another variable within the data 'released_year' which only contain the year (XXXX) the movie was released. To ensure the data is consistent across the two dates variables (date_added & released_year). We convert all date_added to reflect only the year.
    4. Dropping columns that were of no use
    5. Then we merge the 3 Dataframes through inner joins on the 'title' column to create a merged nf_t_imdb DataFrame
    6. Converting object variable to float
    7. Renaming columns to clearly label the columns

## Loading:

* We created a table on PostgreSQL and then connected the database from Pandas into PostgresSQL.  
* The reason we chose to push the data into PostgreSQL was that the I, Netflix, MDB, Rotten tomatoes data were relational data.  The data was relational as they share similar columns such as movie title, year and ratings. 

### What we can do with this data:
* There are multiple analysis could be done with this data.
    * With this data, we can find information on movies on Netflix and we'll be able to compare the rating scores of individual movies from IMDB and Rotten Tomatoes.
    * It could support analysis to look at movies in a different released year or the year it was uploaded onto Netflix discover if they have different average ratings or the amount of movies added onto Netflix has increased or decreased in the past few years.
    * Also, we could classify movies in different film_rating (e.g., R, PG-13 etc.) and discover if the ratings on IMDB or Rotten Tomatoes would be different due to film_rating. And if a particular film_rating (e.g., PG-13) is likely to have a higher rating on IMDB or Rotten Tomatoes.
