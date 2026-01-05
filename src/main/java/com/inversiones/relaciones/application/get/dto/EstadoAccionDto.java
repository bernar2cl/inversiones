package com.inversiones.relaciones.application.get.dto;

import java.math.BigDecimal;
import java.time.LocalDate;

public record EstadoAccionDto(
        Integer accionId,
        String nombre,
        String tiker,
        String pais,
        String industria,
        LocalDate fechaRegistro,
        String periodoReportado,
        BigDecimal marketCap,
        BigDecimal precioAccion,
        BigDecimal cantidadAcciones,
        BigDecimal utilidadMesActual,
        BigDecimal utilidadFinalAnterior,
        BigDecimal utilidadMesAnterior,
        BigDecimal patrimonioMesActual,
        BigDecimal utilidadMovil,
        BigDecimal utilidad12mMovil,
        BigDecimal precioUtilidad,
        BigDecimal valorBolsaLibro,
        BigDecimal utilidadPrecio,
        BigDecimal valorLibroAjustado,
        BigDecimal valorBajo,
        BigDecimal valorNormal,
        BigDecimal valorAlto,
        String estado,
        Integer icono
) {
}
