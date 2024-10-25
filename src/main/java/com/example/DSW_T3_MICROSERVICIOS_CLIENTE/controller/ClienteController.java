package com.example.DSW_T3_MICROSERVICIOS_CLIENTE.controller;

import com.example.DSW_T3_MICROSERVICIOS_CLIENTE.model.Cliente;
import com.example.DSW_T3_MICROSERVICIOS_CLIENTE.repository.ClienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/clientes")
public class ClienteController {

    @Autowired
    private ClienteRepository clienteRepository;

    @PostMapping("/registrar")
    public Cliente registrarCliente(@RequestBody Cliente cliente) {
        return clienteRepository.save(cliente);
    }
}
