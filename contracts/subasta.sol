/*
Implementar un Smart Contract para una subasta básica con las siguientes características:

i.  Se subasta un único artículo ficticio.

ii.  El smart contract debe incluir las funciones de:

a) inicio de la subasta (se deben crear tres variables de estado: valor inicial de la subasta, fecha de inicio y tiempo de duración).

b) ofertar (los montos ofertados por los participantes pueden ser ficticios, o reales usando msg.value, y 
en caso de ser mayor a la oferta más grande, actualizar en la variable de estado mayorOferta, y 
actualizar la variable de estado ofertanteGanador = msg.sender)

c) finalizar la subasta (en este primer caso solo se contempla evitar que se siga ofertando vía código con una variable de estado tipo bandera, se hace manualmente por el creador del contrato)

d) Mostrar el ofertante ganador y el valor de la oferta

iii.  Extra ¿en caso que dos ofertas sean del mismo monto, que criterio de desempate se aplica?
*/

// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract Subasta {
    // Variables de estado: valorInicial de la subasta, fechaInicio y tiempoDuracion.
    // Variable de estado mayorOferta, y actualizar la variable de estado ofertanteGanador = msg.sender
    uint256 private valorInicial;
    uint256 private fechaInicio;
    uint256 private tiempoDuracion;
    uint256 private mayorOferta;
    address private ofertanteGanador;

    ///// FUNCIONES DE TIPO GETTER /////////////////////////////////////

    // Mostrar el ofertante ganador.
    function getOfertanteGanador() external view returns (address) {
        return ofertanteGanador;
    }

    // Mostrar la mayor oferta.
    function getMayorOferta() external view returns (uint256) {
        return mayorOferta;
    }

    ///// FUNCIONES DE TIPO SETTER /////////////////////////////////////

    // payable: Para que la gente pueda enviar dinero.
    function setOferta() external payable {
        // Tomo el dinero que me envian
        uint256 _valorOfertado = msg.value;
        if (_valorOfertado > mayorOferta) {
            address _addrOferente = msg.sender;
            ofertanteGanador = _addrOferente;
            mayorOferta = _valorOfertado;
        }
    }
}
