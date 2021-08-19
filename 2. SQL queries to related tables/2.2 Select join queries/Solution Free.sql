SELECT title, name_author, name_genre
  FROM book INNER JOIN author USING(author_id)
            INNER JOIN genre  USING(genre_id)