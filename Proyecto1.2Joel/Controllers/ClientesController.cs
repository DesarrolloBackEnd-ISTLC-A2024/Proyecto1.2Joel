using Microsoft.AspNetCore.Mvc;
using Proyecto1._2Joel.Comunes;
using Proyecto1._2Joel.Model;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Proyecto1._2Joel.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClientesController : ControllerBase
    {
        // GET: api/<ClientesController>
        [HttpGet]
        public List<Cliente> Get()
        {
            return ConexionBD.GetClientes();
        }

        //// GET api/<ClientesController>/5
        //[HttpGet("{cedula}")]
        //public Cliente Get(string cedula)
        //{
        //    return ConexionBD.GetCliente(cedula);
        //}

        [HttpGet("{cedulaHistorial}")]
        public List<HistorialVisita> GetHistorialVisitas(string cedulaHistorial)
        {
            return ConexionBD.GetHistorialVisita(cedulaHistorial);
        }


        // POST api/<ClientesController>
        [HttpPost]
        public void Post([FromBody] Cliente objCliente)
        {
            ConexionBD.PostCliente(objCliente);
        }

        // PUT api/<ClientesController>/5
        [HttpPut("{cedula}")]
        public void Put(string cedula, [FromBody] Cliente objCliente)
        {

            ConexionBD.PutCliente(cedula, objCliente);
        }

        // DELETE api/<ClientesController>/5
        [HttpDelete("{cedula}")]
        public void Delete(string cedula)
        {

        }
    }
}
