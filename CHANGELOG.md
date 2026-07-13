# Changelog

Todas las modificaciones notables de este proyecto serán documentadas en este archivo de acuerdo con el estándar de Versionado Semántico (SemVer).

## [1.1.0] - 2026-07-12
### Added
- Creación de la estructura de pruebas funcionales en directorio `examples/`.
- Actualización de documentación `README.md` a Evaluación Final Transversal.
### Changed
- Actualización de los orígenes de módulos (source) en `main.tf` para consumir la versión estable `v1.1.0` de los repositorios de Redes y Cómputo.

## [1.0.0] - 2026-07-12
### Added
- Pipeline de CI/CD automatizado con GitHub Actions.
- Integración de validaciones de seguridad con OPA (Open Policy Agent) limitando accesos SSH e instancias `t2.micro`.
- Integración de escáner de vulnerabilidades de código mediante Checkov.
### Fixed
- Corrección de políticas OPA redundantes ajustándose estrictamente a la rúbrica de evaluación.
- Ajuste de formato general e indentación con `terraform fmt`.