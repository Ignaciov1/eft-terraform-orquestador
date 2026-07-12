# Orquestador de Infraestructura AWS - Evaluación Parcial 2

Repositorio principal para la asignatura **AUY1105 - Infraestructura como Código II**. Este proyecto actúa como un controlador central que orquesta la creación de infraestructura en AWS mediante el uso de módulos de Terraform desacoplados.

## Arquitectura Modular
Este repositorio no contiene definición de recursos directos, sino que invoca los siguientes módulos externos versionados:
1. **Módulo de Redes (v0.1.2):** [Repositorio de VPC](https://github.com/Ignaciov1/terraform-aws-vpc-AUY1105-grupo-3) - Encargado de VPC, Subredes, NAT, IGW y seguridad (KMS, Security Groups).
2. **Módulo de Cómputo (v0.1.1):** [Repositorio de EC2](https://github.com/Ignaciov1/terraform-aws-ec2-AUY1105-grupo-3) - Encargado del despliegue de instancias EC2 y perfiles IAM.

## Automatización (CI/CD)
El proyecto incluye un pipeline en GitHub Actions que realiza:
- Análisis de código estático (TFLint).
- Análisis de vulnerabilidades (Checkov).
- Validación de políticas de seguridad corporativas (OPA - Open Policy Agent).
- Despliegue automatizado (`terraform apply`).
- Mecanismo de **Rollback Automático**: Si el despliegue falla, ejecuta un destroy automático para evitar costos innecesarios en AWS Academy.

## Uso
Para inicializar este orquestador localmente:
```bash
terraform init
terraform plan
terraform apply