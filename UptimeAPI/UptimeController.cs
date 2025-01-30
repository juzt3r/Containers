using Microsoft.AspNetCore.Mvc;
using System;

namespace UptimeAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UptimeController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            var uptime = Environment.TickCount;
            return Ok(new { uptime });
        }
    }
}
