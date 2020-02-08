﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MovieShop.Core.ApiModels.Request;
using MovieShop.Core.Entities;
using MovieShop.Core.ServiceInterfaces;

namespace MovieShop.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;
        private readonly IPurchaseService _purchaseService;
        private readonly  IMovieService _movieService;

        public UserController(IPurchaseService purchaseService, IUserService userService, IMovieService movieService)
        {
            _purchaseService = purchaseService;
            _userService = userService;
            _movieService = movieService;
        }

        [HttpPost("purchase")]
        public async Task<ActionResult> CreatePurchase([FromBody] PurchaseRequestModel purchaseRequest)
        {
            //var currentUser = int.Parse(User.FindFirst(ClaimTypes.NameIdentifier).Value);
            //if (currentUser != purchaseRequest.UserId) return Unauthorized();
          
            //// Get Movie Price from Movie Table
            //var price = await _movieService.GetMovieAsync(purchaseRequest.MovieId);
            //purchaseRequest.TotalPrice = price.Price;
            await _purchaseService.PurchaseMovie(purchaseRequest);
            return Ok("Movie purchased");
        }
    }
}