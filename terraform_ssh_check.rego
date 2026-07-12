package terraform.ssh_check

# Por defecto bloqueamos el despliegue
default allow = false

# Permitimos si no hay violaciones
allow {
    count(violations) == 0
}

# Encontramos una violación si algún SG tiene el puerto 22 abierto a 0.0.0.0/0
violations[sg.address] {
    sg := input.resource_changes[_]
    sg.type == "aws_security_group"
    
    # Verificamos las reglas de ingreso
    ingress := sg.change.after.ingress[_]
    
    # Revisamos que cubra el puerto 22
    ingress.from_port <= 22
    ingress.to_port >= 22
    
    # Revisamos si contiene la IP pública
    ingress.cidr_blocks[_] == "0.0.0.0/0"
}