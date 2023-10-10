
namespace server.Models;

public class House
{
    public int Id { get; set; }
    public int Year { get; set; }
    public string Color { get; set; }
    public int Bedrooms { get; set; }
    public int Bathrooms { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public int? Price { get; set; }
    public bool isNew { get; set; }
    public string Description { get; set; }
    public string ImgUrl { get; set; }

}