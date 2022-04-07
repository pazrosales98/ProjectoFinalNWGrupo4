<?php
namespace Dao\Historial;

use Dao\Table;


class Historial extends Table{

    public static function obtenerHistorial()
    {
       
       $sqlstr = "select fecha , usuarioemail , 
                direccion , total from documentofiscal 
                ;";
        return self::obtenerRegistros($sqlstr, []);
    }
}

?>