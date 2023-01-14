using DataAccess.DbAccess;
using DataAccess.Models;

namespace DataAccess.Data;

public class UserData : IUserData
{
    readonly ISqlAccess _dbAccess;

    public UserData(ISqlAccess dbAccess)
    {
        _dbAccess = dbAccess;
    }
    public async Task<IEnumerable<User>> GetUser(int? id, string? email)
    {
        return await _dbAccess.LoadData<User, dynamic>("[dbo].[sp_getuser]", id != null ? new { id } : new { email });
    }
    public async Task InsertUser(string name, string email, string password)
    {
        await _dbAccess.SaveData("[dbo].[sp_insertuser]", new { name, email, password });
    }
    public async Task UpdateUser(int id, string name, string email, string password)
    {
        await _dbAccess.SaveData("[dbo].[sp_updateuser]", new { id, name, email, password });
    }
}
