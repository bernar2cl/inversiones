package com.inversiones.relaciones.application.put;

import com.inversiones.relaciones.application.put.dto.RelacionesMercadoDto;
import com.inversiones.relaciones.web.dto.RelacionesMercadoRequestDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;

@Component
@RequiredArgsConstructor
public class PutRelacionesMercadoGateway {
    private final PutRelacionesMercadoService service;

    public RelacionesMercadoDto updatePrecioAccion(Integer accionId, BigDecimal nuevoPrecio){
        return service.updatePrecioAccion(accionId, nuevoPrecio);
    }

    public  RelacionesMercadoDto actualizarRelacionesMercado(Integer accionId, RelacionesMercadoRequestDTO requestDTO){
        return service.actualizarRelacionesMercado(accionId, requestDTO);
    }
}
