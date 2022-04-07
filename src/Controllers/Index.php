<?php
/**
 * PHP Version 7.2
 *
 * @category Public
 * @package  Controllers
 * @author   Grupo4
 * @license  MIT http://
 * @version  CVS:1.0.0
 * @link     http://
 */
namespace Controllers;

/**
 * Index Controller
 *
 * @category Public
 * @package  Controllers
 * @author   Grupo4
 * @license  MIT http://
 * @link     http://
 */
class Index extends PublicController
{
    /**
     * Index run method
     *
     * @return void
     */
    public function run() :void
    {
        $viewData = array();
        $viewData["documentofiscal"] = \Dao\Historial\Historial::obtenerHistorial();
        \Views\Renderer::render("index", $viewData);
    }
}

?>
