package com.inversiones.relaciones.web.controller;


import com.inversiones.relaciones.application.put.PutRelacionesMercadoGateway;
import com.inversiones.relaciones.application.put.dto.RelacionesMercadoDto;
import com.inversiones.relaciones.web.dto.RelacionesMercadoRequestDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;

@RestController
@RequestMapping("/relaciones-mercado")
@RequiredArgsConstructor
public class RelacionesMercadoController {
    private final PutRelacionesMercadoGateway gateway;

    @PatchMapping("/{accionId}/precio")
    public RelacionesMercadoDto updatePrecioAccion(@PathVariable Integer accionId, @RequestParam BigDecimal nuevoPrecio){
        return gateway.updatePrecioAccion(accionId, nuevoPrecio);
    }

    @PutMapping("/{accionId}")
    public  RelacionesMercadoDto actualizarRelacionesMercado(@PathVariable Integer accionId, @RequestBody RelacionesMercadoRequestDTO requestDTO){
        return gateway.actualizarRelacionesMercado(accionId, requestDTO);
    }
}
