using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using DataAccess;
using DataAccess.Data;
using Microsoft.AspNetCore.Identity;
using DataAccess.Models;

namespace FakeStoreApi.Controllers;

[Route("api/[controller]")]
[ApiController]
public class UserController : ControllerBase
{
    private readonly IPasswordHasher<LoginCredentials> _hasher = new PasswordHasher<LoginCredentials>();
    [HttpPost("/login")]
    public async Task<IResult> GetUser([FromBody] LoginCredentials credentials, [FromServices] IUserData data)
    {
        if (credentials.Email != null)
        {
            var user = await data.LoginUser(credentials.Email);

            PasswordVerificationResult result = _hasher.VerifyHashedPassword(credentials, user.First().Password, credentials.Password);
            if (result == PasswordVerificationResult.Success)
            {
                return Results.Ok(user);
            }
            else
            {
                return Results.Unauthorized();
            }
        }
        else
        {
            return Results.BadRequest();
        }

    }
    [HttpPost("/register")]
    public async Task<IResult> CreateUser([FromBody] RegisterUser newUser, [FromServices] IUserData data)
    {
        if (newUser.Name is not null && newUser.Email is not null && newUser.Password is not null)
        {
            LoginCredentials credentials = new() { Email = newUser.Email, Password = newUser.Password };
            string passwordHash = _hasher.HashPassword(credentials, newUser.Password);
            await data.InsertUser(newUser.Name, newUser.Email, passwordHash);
            return Results.Ok();
        }
        else
        {
            return Results.BadRequest();
        }
    }
    [HttpPut("/update")]
    public async Task<IResult> UpdateUser([FromBody] UpdateUser upUser, [FromServices] IUserData data)
    {
        if (upUser.Email is not null && upUser.Password is not null && upUser.NewPassword is not null && upUser.Name is not null)
        {
            LoginCredentials loginCredentials = new() { Email = upUser.Email, Password = upUser.Password };
            var userData = await data.GetUser(upUser.Id);

            PasswordVerificationResult checkPassword = _hasher.VerifyHashedPassword(loginCredentials, userData.First().Password, upUser.Password);
            if (checkPassword == PasswordVerificationResult.Failed)
            {
                return Results.BadRequest();
            }
            string newPasswordHash = _hasher.HashPassword(loginCredentials, upUser.NewPassword);
            await data.UpdateUser(upUser.Id, upUser.Name, upUser.Email, newPasswordHash);
            return Results.Ok();
        } else
        {
            return Results.BadRequest();
        }
    }
}
public class UpdateUser : User
{
    public string? NewPassword { get; set; }
}
public class RegisterUser
{
    public string? Name { get; set; }
    public string? Email { get; set; }
    public string? Password { get; set; }
}
public class LoginCredentials
{
    public string? Email { get; set; }
    public string? Password { get; set; }
}
