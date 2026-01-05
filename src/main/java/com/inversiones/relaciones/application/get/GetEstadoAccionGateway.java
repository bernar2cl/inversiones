package com.inversiones.relaciones.application.get;

import com.inversiones.relaciones.application.get.dto.EstadoAccionDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class GetEstadoAccionGateway {
    private final GetEstadoAccionService service;

    public List<EstadoAccionDto> listarTodos(){
        return service.listarTodos();
    }
    public List<EstadoAccionDto> listarPais(String pais){
        return service.listarPais(pais);
    }
    public List<EstadoAccionDto> listarIndustria(String industria){
        return service.listarIndustria(industria);
    }
    public List<EstadoAccionDto> listarTicker(String ticker){
        return service.listarTicker(ticker);
    }
}
