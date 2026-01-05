package com.inversiones.relaciones.application.get;

import com.inversiones.relaciones.application.get.dto.EstadoAccionDto;
import com.inversiones.relaciones.application.get.mapper.GetEstadoAccionMapper;
import com.inversiones.relaciones.infrastructure.db.entity.EstadoAccionView;
import com.inversiones.relaciones.infrastructure.db.repository.EstadoAccionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
@RequiredArgsConstructor
public class GetEstadoAccionService {
    private final EstadoAccionRepository repository;

    public List<EstadoAccionDto> listarTodos(){
        List<EstadoAccionView> list = repository.findAll();
        return GetEstadoAccionMapper.INSTANCE.toListView(list);
    }

    public List<EstadoAccionDto> listarPais(String pais){
        List<EstadoAccionView> list = repository.findByPaisIgnoreCase(pais);
        return GetEstadoAccionMapper.INSTANCE.toListView(list);
    }
    public List<EstadoAccionDto> listarIndustria(String industria){
        List<EstadoAccionView> list = repository.findByIndustriaIgnoreCase(industria);
        return GetEstadoAccionMapper.INSTANCE.toListView(list);
    }
    public List<EstadoAccionDto> listarTicker(String ticker){
        List<EstadoAccionView> list = repository.findByTickerIgnoreCase(ticker);
        return GetEstadoAccionMapper.INSTANCE.toListView(list);
    }
}
