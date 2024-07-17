using Microsoft.AspNetCore.Mvc;
using Proyecto1._2Joel.Comunes;
using Proyecto1._2Joel.Model;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Proyecto1._2Joel.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductosController : ControllerBase
    {
        [HttpGet]
        public List<Producto> Get()
        {
            return ConexionBD.GetProductos();
        }


        [HttpGet("{codigo}")]
        public Producto Get(string codigo)
        {
            return ConexionBD.GetProducto(codigo);
        }

        // POST api/<ClientesController>
        [HttpPost]
        public void Post([FromBody] Producto objProducto)
        {
            ConexionBD.PostProducto(objProducto);
        }


        [HttpPut("{codigo}")]
        public void Put(string codigo, [FromBody] Producto objProducto)
        {
            ConexionBD.PutProducto(codigo, objProducto);
        }


        // DELETE api/<ProductosController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }


        [HttpGet("{codigo_producto}/{cedula}")]
        public decimal GetPrecioPromocion(string codigo_producto, string cedula)
        {
            Producto objProducto = new Producto();
            objProducto = ConexionBD.GetProducto(codigo_producto);
            decimal descuento_producto = ConexionBD.GetPromocionProducto(objProducto.id_producto);
            decimal descuento_cliente = ConexionBD.GetPromocionCliente(cedula);

            decimal total_porcentaje_descuento = descuento_producto + descuento_cliente;
            decimal descuento_total = 0;
            if (total_porcentaje_descuento <= 100)
            {
                descuento_total = objProducto.precio * total_porcentaje_descuento / 100;
            }
            else
            {
                descuento_total = objProducto.precio;
            }

            return objProducto.precio - descuento_total;

        }

    }
}
