package com.inversiones.relaciones.web.dto;

import java.math.BigDecimal;

public record RelacionesMercadoRequestDTO(BigDecimal precioAccion,
                                          BigDecimal cantidadAcciones,
                                          BigDecimal utilidadMesActual,
                                          BigDecimal utilidadFinalAnterior,
                                          BigDecimal utilidadMesAnterior,
                                          BigDecimal patrimonioMesActual,
                                          String periodoReportado) {

}
