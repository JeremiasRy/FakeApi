using DataAccess.Models;

namespace DataAccess.Data
{
    public interface IUserData
    {
        Task<IEnumerable<User>> GetUser(int? id, string? email);
        Task InsertUser(string name, string email, string password);
        Task UpdateUser(int id, string name, string email, string password);
    }
}