<?php
namespace Dao\Inv;

use Dao\Table;

class Invoice extends Table{

    public static function obtenerCarretillaUsuario($userid)
    {

        $sqlstr = "select 
        prod.invPrdDsc, 
        prod.invPrdCodInt, 
        prod.invPrdBrCod,
        ca.cartPrc, 
        0 as cartTax, 
        ca.cartCtd, 
        prod.invPrdTip,
        (ca.cartPrc * ca.cartCtd) as total 
        from carretilla_auth ca
        inner join productos prod
            on prod.invPrdId = ca.invPrdId
        where ca.usercod = $userid
            ;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function obtenerCarretillaAnon($carretillaid = "1")
    {
        $sqlstr = "select 
        prod.invPrdDsc, 
        prod.invPrdCodInt, 
        prod.invPrdBrCod,
        ca.cartPrc, 
        0 as cartTax, 
        ca.cartCtd, 
        prod.invPrdTip,
        (ca.cartPrc * ca.cartCtd) as total 
        from carretilla_anon ca
        inner join productos prod
            on prod.invPrdId = ca.invPrdId
        where ca. anoncartid = $carretillaid
            ;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function crearFactura($result)
    {


        $facturapaypal = $result->result->id;

        $usuarioemail = $result->result->payer->email_address;


        $direccion = $result->result->payer->address->country_code;
        $total = $result->result->purchase_units[0]->payments->captures[0]->amount->value;
        //$fecha = $result->result->purchase_units[0]->payments->captures[0]->create_time;
        $fecha = date('Y-m-d h:i:s', time());
        $sqlstr = "insert into documentofiscal (facturapaypalid, usuarioemail, direccion, total, fecha)
        values('$facturapaypal', '$usuarioemail', '$direccion', $total, '$fecha');
                ";

        return self::obtenerRegistros($sqlstr, []);
    }
}

?>