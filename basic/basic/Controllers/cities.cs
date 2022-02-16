using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace basic.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class cities : ControllerBase
    {
        
       private string[] cities= new string[] { "antalya", "istanbul", "izmir" };
    //domainadresi/api/cities

    public string[] Get()
        {
        return cities;
        }

        public string Get(int id)
        {
        return cities[id];
        }
    }
}
