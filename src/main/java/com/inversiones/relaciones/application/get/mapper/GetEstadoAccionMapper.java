package com.inversiones.relaciones.application.get.mapper;

import com.inversiones.relaciones.application.get.dto.EstadoAccionDto;
import com.inversiones.relaciones.infrastructure.db.entity.EstadoAccionView;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

@Mapper
public interface GetEstadoAccionMapper {
    GetEstadoAccionMapper INSTANCE = Mappers.getMapper(GetEstadoAccionMapper.class);

    EstadoAccionDto toEstadoAccionView(EstadoAccionView estadoAccionView);

    List<EstadoAccionDto> toListView(List<EstadoAccionView> estadoAccionViewList);
}
