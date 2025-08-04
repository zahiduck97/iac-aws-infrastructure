# 🚀 AWS Infrastructure as Code - DevOps Seed Project

Este repositorio contiene el código de infraestructura para desplegar de forma automatizada una aplicación sobre AWS, utilizando:

- Terraform (IaC)
- AWS (ECS Fargate, CloudFront, Route53, ACM)
- Terraform Cloud (Remote Backend y Pipelines de Infraestructura)
- GitHub para versionamiento y CI

---

## 📦 Arquitectura desplegada

- **VPC personalizada** (CIDR 10.0.0.0/16)
  - Subnet pública
  - Internet Gateway
  - Routing tables y asociaciones
- **ECS Fargate Cluster**
  - Despliegue serverless de contenedores Docker
  - Contenedor accesible en puerto 3000
- **ECR Repository**
  - Almacén de imágenes Docker privadas
- **IAM Roles**
  - Roles mínimos requeridos para ejecución de tasks ECS
- **CloudFront**
  - Distribución global con soporte **HTTPS** usando ACM
  - Punto de acceso estable para el dominio
- **Route53 + Domain**
  - Registro DNS personalizado (`projects-zahid.com`)
- **ACM SSL Certificate**
  - Certificados SSL validados por DNS

---

## 🚀 Flujo de trabajo CI/CD (Infraestructura)

1️⃣ Código de Terraform versionado en GitHub  
2️⃣ Integración automática con Terraform Cloud  
3️⃣ Ejecución automática de:
- `terraform plan`  
- `terraform apply` (requiere aprobación manual)

---

## 🛠 Tecnologías usadas

- Terraform v1.12+
- AWS Provider v4.0+
- Terraform Cloud (Free tier)
- AWS Services: ECS, ECR, CloudFront, VPC, Route53, ACM

---

## 💡 Requerimientos iniciales

- Cuenta de AWS
- Dominio registrado en Route53
- Certificado SSL emitido por ACM
- Claves de acceso configuradas en Terraform Cloud como variables

---

## ✨ Próximos pasos

- Automatización para actualizar el origen de CloudFront si cambia la IP de ECS.
- Implementación de escalabilidad automática (Auto Scaling ECS).
- Validaciones de seguridad (tfsec, Checkov).

---

> Proyecto construido como laboratorio personal de prácticas de IaC y DevOps.  
> ⚙️ **Objetivo:** simular un flujo productivo profesional de infraestructura administrada vía código.

---

## 🔗 Autor

Zahid - [GitHub](https://github.com/zahiduck97)
