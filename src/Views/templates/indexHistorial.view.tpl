

<h1>Historial de transaccion</h1>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<br>
<table class="table table-dark table-striped">
  <thead>
    <tr>
      <th>Fecha</th>
      <th>Nombre</th>
      <th>Direccion</th>
      <th>Total</th>
    </tr>
  </thead>
  <tbody>
          {{foreach documentofiscal}}
          <tr>
            <td scope="row">{{fecha}}</td>
            <td scope="row">{{usuarioemail}}</td>
            <td scope="row">{{direccion}}</td>
            <td scope="row">{{total}}</td>
          </tr>
           {{endfor documentofiscal}}
        </tbody>
</table>