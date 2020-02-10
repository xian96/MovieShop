SELECT r.MovieId, m.Title,m.PosterUrl, AVG(r.Rating) AS Rating
			FROM Movie m
				left JOIN Review r ON m.Id = r.MovieId
			GROUP BY r.MovieId, m.Title, m.PosterUrl
		order by AVG(r.Rating) desc


-- EF 3 Generated SQL

SELECT TOP(25) [r].[MovieId] AS [Id], [m].[PosterUrl], [m].[Title], [m].[BackdropUrl], AVG([r].[Rating]) AS [Rating]
      FROM [Review] AS [r]
      INNER JOIN [Movie] AS [m] ON [r].[MovieId] = [m].[Id]
      GROUP BY [r].[MovieId], [m].[PosterUrl], [m].[Title], [m].[BackdropUrl]
      ORDER BY AVG([r].[Rating]) DESC


	SELECT TOP(25) [r].[MovieId] AS [Id], AVG([r].[Rating]) AS [Rating]
      FROM [Review] AS [r]
      GROUP BY [r].[MovieId]
      ORDER BY AVG([r].[Rating]) DESC

		SELECT r.MovieId,
	       AVG(r.Rating)
			FROM [Review] r
			GROUP BY r.MovieId
			ORDER BY AVG(r.Rating) DESC offset 0 rows
		FETCH NEXT 10 rows ONLY;


SELECT  u.Id  
	, u.FirstName
	, CAST(rr.averagerating as decimal(4,2))
      --ROUND( rr.averagerating, 2)
	, rr.reviewcount
			FROM [User] u
				JOIN (
	SELECT r.UserId
		, COUNT(r.UserId) AS reviewcount
		, AVG(r.Rating) AS averagerating
				FROM Review r
				GROUP BY r.UserId
	) AS RR ON u.Id = rr.UserId
			ORDER BY rr.averagerating desc

select  u.Id  
	, u.FirstName 
	, count(r.UserId) as MoviesReviewed
	, AVG(r.Rating) AverageRating
	 FROM [User] u left join Review r
	on u.Id = r.UserId
	group by u.Id, u.FirstName
	order by AverageRating desc


	-- EF 3 Favorite Exixts
	   SELECT CASE
          WHEN EXISTS (
              SELECT 1
              FROM [Favorite] AS [f]
              WHERE ([f].[MovieId] = 14) AND ([f].[UserId] = 1)) THEN CAST(1 AS bit)
          ELSE CAST(0 AS bit)
      END

	  -- Get Purchases by User
	  SELECT [p].[Id], [p].[MovieId], [p].[PurchaseDateTime], [p].[PurchaseNumber], [p].[TotalPrice], [p].[UserId], [m].[Id], [m].[BackdropUrl], [m].[Budget], [m].[CreatedBy], [m].[CreatedDate], [m].[ImdbUrl], [m].[OriginalLanguage], [m].[Overview], [m].[PosterUrl], [m].[Price], [m].[ReleaseDate], [m].[Revenue], [m].[RunTime], [m].[Tagline], [m].[Title], [m].[TmdbUrl], [m].[UpdatedBy], [m].[UpdatedDate]
      FROM [Purchase] AS [p]
      INNER JOIN [Movie] AS [m] ON [p].[MovieId] = [m].[Id]
      WHERE [p].[UserId] = 1

-- Get Reviews by user by EF

SELECT [r].[MovieId], [r].[UserId], [r].[Rating], [r].[ReviewText], [m].[Id], [m].[BackdropUrl], [m].[Budget], [m].[CreatedBy], [m].[CreatedDate], [m].[ImdbUrl], [m].[OriginalLanguage], [m].[Overview], [m].[PosterUrl], [m].[Price], [m].[ReleaseDate], [m].[Revenue], [m].[RunTime], [m].[Tagline], [m].[Title], [m].[TmdbUrl], [m].[UpdatedBy], [m].[UpdatedDate]
      FROM [Review] AS [r]
      INNER JOIN [Movie] AS [m] ON [r].[MovieId] = [m].[Id]
      WHERE [r].[UserId] = 1