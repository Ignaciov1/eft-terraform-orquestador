# ==============================================================================
# Ejemplo de Despliegue - Entorno de Prueba (Dev)
# ==============================================================================
# Este archivo demuestra cómo se puede llamar al orquestador principal
# para levantar una réplica exacta de la infraestructura.

terraform {
  required_version = ">= 1.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Llamamos al módulo raíz (orquestador)
module "entorno_prueba" {
  # El source apunta a la raíz del repositorio actual
  source = "../"
}