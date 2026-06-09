## Incident Response & Beacon Lab

### Definición
Servicios de respuesta a incidentes de ciberseguridad y laboratorio de investigación de amenazas. Combina capacidad reactiva (atención de incidentes críticos) con capacidad proactiva (investigación, threat intelligence, simulacros). El equipo multidisciplinario integra **Beacon Lab** (investigación) y **SOC** (operación).

### Contexto de mercado (México)
- 80,000 millones de intentos de ciberataques
- 3er país más atacado a nivel mundial, 1er país más atacado de LATAM
- USD $3.7 millones: pérdida promedio de un ataque (fuentes: Fortinet, IBM, PwC, ICEX)

### Modelos de servicio

| Modelo | Descripción |
|--------|-------------|
| **Bajo demanda** | Por evento, bolsa de horas, actividades en sitio y remoto |
| **Programa de Respuesta a Incidentes** | Duración mínima 12 meses, proactivo y práctico, incluye respuesta a incidentes |

### Programa de Respuesta a Incidentes (servicio integral)

El programa incluye 3 componentes principales:

#### 1. Procesos y procedimientos
- Generación y actualización documental
- Identificación de stakeholders
- Playbooks & Checklists simplificados y accionables
- Acciones de: Control, Comunicación, Información al cliente, Infraestructura, Análisis, Contención y Forense
- Estados de seguimiento: Pendiente → Iniciado → Realizado
- Ajustado a **NIST SP 800-61**

#### 2. Cyberdrill (simulacro de ciberataque)
- Ejecución de ciberataque controlado (ej: despliegue de ransomware simulado)
- Activación del plan de respuesta a incidentes
- Generación de consciencia y aumento de niveles de madurez
- Identificación de áreas de oportunidad y lecciones aprendidas
- **Frecuencia**: 2 eventos al año
- **Duración estimada**: 1 día por ejercicio

**Metodología Cyberdrill**: Proceso estructurado de gestión del ejercicio con fases de planeación, ejecución y lecciones aprendidas.

#### 3. Incident Response (respuesta a evento crítico)
- Atención a un evento crítico al año durante la vigencia del servicio
- Equipo multidisciplinario: Beacon Lab & SOC
- Identificación proactiva de superficie de ataque

---

### Beacon Lab

#### Objetivos
- Aportar un espacio de investigación y observación de amenazas para un internet más seguro
- Generar un medio de vinculación con el exterior para atender eventos de ciberseguridad
- Integrar mecanismos de colaboración con otros centros de investigación en el mundo
- Desarrollar práctica, herramientas, procesos y personas especializadas en investigación y respuesta a amenazas globales

#### Alcance
| Capacidad | Descripción |
|-----------|-------------|
| Respuesta a incidentes | Atención a incidentes globales de ciberseguridad |
| Análisis de artefactos | Análisis forense de malware y artefactos maliciosos |
| Compartición de IoCs | Espacio para compartir indicadores de compromiso con otros CSIRTs/CERTs |
| Boletines técnicos | Publicación de boletines técnicos y tendencias |
| Threat tracking | Seguimiento a bandas de cibercriminales |
| Dark web monitoring | Monitoreo de deep web y dark web en búsqueda de campañas dirigidas a clientes Cybolt o de alta relevancia en América |
| Desarrollo de talento | Espacio de formación y capacitación |
| Concientización | Espacio para la concientización de ciberseguridad |

#### Fuentes de inteligencia
Alertas y tendencias → Internet + SOC Cybolt + Fuentes abiertas bajo superficie → Procesamiento y análisis contextual → Comunidad en general

#### Plataformas de Beacon Lab (recursos para la comunidad)

| Plataforma | URL | Descripción |
|------------|-----|-------------|
| **MISP** | misp.beaconlab.mx | Plataforma de intercambio de información de amenazas en tiempo real. Permite compartir y colaborar sobre amenazas, facilitando detección y mitigación |
| **OpenCTI** | observatorio.beaconlab.mx | Plataforma de inteligencia de amenazas basada en comunidad para agregación, correlación, análisis y gestión de información de amenazas |

**Valor agregado de las plataformas**:
- Acceso a red global de expertos en ciberseguridad
- Identificación temprana de amenazas y medidas proactivas
- Beacon Lab proporciona información real anonimizada de todos los incidentes que atiende (IoC/IoA)
- Interconexión disponible para otros CSIRTs conforme acuerdos establecidos

#### Equipo IR
- **Gabriela Ratti** — Coordinadora de Respuesta a Incidentes (CC ISC2, MITRE ATT&CK Defender, API Security Engineer, Cybersecurity Leadership MIT, experiencia en reverse engineering con Kaspersky/HexRay)
- **Raúl Benitez** — IR Specialist (CSA EC-Council, MSc Computer Security Czech Technical University Prague, Python/Ruby/Django, experiencia en Docker/AWS/Burp Suite)

### Discovery questions para oportunidades de Incident Response

1. ¿Tiene un plan de respuesta a incidentes documentado? ¿Basado en qué framework (NIST, SANS)?
2. ¿Ha sufrido un incidente de ciberseguridad en los últimos 12 meses?
3. ¿Realiza simulacros de ciberataque (cyberdrills) periódicamente?
4. ¿Tiene equipo interno de respuesta a incidentes o depende de terceros?
5. ¿Cuenta con capacidad de análisis forense digital?
6. ¿Tiene fuentes de threat intelligence integradas a su operación de seguridad?
7. ¿Monitorea dark web/deep web en busca de amenazas dirigidas?
8. ¿Comparte indicadores de compromiso con algún CSIRT/CERT?
9. ¿Qué tan rápido puede activar su plan de respuesta hoy? ¿Tiene SLA definido?
10. ¿Requiere un servicio continuo (programa 12 meses) o atención puntual (bajo demanda)?

### Vendor locks en IR — Señales en RFPs

| Señal en el RFP | Apunta a | Acción |
|-----------------|----------|--------|
| "NIST SP 800-61" | Framework estándar de IR | Cybolt alineado nativamente |
| "Simulacros de ciberataque" / "Cyberdrill" | Programa proactivo | Diferenciador Cybolt — incluido en programa IR |
| "Miembro de FIRST" | CSIRT acreditado | Cybolt es miembro de FIRST |
| "Compartición de IoCs con CSIRT" | Capacidad de threat sharing | Beacon Lab con MISP y OpenCTI |
| "Análisis forense digital" | Capacidad técnica avanzada | Beacon Lab |
| "Monitoreo de dark web" | Threat intelligence proactiva | Beacon Lab — alcance incluido |

### IR como generador de cross-sell

| Hallazgo durante IR | Oportunidad para otra BU |
|---------------------|--------------------------|
| Falta de plan de continuidad post-incidente | → Business Resilience (BCP/DRP) |
| Vulnerabilidades explotadas en aplicaciones | → AppSec (SAST/DAST) |
| Falta de marco normativo de seguridad | → GRC (gobierno, ISO 27001) |
| Gaps en monitoreo/detección | → Managed Security (SOC) |
| Compromiso de identidades/credenciales | → Identity & Access Management |
| Ransomware sin backup air-gapped | → Business Resilience (BARI) |

---
