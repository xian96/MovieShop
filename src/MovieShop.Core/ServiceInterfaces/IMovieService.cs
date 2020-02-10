﻿using System.Collections.Generic;
using System.Threading.Tasks;
using MovieShop.Core.ApiModels.Response;
using MovieShop.Core.Entities;
using MovieShop.Core.Helpers;

namespace MovieShop.Core.ServiceInterfaces
{
    public interface IMovieService
    {
        Task<PagedResultSet<MovieResponseModel>> GetMoviesByPagination(int pageSize = 20, int page = 0, string title = "");
        Task<MovieDetailsResponseModel> GetMovieAsync(int id);
        Task<int> GetMoviesCount(string title = "");
        Task<IEnumerable<MovieResponseModel>> GetTopRatedMovies();
        Task<IEnumerable<MovieResponseModel>> GetHighestGrossingMovies();
        Task<IEnumerable<MovieResponseModel>> GetMoviesByGenre(int genreId);
    }
}