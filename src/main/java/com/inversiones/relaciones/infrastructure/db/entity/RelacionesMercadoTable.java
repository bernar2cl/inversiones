package com.inversiones.relaciones.infrastructure.db.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "relaciones_mercado")
@Data
public class RelacionesMercadoTable {

    @Id
    @Column(name = "accion_id")
    private Integer accionId;

    @Column(name = "precio_accion")
    private BigDecimal precioAccion;

    @Column(name = "cantidad_acciones")
    private BigDecimal cantidadAcciones;

    @Column(name = "utilidad_mes_actual")
    private BigDecimal utilidadMesActual;

    @Column(name = "utilidad_final_anterior")
    private BigDecimal utilidadFinalAnterior;

    @Column(name = "utilidad_mes_anterior")
    private BigDecimal utilidadMesAnterior;

    @Column(name = "patrimonio_mes_actual")
    private BigDecimal patrimonioMesActual;

    @Column(name = "fecha_registro")
    private LocalDate fechaRegistro;

    @Column(name = "periodo_reportado")
    private String periodoReportado;
}
