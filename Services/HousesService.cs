using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Threading.Tasks;
using server.Models;
using server.Repositories;

namespace server.Services;

public class HousesService
{
    private readonly HousesRepository _repository;
    public HousesService(HousesRepository repository)
    {
        _repository = repository;
    }


    internal List<House> GetAllHouses()
    {
        List<House> houses = _repository.GetAllHouses();
        return houses;
    }



    internal House GetHouseById(int houseId)
    {
        House house = _repository.GetHouseById(houseId);
        if (house == null) throw new Exception($"no house with id: {houseId}");
        return house;
    }


    internal House CreateHouse(House houseData)
    {
        House house = _repository.CreateHouse(houseData);
        return house;
    }



    internal House UpdateHouse(House udpateData)
    {
        House original = this.GetHouseById(udpateData.Id);
        // THIS IS where WOULD check for ownership next
        original.Year = udpateData.Year != 0 ? udpateData.Year : original.Year;
        original.Color = udpateData.Color != null ? udpateData.Color : original.Color;
        original.Bedrooms = udpateData.Bedrooms != 0 ? udpateData.Year : original.Year;
        original.Bathrooms = udpateData.Bathrooms != 0 ? udpateData.Year : original.Year;
        original.Color = udpateData.City != null ? udpateData.City : original.City;
        original.Color = udpateData.State != null ? udpateData.State : original.State;
        original.Price = udpateData.Price != null ? udpateData.Price : original.Price;
        // NOTE Does this work? Test
        original.isNew = udpateData.isNew != original.isNew;

        original.Description = udpateData.Description ?? original.Description;
        original.ImgUrl = udpateData.ImgUrl ?? original.ImgUrl;

        House house = _repository.UpdateHouse(original);
        return house;
    }


    internal string RemoveHouse(int houseId)
    {
        House house = this.GetHouseById(houseId);
        // THIS IS where WOULD check for ownership next
        _repository.RemoveHouse(houseId);
        return $"House with id: {house.Id}, Year:{house.Year} at {house.City}{house.State} was removed from the database.";

    }

}