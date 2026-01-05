package com.inversiones.relaciones.web.controller;

import com.inversiones.relaciones.application.get.GetEstadoAccionGateway;
import com.inversiones.relaciones.application.get.dto.EstadoAccionDto;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/estado-accion")
@RequiredArgsConstructor
public class EstadoAccionController {
    private final GetEstadoAccionGateway gateway;

    @GetMapping
    public List<EstadoAccionDto> listarTodas(){
        return gateway.listarTodos();
    }

    @GetMapping("pais/{pais}")
    public List<EstadoAccionDto> listarPais(@PathVariable String pais){
        return gateway.listarPais(pais);
    }

    @GetMapping("industria/{industria}")
    public List<EstadoAccionDto> listarIndustria(@PathVariable String industria){
        return gateway.listarIndustria(industria);
    }

    @GetMapping("ticker/{ticker}")
    public List<EstadoAccionDto> listarTicker(@PathVariable String ticker){
        return gateway.listarTicker(ticker);
    }
}
