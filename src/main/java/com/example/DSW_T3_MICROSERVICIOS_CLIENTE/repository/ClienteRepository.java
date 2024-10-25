package com.example.DSW_T3_MICROSERVICIOS_CLIENTE.repository;

import com.example.DSW_T3_MICROSERVICIOS_CLIENTE.model.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClienteRepository extends JpaRepository<Cliente, Integer> {
}
