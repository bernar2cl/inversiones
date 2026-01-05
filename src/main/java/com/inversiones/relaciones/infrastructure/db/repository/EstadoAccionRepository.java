package com.inversiones.relaciones.infrastructure.db.repository;

import com.inversiones.relaciones.infrastructure.db.entity.EstadoAccionView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EstadoAccionRepository extends JpaRepository<EstadoAccionView, Integer> {
    List<EstadoAccionView> findByPaisIgnoreCase(String pais);
    List<EstadoAccionView> findByIndustriaIgnoreCase(String industria);
    List<EstadoAccionView> findByTickerIgnoreCase(String ticker);
    List<EstadoAccionView> findByAccionId(Integer accionId);
}
