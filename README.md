# Orquestador de Infraestructura AWS - Evaluación Final Transversal (EFT)

Repositorio principal para la asignatura **AUY1105 - Infraestructura como Código II**. Este proyecto actúa como un controlador central que orquesta la creación de infraestructura en AWS mediante el uso de módulos de Terraform desacoplados.

## Arquitectura Modular
Este repositorio no contiene definición de recursos directos, sino que invoca los siguientes módulos externos versionados:
1. **Módulo de Redes (v1.1.0):** [Repositorio de VPC](https://github.com/Ignaciov1/eft-terraform-modulo-redes) - Encargado de VPC, Subredes, NAT, IGW y seguridad (KMS, Security Groups).
2. **Módulo de Cómputo (v1.1.0):** [Repositorio de EC2](https://github.com/Ignaciov1/eft-terraform-modulo-computo) - Encargado del despliegue de instancias EC2 y perfiles IAM.

## Automatización (CI/CD)
El proyecto incluye un pipeline en GitHub Actions que realiza:
- Análisis de código estático (TFLint).
- Análisis de vulnerabilidades (Checkov).
- Validación de políticas de seguridad corporativas (OPA - Open Policy Agent).
- Despliegue automatizado (`terraform apply`).
- **Mecanismo de Rollback Automático**: Si ocurre un fallo exclusivamente durante la etapa de despliegue (ej. restricciones de capa gratuita o red en AWS), el pipeline captura el estado de error y ejecuta automáticamente un `terraform destroy` para limpiar la infraestructura creada a medias y proteger los créditos de AWS Academy.
- **Destrucción Manual Controlada**: Permite detonar la limpieza completa de la infraestructura bajo demanda, mediante la confirmación de una variable booleana directamente desde la interfaz de GitHub Actions (`workflow_dispatch`).

## Uso
Para inicializar este orquestador localmente:
```bash
terraform init
terraform plan
terraform apply
```

## 📂 Ejemplos de uso
En la carpeta `examples/` encontrarás una guía práctica y el código de referencia para desplegar este orquestador en un entorno simulado.