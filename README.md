# 🚀 AWS Infrastructure as Code - DevOps Seed Project

Este repositorio contiene el código de infraestructura para desplegar de forma automatizada una aplicación sobre AWS, utilizando:

- Terraform (IaC)
- AWS (ECS Fargate, ALB, Route53, ACM, CloudWatch)
- Terraform Cloud (Remote Backend y Pipelines de Infraestructura)
- GitHub para versionamiento y CI

---

## 📦 Arquitectura desplegada

- **VPC personalizada** (CIDR 10.0.0.0/16)
  - Subnets públicas en múltiples AZs (Alta disponibilidad)
  - Internet Gateway
  - Routing tables y asociaciones
- **ECS Fargate Cluster**
  - Despliegue serverless de contenedores Docker
- **ECR Repository**
  - Almacén de imágenes Docker privadas
- **IAM Roles**
  - Roles mínimos requeridos para ejecución de tasks ECS
- **Application Load Balancer (ALB)**
  - Balanceador HTTP/HTTPS con certificados SSL
  - Health checks y target groups
- **Route53 + Domain**
  - Registro DNS personalizado (projects-zahid.com)
- **ACM SSL Certificate**
  - Certificados validados por DNS
- **CloudWatch & S3**
  - Logging de contenedores ECS
  - Logging del ALB hacia S3

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
- AWS Services: ECS, ECR, ALB, VPC, Route53, ACM, CloudWatch

---

## 💡 Requerimientos iniciales

- Cuenta de AWS
- Dominio registrado en Route53
- Claves de acceso configuradas en Terraform Cloud como variables

---

## ✨ Próximos pasos

- Implementación de escalabilidad automática (Auto Scaling ECS)
- Backend remoto para state files (S3 + DynamoDB o full Terraform Cloud)
- Validaciones de seguridad (tfsec, Checkov)

---

> Proyecto construido como laboratorio personal de prácticas de IaC y DevOps.  
> ⚙️ **Objetivo:** simular un flujo productivo profesional de infraestructura administrada vía código.

---

## 🔗 Autor

Zahid - [GitHub](https://github.com/zahiduck97)

