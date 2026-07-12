package terraform.instance_type_check

# Por defecto bloqueamos el despliegue
default allow = false

allow {
    count(violations) == 0
}

violations[instance.address] {
    instance := input.resource_changes[_]
    instance.type == "aws_instance"
    
    # Ignoramos recursos que se están destruyendo, solo evaluamos creaciones/modificaciones
    instance.change.actions[_] != "delete"
    
    # La violación ocurre si el tipo NO es t2.micro
    instance.change.after.instance_type != "t2.micro"
}