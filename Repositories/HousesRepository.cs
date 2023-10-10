using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using server.Models;

namespace server.Repositories;
public class HousesRepository
{
    private readonly IDbConnection _db;
    public HousesRepository(IDbConnection db)
    {
        _db = db;
    }

    internal List<House> GetAllHouses()
    {
        string sql = "SELECT * FROM houses;";
        List<House> houses = _db.Query<House>(sql).ToList();
        return houses;
    }

    internal House GetHouseById(int houseId)
    {
        string sql = "SELECT * FROM houses WHERE id = @houseId;";
        // NOTE to avoid, SLQ injection attacks (like bobby drop tables)
        // pass a {key:value} into the Query to match and pull values from
        // example {carId: 2} matches @carId and reads as "...WHERE id = 2";
        House house = _db.Query<House>(sql, new { houseId }).FirstOrDefault();
        return house;
    }

    internal House CreateHouse(House houseData)
    {
        string sql = @"
    INSERT INTO cars
    (year, color, bedrooms, bathrooms, city, state, price, isNew, description, imgUrl)
    VALUES
     (@year, @color, @bedrooms, @bathrooms, @city, @state, @price, @isNew, @description, @imgUrl);
     SELECT * FROM houses WHERE id = LAST_INSERT_ID();";
        House house = _db.Query<House>(sql, houseData).FirstOrDefault();
        return house;
    }

    internal House UpdateHouse(House houseData)
    {
        string sql = @"
        UPDATE houses
        SET
        year = @year
        color = @color
        bedrooms = @bedrooms
        bathrooms = @bathrooms
        city = @city
        state = @state
        price = @price
        isNew = @isNew
        description = @description
        imgUrl = @imgUrl
        WHERE id = @id;
        SELECT * FROM houses WHERE id = @id;";
        House house = _db.Query<House>(sql, houseData).FirstOrDefault();
        return house;
    }
    internal void RemoveHouse(int houseId)
    {
        string sql = "DELETE FROM houses WHERE id = @houseId";
        int rowsAffected = _db.Execute(sql, new { houseId });

        // NOTE checks for paranoid people. Which most devs become after they delete something from a production environment.
        if (rowsAffected > 1) throw new Exception("Phone a Friend!");
        if (rowsAffected < 1) throw new Exception("somehow nothing was deleted! Ugh!");
    }
}
