## Business Unit: Seguridad Aplicativa (AppSec)

### Definición
Productos y servicios diseñados para analizar y probar aplicaciones en busca de vulnerabilidades de seguridad (definición Gartner). Cubre el ciclo completo de desarrollo de software (SDLC) con análisis estático, dinámico, de composición de software y seguridad de cadena de suministro.

### Pilares de servicio AppSec

Cybolt organiza sus servicios AppSec en 4 pilares:

#### Pilar 1: Gobierna
- Diseño de políticas basado en gobierno de seguridad aplicativa
- Modelado de gobierno de seguridad aplicativa
- Diseño de desarrollo seguro y modelado de amenazas a medida

#### Pilar 2: Diseña
- Seguridad Aplicativa + Agile
- Estrategias de adopción de herramientas en flujos operativos y capacitación
- Diseño, implementación y gestión de modelo DevSecOps a medida

#### Pilar 3: Desarrolla
- Implementación de herramientas líderes en AST (Application Security Testing)
- Implementación de herramientas líderes en DevSecOps
- Implementación de herramientas líderes en Supply Chain Security

#### Pilar 4: Controla
- Servicio de Postura de Seguridad Aplicativa (assessment + plan de remediación)
- Análisis urgentes de AppSec — resultados en no más de 24 horas (SLA diferenciador)
- Informes mensuales de salud de seguridad aplicativa a demanda

### Tipos de análisis de seguridad en aplicaciones

| Tipo | Sigla | Qué hace |
|------|-------|----------|
| Análisis estático | SAST | Evalúa vulnerabilidades en código fuente/binarios en entorno "fuera de línea" |
| Análisis dinámico | DAST | Se ejecuta sobre la aplicación en operación (web/API/microservicios) en diferentes ambientes |
| Análisis de composición de software | SCA | Identifica vulnerabilidades en librerías de terceros/open source |
| Seguridad de IaC | IaC Security | Analiza configuraciones de infraestructura como código (Terraform, CloudFormation, K8s) |
| Seguridad de contenedores | Container Security | Análisis de vulnerabilidades en imágenes de contenedores |
| Detección de secretos | Secret Detection | Detecta credenciales/secretos expuestos en código |

### Estándares de seguridad aplicativa
- **OWASP Top 10**: Riesgos más críticos en seguridad de aplicaciones web
- **CWE Top 25**: Problemas de seguridad más comunes basados en datos CVE y puntajes CVSS
- **Metodología SQALE**: Para calendarización de pruebas y garantía de remediación

### Plataformas core de AppSec

Cybolt trabaja con tres plataformas principales, cada una con fortalezas distintas:

#### GitLab (DevSecOps nativo)

| Capacidad | Descripción |
|-----------|-------------|
| SAST integrado | Análisis estático nativo en el pipeline CI/CD de GitLab |
| DAST | Escaneo dinámico de aplicaciones web y APIs |
| Dependency Scanning | SCA para vulnerabilidades en librerías de terceros |
| Secret Detection | Detección de secretos/credenciales en código |
| Container Scanning | Análisis de vulnerabilidades en imágenes de contenedores |
| License Compliance | Gestión de cumplimiento de licencias open source |

**Fortaleza**: Plataforma "all-in-one" para organizaciones que ya usan GitLab como repositorio/CI/CD. Menor fricción de adopción para equipos DevOps.

#### Veracode

| Modalidad | Descripción |
|-----------|-------------|
| Upload & Scan | Análisis estático tradicional (subida de binarios) |
| Sandbox Scan | Escaneo en ambiente aislado |
| Pipeline Scan | Integración en CI/CD via Veracode CLI |
| Agent Based (CLI) | Análisis basado en agente |
| Plugin IDE | SAST, SCA y Fix directamente en el IDE del desarrollador |

**Fortaleza**: Plataforma SaaS madura con estudio Forrester TEI que respalda ROI. Fuerte en análisis de binarios sin acceso a código fuente.

#### Checkmarx

| Capacidad | Descripción |
|-----------|-------------|
| CxSAST | Análisis estático de código fuente con soporte amplio de lenguajes |
| CxSCA | Software Composition Analysis para librerías open source |
| CxDAST | Análisis dinámico de aplicaciones en ejecución |
| KICS | Seguridad de Infrastructure as Code (Terraform, CloudFormation, K8s) |
| Supply Chain Security | Protección de cadena de suministro de software |
| Codebashing | Capacitación en desarrollo seguro para desarrolladores |

**Fortaleza**: Cobertura amplia de lenguajes, fuerte en on-premise para organizaciones con restricciones de soberanía de datos (gobierno/banca). KICS y Codebashing como diferenciadores.

#### Comparativa para mapeo en RFPs

| Criterio | GitLab | Veracode | Checkmarx |
|----------|--------|----------|-----------|
| Modelo de deployment | SaaS / Self-managed | SaaS | SaaS / On-premise |
| SAST | ✅ | ✅ | ✅ |
| DAST | ✅ | ✅ | ✅ |
| SCA | ✅ | ✅ | ✅ |
| IaC Security | ✅ | ❌ | ✅ (KICS) |
| Container Security | ✅ | ✅ | ✅ |
| Análisis de binarios (sin código) | ❌ | ✅ | ❌ |
| Capacitación devs integrada | ❌ | eLearning | ✅ (Codebashing) |
| Ideal para | Equipos DevOps en GitLab | Orgs enterprise SaaS-first | Gobierno/banca con req. on-prem |

#### Criterios de selección de plataforma por contexto
- **Cliente ya usa GitLab** → GitLab (menor fricción, todo en uno)
- **Cliente enterprise SaaS-first, no quiere infraestructura** → Veracode
- **Cliente gobierno/banca con restricciones de soberanía de datos o requisito on-prem** → Checkmarx
- **Cliente necesita análisis de binarios sin código fuente** → Veracode
- **Cliente necesita IaC Security (Terraform/K8s)** → GitLab o Checkmarx (KICS)
- **Cliente requiere capacitación integrada para desarrolladores** → Checkmarx (Codebashing)

#### Vendor locks en AppSec — Cómo identificar al incumbente

| Señal en el RFP | Apunta a | Acción |
|-----------------|----------|--------|
| "Upload & Scan de binarios", "Sandbox Scan" | Veracode | Si Cybolt es partner, aprovechar; si no, proponer equivalencia |
| "KICS", "IaC scanning nativo" | Checkmarx | Evaluar si GitLab cubre o proponer Checkmarx |
| "Integración nativa con repositorio Git", "security dashboard en pipeline" | GitLab | Fuerte si cliente ya usa GitLab; si usa otro SCM, cuestionar |
| "Codebashing", "capacitación gamificada en código seguro" | Checkmarx | Lock medio — proponer equivalencias de eLearning |
| "CxSAST", "CxSCA" | Checkmarx (nomenclatura comercial) | Lock duro — preguntar en Junta por equivalencias funcionales |
| "Veracode CLI", "Veracode Agent" | Veracode (nomenclatura comercial) | Lock duro — preguntar en Junta por equivalencias funcionales |

### Gobierno de Seguridad Aplicativa — Modelo de madurez

El roadmap de madurez AppSec de Cybolt tiene 4 fases:

| Fase | Nombre | Objetivo |
|------|--------|----------|
| 1 | Gobierno de seguridad aplicativa | Estandarizar procesos SDLC para que contemplen seguridad en cada etapa |
| 2 | Calendario de pruebas AppSec | Establecer ciclos de testing y garantía de remediación (metodología SQALE) |
| 3 | DevSecOps y automatización | Integrar seguridad automatizada en pipelines CI/CD |
| 4 | Adoptar y enseñar continuamente | Cultura de seguridad y capacitación permanente |

Objetivos transversales: **Descubrir y comunicar → Implementar y documentar → Adoptar y practicar**

### Metodología de implementación AppSec (timeline típico ~3 semanas)

| Fase | Actividades | Timing |
|------|-------------|--------|
| **Fase 1 - Preparación** | Entendimiento del ambiente y herramientas, generación del plan de trabajo, validación de requerimientos y pre-requisitos | Pre-KickOff |
| **Fase 2 - Diseño** | Definición de roles y perfiles, selección de aplicaciones para pruebas iniciales | Semana 1-2 |
| **Fase 3 - Ejecución** | Capacitación administrativa y técnica de plataforma, integraciones y configuraciones, validación de resultados | Semana 2-3 |

*Este es un caso base de industria y puede adaptarse a las necesidades de cada organización.*

### Servicio de Postura de Seguridad Aplicativa (Assessment)

Servicio diferenciador de Cybolt basado en metodología de investigación para descubrir brechas de seguridad en aplicaciones.

**Preguntas que responde el assessment:**
1. ¿Mis tecnologías son seguras y modernas?
2. ¿Requiero invertir nuevamente?, y ¿por qué?
3. ¿El cumplimiento de mi negocio está correcto, qué me falta?
4. ¿Se tienen huecos de seguridad críticos en mis aplicaciones?

**Entregable**: Informe con plan de remediación.

### Discovery questions para oportunidades AppSec

Al evaluar o calificar una oportunidad de AppSec, obtener respuestas a:

1. ¿Cuántas aplicaciones necesita proteger?
2. ¿Con qué tecnologías/frameworks/lenguajes están creadas?
3. ¿La organización está comenzando con AppSec o tiene un programa establecido?
4. ¿Sigue metodología cascada, Agile o DevSecOps?
5. ¿Qué importancia tiene la integración con herramientas de desarrollo existentes?
6. ¿Tiene equipo de seguridad dedicado o los desarrolladores remedian solos?
7. ¿Cuánto está dispuesto a invertir en plataforma AppSec?

Estas preguntas también sirven para formular preguntas en Juntas de Aclaraciones cuando el RFP incluye componentes de AppSec.

### Consideraciones de plataforma AppSec (criterios de evaluación del cliente)

Al preparar propuestas, considerar que los clientes evalúan:
- **Integración**: La herramienta debe integrarse al flujo de trabajo de desarrollo existente
- **Cobertura**: Ciclo completo de desarrollo (SDLC) — no solo una fase
- **Escalabilidad**: Adaptarse al crecimiento de la organización sin degradar rendimiento
- **Precisión**: Identificar vulnerabilidades reales y minimizar falsos positivos
- **Flexibilidad**: Políticas personalizables, parámetros de escaneo configurables
- **Reportes accionables**: Información práctica para remediar, no solo listar vulnerabilidades
- **Reputación del vendor**: Track record, soporte, documentación, comunidad

### Data points para propuestas y justificación económica

#### Estado de las aplicaciones (datos de industria)
- 72% de aplicaciones tienen al menos una falla de seguridad en análisis SAST
- 2 de cada 10 apps tienen vulnerabilidad de severidad alta (solo SAST)
- 80% de aplicaciones tienen fallas cuando se aplican múltiples análisis
- 5 de cada 10 apps tienen falla de severidad alta con múltiples análisis
- 69% de apps tienen al menos una falla de OWASP Top 10
- 63% de apps tienen fallas en código propio
- 70% contienen fallas en librerías de terceros (open source)
- 92% de fallas en librerías se corrigen con una actualización
- 69% de esas actualizaciones son cambios menores

#### ROI de plataforma AppSec (fuente: Forrester TEI / Veracode)
- 75% reducción en riesgo de ataque basado en software
- 80% mejora en productividad de desarrolladores
- 70,000 horas de desarrollo reasignadas a innovación
- 85% reducción en flujos de trabajo manuales de AppSec gracias a automatización
- 20% crecimiento en ingresos por desarrollo más seguro y centrado en el cliente

#### Casos de riesgo reales (storytelling para propuestas)

| Caso | Qué es | Impacto | Argumento de venta |
|------|--------|---------|-------------------|
| **Spring4Shell** | Vulnerabilidad en Java Spring Core | 16% de organizaciones afectadas en primeros 4 días del zero-day | Urgencia de SAST — detectar antes de que explote |
| **Log4j (Log4Shell)** | Vulnerabilidad en biblioteca de logs Java (400K+ descargas) | Afectó Twitter, Amazon, Microsoft y prácticamente todo servicio Java | Necesidad de SCA — controlar librerías de terceros |
| **npm supply chain** | Compromiso en gestor de paquetes Node.js | Un solo compromiso amenazó 34% de paquetes npm | Supply Chain Security es imprescindible |

Usar estos casos para ilustrar el riesgo de NO tener seguridad aplicativa. Son particularmente efectivos en presentaciones a C-level y en justificaciones económicas.

---

### Portafolio — Observabilidad (partners directos)

La observabilidad es una extensión natural de AppSec — permite detectar anomalías de comportamiento en aplicaciones en producción, correlacionar incidentes de seguridad con degradación de rendimiento, y dar visibilidad end-to-end del stack de aplicaciones. Cybolt es partner directo de Elastic y Dynatrace.

#### Elastic (partner directo)

| Producto | Descripción | Notas de venta |
|---------|-------------|---------------|
| **Elastic Observability** | Suite completa de observabilidad: logs, métricas, trazas (APM) y uptime en una sola plataforma | Diferenciador: un solo stack para seguridad (SIEM) + observabilidad — reduce silos entre SecOps y DevOps |
| **Elastic APM** | Application Performance Monitoring — trazabilidad distribuida de transacciones en microservicios | Clave para clientes con arquitecturas cloud-native y microservicios |
| **Elastic Logs** | Ingesta y análisis centralizado de logs de cualquier fuente (infraestructura, aplicaciones, nube) | Base para SIEM y observabilidad unificada |
| **Elastic Metrics** | Monitoreo de métricas de infraestructura (hosts, contenedores, Kubernetes) | Complemento a logs y trazas para visibilidad completa |
| **Elastic Synthetics** | Monitoreo sintético — simula transacciones de usuario para detectar caídas antes que el usuario | Muy relevante para bancos y e-commerce con SLAs de disponibilidad |
| **Elastic Security (SIEM)** | SIEM + XDR nativo sobre el mismo stack de Elasticsearch | Cross-sell natural: cliente con Elastic Observability → agregar Elastic Security como SIEM |
| **Elastic Cloud** | Versión SaaS de Elastic sobre AWS/GCP/Azure | Para clientes que no quieren operar la infraestructura de Elastic |

> **Nota de ventas**: Elastic es el único vendor que unifica observabilidad + seguridad en un solo stack. Para clientes que ya usan ELK (Elasticsearch/Logstash/Kibana) de forma open source, el upsell a Elastic Enterprise con soporte Cybolt es una conversación natural. También posicionar como alternativa a Splunk en costo.

#### Dynatrace (partner directo)

| Producto | Descripción | Notas de venta |
|---------|-------------|---------------|
| **Dynatrace Platform** | Plataforma unificada de observabilidad con IA (Davis AI) — APM, infraestructura, logs, experiencia digital | Líder absoluto en Gartner Magic Quadrant de APM. Para clientes enterprise que quieren la mejor observabilidad del mercado |
| **Application Performance Monitoring (APM)** | Trazabilidad automática de transacciones — sin configuración manual (auto-instrumentation) | Diferenciador clave: despliegue en horas, no semanas. Especialmente valioso en entornos complejos |
| **Infrastructure Monitoring** | Monitoreo de hosts, contenedores, Kubernetes, cloud (AWS/Azure/GCP/OCI) | Cobertura completa de infraestructura on-prem y multi-cloud |
| **Digital Experience Monitoring (DEM)** | Real User Monitoring (RUM) + Synthetics — mide la experiencia del usuario final | Muy relevante para bancos con portales transaccionales críticos (acceso24, banca en línea) |
| **Dynatrace Security (RASP + Vuln Mgmt)** | Runtime Application Security — detección de vulnerabilidades y ataques en tiempo real en producción | Puente entre AppSec y observabilidad: detecta explotación de vulnerabilidades en producción |
| **Davis AI** | Motor de IA causal que analiza todo el stack y determina la causa raíz automáticamente | Diferenciador competitivo clave — reduce MTTR dramáticamente |
| **Cloud Automation** | AIOps para automatización de respuesta a incidentes de rendimiento | Cross-sell para clientes DevOps maduros con pipelines de CI/CD |

> **Nota de ventas**: Dynatrace es la opción premium de observabilidad — precio más alto pero ROI claro en reducción de MTTR y menor necesidad de personal de operaciones. El auto-instrumentation (OneAgent) es un diferenciador enorme para clientes con muchas aplicaciones — no requieren instrumentación manual. Posicionar en clientes enterprise financieros con alta criticidad de disponibilidad.

#### Comparativa Elastic vs Dynatrace

| Criterio | Elastic | Dynatrace |
|----------|---------|-----------|
| **Modelo de pricing** | Por volumen de datos ingestados | Por unidad de host monitoreado |
| **Facilidad de despliegue** | Requiere configuración (más flexible) | Auto-instrumentation — muy rápido |
| **Observabilidad + Seguridad** | ✅ Un solo stack (SIEM + Observabilidad) | ⚠️ Seguridad como módulo adicional |
| **IA / causa raíz automática** | ⚠️ ML disponible pero menos avanzado | ✅ Davis AI — líder del mercado |
| **Costo** | ✅ Más accesible, alternativa a Splunk | ❌ Premium enterprise |
| **Logs / búsqueda** | ✅ Elasticsearch es el estándar de la industria | ⚠️ Logs como complemento |
| **Ideal para** | Clientes que quieren unificar SIEM + observabilidad, o migrar de ELK open source | Clientes enterprise con APM como prioridad y presupuesto para la mejor solución |

#### Criterios de selección por contexto
- **Cliente con ELK/Elasticsearch existente** → Elastic (upsell natural, menor fricción)
- **Cliente quiere unificar SIEM + observabilidad en un solo stack** → Elastic
- **Cliente enterprise con APM complejo y muchas aplicaciones** → Dynatrace (auto-instrumentation)
- **Cliente financiero con portal transaccional crítico y SLAs de experiencia de usuario** → Dynatrace DEM
- **Cliente busca alternativa a Splunk por costo** → Elastic
- **Cliente quiere detección de vulnerabilidades en runtime (producción)** → Dynatrace Security

---

### Cross-sell / Upsell Observabilidad + AppSec

| Si el cliente tiene... | Proponer... |
|----------------------|-------------|
| Dynatrace APM sin seguridad | → Dynatrace Security (RASP) + AppSec Cybolt (SAST/DAST) |
| Elastic logs sin SIEM | → Elastic Security como SIEM sobre el mismo stack |
| AppSec (SAST/DAST) sin observabilidad en prod | → Dynatrace o Elastic para cerrar el ciclo hasta producción |
| Elastic Observability sin SOC | → SOC Cybolt con Elastic Security SIEM integrado |
| Dynatrace sin RUM/Synthetics | → Dynatrace DEM para experiencia digital |
| Cualquier solución de observabilidad | → AppSec Cybolt (SAST/DAST) para cerrar el ciclo completo Dev→Prod |

