using DataAccess.Models;

namespace DataAccess.Data
{
    public interface IUserData
    {
        Task<IEnumerable<User>> GetUser(int id);
        Task InsertUser(string name, string email, string password);
        Task<IEnumerable<User>> LoginUser(string email);
        Task UpdateUser(int id, string name, string email, string password);
    }
}