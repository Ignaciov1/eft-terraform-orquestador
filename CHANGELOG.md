# Changelog

Todas las modificaciones notables de este proyecto serán documentadas en este archivo de acuerdo con el estándar de Versionado Semántico (SemVer).

## [1.0.2] - 2026-05-28
### Changed
- Actualización de las referencias (`ref`) de los módulos externos a sus versiones estables más recientes (`v0.1.2` para VPC y `v0.1.1` para EC2).

## [1.0.1] - 2026-05-28
### Fixed
- Endurecimiento de seguridad en el pipeline CI/CD: se eliminó la bandera `--soft-fail` de Checkov.
- Excepción explícita de la regla `CKV2_AWS_5` añadida para evitar falsos positivos de recursos huérfanos al utilizar módulos externos de red y cómputo.

## [1.0.0] - 2026-05-28
### Changed
- Refactorización completa de la infraestructura: se eliminó el código monolítico local.
- El repositorio ahora actúa como Orquestador Central invocando módulos externos.
- Actualización del pipeline CI/CD (`cicd.yml`) para soportar la validación OPA en recursos anidados por módulos y añadir rollback automático (Destroy) en caso de fallos.

### Removed
- Eliminación de archivos locales `vpc.tf`, `ec2.tf`, `sg-group.tf` e `iam.tf` (migrados a repositorios modulares independientes).