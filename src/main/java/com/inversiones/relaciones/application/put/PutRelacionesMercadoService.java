package com.inversiones.relaciones.application.put;

import com.inversiones.relaciones.application.put.dto.RelacionesMercadoDto;
import com.inversiones.relaciones.infrastructure.db.entity.EstadoAccionView;
import com.inversiones.relaciones.infrastructure.db.repository.EstadoAccionRepository;
import com.inversiones.relaciones.infrastructure.db.repository.RelacionesMercadoRepository;
import com.inversiones.relaciones.web.dto.RelacionesMercadoRequestDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
@RequiredArgsConstructor
public class PutRelacionesMercadoService {
    private final EstadoAccionRepository estadoAccionRepository;
    private final RelacionesMercadoRepository relacionesMercadoRepository;

    public RelacionesMercadoDto updatePrecioAccion(Integer accionId, BigDecimal nuevoPrecio){
        String msg = "Update OK - updatePrecioAccion";
        List<EstadoAccionView> list = estadoAccionRepository.findByAccionId(accionId);
        if(!list.isEmpty()){
            String ticket = list.getFirst().getTicker();

            relacionesMercadoRepository.updatePrecioAccion(accionId, nuevoPrecio);

            msg = msg + " " + ticket;
        }else {
            msg = "No existe còdigo : {accionId}";
        }

        return new RelacionesMercadoDto(msg);
    }

    public  RelacionesMercadoDto actualizarRelacionesMercado(Integer accionId, RelacionesMercadoRequestDTO requestDTO){
        String msg = "Update OK - actualizarRelacionesMercado";
        if(relacionesMercadoRepository.findByAccionId(accionId).isPresent()){
            relacionesMercadoRepository.updateRelacionesMercado(accionId, requestDTO.precioAccion(),
                    requestDTO.cantidadAcciones(), requestDTO.utilidadMesActual(), requestDTO.utilidadFinalAnterior(),
                    requestDTO.utilidadMesAnterior(), requestDTO.patrimonioMesActual(),requestDTO.periodoReportado());
        }else {
            msg = "No existe código " + accionId;
        }

        return new RelacionesMercadoDto(msg);
    }
}
