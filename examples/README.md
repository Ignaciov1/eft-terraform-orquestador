# Ejemplo de Despliegue: Orquestador Completo

## Objetivo
Esta carpeta contiene un ejemplo práctico de cómo instanciar el orquestador completo de la infraestructura. Sirve como prueba de concepto para desplegar la arquitectura completa (Módulo de Redes + Módulo de Cómputo) en un entorno simulado o de desarrollo, manteniendo la estructura centralizada[cite: 9, 10].

## Componentes Desplegados
Al ejecutar este ejemplo, Terraform llamará a la configuración de la raíz del repositorio, la cual a su vez invocará:
* **Módulo de Redes**: Creación de VPC, Subredes y Security Groups[cite: 10].
* **Módulo de Cómputo**: Creación de la instancia EC2 (`t2.micro`) conectada a las salidas de red[cite: 2, 10, 12].

## Instrucciones de Uso
Para probar este entorno de forma local, sigue estos pasos en orden:

1. Asegúrate de tener tus credenciales de AWS (AWS Academy) exportadas en tu terminal.
2. Navega a este directorio en tu consola ejecutando: `cd examples/`
3. Inicializa Terraform para descargar los módulos externos ejecutando: `terraform init`
4. Revisa el plan de ejecución ejecutando: `terraform plan`
5. Aplica los cambios ejecutando: `terraform apply -auto-approve`
6. **Importante:** Recuerda destruir los recursos una vez finalizada la prueba para no consumir los créditos de AWS Academy ejecutando: `terraform destroy -auto-approve`