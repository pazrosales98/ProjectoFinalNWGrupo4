<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
use Dao\Dao;

class Checkout extends PublicController{
    public function run():void
    {
        $viewData = array();
        $userId = ""; //Aqui iraa el username del usuario logueado actualmente
        $carritoId = "1"; //Aqui ira el carrito seleccionado actualmente

        if($userId == "" or is_null($userId)){
            $viewData["items"] = \Dao\Inv\Invoice::obtenerCarretillaAnon($carritoId);
        }
        else
        {
            $viewData["items"] = \Dao\Inv\Invoice::obtenerCarretillaUsuario($userId);
        }
        
        if ($this->isPostBack()) {
            $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                "test".(time() - 10000000),
                "http://localhost/mvcafe12/index.php?page=checkout_error",
                "http://localhost/mvcafe12/index.php?page=checkout_accept"
            );
            foreach($viewData["items"] as $item){
                $PayPalOrder->addItem($item["invPrdDsc"], $item["invPrdCodInt"], $item["invPrdBrCod"], floatval($item["cartPrc"]), 
                    intval($item["cartTax"]), intval($item["cartCtd"]), "PHYSICAL_GOODS" );
            }
            // $PayPalOrder->addItem("Test", "TestItem1", "PRD1", 100, 15, 1, "DIGITAL_GOODS");
            $response = $PayPalOrder->createOrder();
            $_SESSION["orderid"] = $response[1]->result->id;
            \Utilities\Site::redirectTo($response[0]->href);
            die();
        }

        \Views\Renderer::render("paypal/checkout", $viewData);
    }
}
?>
