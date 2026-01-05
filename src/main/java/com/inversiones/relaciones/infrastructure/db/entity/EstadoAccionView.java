package com.inversiones.relaciones.infrastructure.db.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "vw_estado_accion")
@Data
public class EstadoAccionView {

    @Id
    @Column(name = "accion_id")
    private Integer accionId;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "ticker")
    private String ticker;

    @Column(name = "pais")
    private String pais;

    @Column(name = "industria")
    private String industria;

    @Column(name = "fecha_registro")
    private LocalDate fechaRegistro;

    @Column(name = "periodo_reportado")
    private String periodoReportado;

    @Column(name = "marketCap")
    private BigDecimal marketCap;

    @Column(name = "precioAccion")
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

    @Column(name = "utilidad_movil")
    private BigDecimal utilidadMovil;

    @Column(name = "utilidad_12m_movil")
    private BigDecimal utilidad12mMovil;

    @Column(name = "precio_utilidad")
    private BigDecimal precioUtilidad;

    @Column(name = "valor_bolsa_libro")
    private BigDecimal valorBolsaLibro;

    @Column(name = "utilidad_precio")
    private BigDecimal utilidadPrecio;

    @Column(name = "valor_libro_ajustado")
    private BigDecimal valor_libro_ajustado;

    @Column(name = "valor_bajo")
    private BigDecimal valorBajo;

    @Column(name = "valor_normal")
    private BigDecimal valorNormal;

    @Column(name = "valor_alto")
    private BigDecimal valorAlto;

    @Column(name = "estado")
    private String estado;

    @Column(name = "icono")
    private Integer icono;

}
