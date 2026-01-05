package com.inversiones.relaciones.infrastructure.db.repository;

import com.inversiones.relaciones.infrastructure.db.entity.RelacionesMercadoTable;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.Optional;

@Repository
public interface RelacionesMercadoRepository extends JpaRepository<RelacionesMercadoTable, Integer> {
    Optional<RelacionesMercadoTable> findByAccionId(Integer accionId);

    @Modifying
    @Transactional
    @Query(value = "INSERT INTO relaciones_mercado " +
            "(accion_id, precio_accion, cantidad_acciones, utilidad_mes_actual, utilidad_final_anterior, utilidad_mes_anterior, patrimonio_mes_actual, periodo_reportado) " +
            "VALUES " +
            "(:p_accion_id, :p_precio_accion, :p_cantidad_acciones, :p_utilidad_mes_actual, :p_utilidad_final_anterior, :p_utilidad_mes_anterior, :p_patrimonio_mes_actual, :p_periodo_reportado)", nativeQuery = true)
    void saveRelacionesMercado(@Param("p_accion_id") Integer accionId,
                               @Param("p_precio_accion") BigDecimal precioAccion,
                               @Param("p_cantidad_acciones") BigDecimal cantidadAcciones,
                               @Param("p_utilidad_mes_actual") BigDecimal utilidadMesActual,
                               @Param("p_utilidad_final_anterior") BigDecimal utilidadFinalAnterior,
                               @Param("p_utilidad_mes_anterior") BigDecimal utilidadMesAnterior,
                               @Param("p_patrimonio_mes_actual") BigDecimal patrimonioMesActual,
                               @Param("p_periodo_reportado") String periodoReportado);

    @Modifying
    @Transactional
    @Query(value = "UPDATE relaciones_mercado " +
            "SET " +
            "precio_accion = :p_precio_accion, " +
            "cantidad_acciones = :p_cantidad_acciones, " +
            "utilidad_mes_actual = :p_utilidad_mes_actual, " +
            "utilidad_final_anterior = :p_utilidad_final_anterior, " +
            "utilidad_mes_anterior = :p_utilidad_mes_anterior, " +
            "patrimonio_mes_actual = :p_patrimonio_mes_actual, " +
            "periodo_reportado = :p_periodo_reportado " +
            "WHERE accion_id = :p_accion_id", nativeQuery = true)
    void updateRelacionesMercado(@Param("p_accion_id") Integer accionId,
                                 @Param("p_precio_accion") BigDecimal precioAccion,
                                 @Param("p_cantidad_acciones") BigDecimal cantidadAcciones,
                                 @Param("p_utilidad_mes_actual") BigDecimal utilidadMesActual,
                                 @Param("p_utilidad_final_anterior") BigDecimal utilidadFinalAnterior,
                                 @Param("p_utilidad_mes_anterior") BigDecimal utilidadMesAnterior,
                                 @Param("p_patrimonio_mes_actual") BigDecimal patrimonioMesActual,
                                 @Param("p_periodo_reportado") String periodoReportado);

    @Modifying
    @Transactional
    @Query(value = "UPDATE relaciones_mercado SET precio_accion = :p_precio_accion WHERE accion_id = :p_accion_id", nativeQuery = true)
    void updatePrecioAccion(@Param("p_accion_id") Integer accionId,
                            @Param("p_precio_accion") BigDecimal precioAccion);
}
