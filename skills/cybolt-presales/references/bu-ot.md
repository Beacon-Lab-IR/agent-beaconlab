## Business Unit: OT Security

### Definición
Servicios de ciberseguridad para entornos de Tecnología Operacional (OT) — hardware y software que monitorea o controla dispositivos físicos, procesos y eventos industriales. El ecosistema incluye PLCs, SCADA, HMIs, sensores industriales, DCS, RTUs, CNC e IIoT. A diferencia de IT donde la prioridad es Confidencialidad (CIA), en OT la prioridad es **Disponibilidad y Seguridad Física** (Safety).

### Propuesta de valor diferenciadora
- **"Do No Harm" Approach**: monitoreo pasivo — "escuchamos" sin tocar los sistemas sensibles. Los equipos de OT temen que herramientas de seguridad causen fallas en sistemas legacy
- **Primera implementación de ciberseguridad OT en México-LATAM** (2017)
- **Emerging Partner of the Year Claroty 2024**
- **Premio Nacional de Exportación** en servicios de ciberseguridad (2022)
- **MOU con KPMG Korea** para servicios de consultoría OT
- **SOC multilingüe** (Chicago, Memphis, CDMX) que monitorea IT + OT en una sola vista

### Costo promedio de ciberataques en OT (2024-2025)

| Industria | Costo promedio por ataque |
|-----------|--------------------------|
| Energía (petróleo, gas, electricidad) | $5.0M – $10.5M USD |
| Manufactura | $1.5M – $4.5M USD |
| Utilities (agua) | $850K – $2.2M USD |
| Transporte (ferrocarril, puertos) | $2.0M – $6.0M USD |
| Químicos / Farmacéutica | $3.0M – $7.0M USD |

### Industrias atendidas
- **Manufactura**: Acero/aluminio, cemento, alimentos y bebidas, bienes de consumo, electrodomésticos, automotriz
- **Energía**: Petróleo y gas, generación y distribución de energía, energías renovables y limpias
- **Transporte**: Aviación, ferrocarriles, puertos de carga, logística
- **Retail y distribución**: Centros de distribución, almacenes automatizados
- **Healthcare**: Hospitales, farmacéutica
- **Otros**: Minería, químicos, utilities de agua y electricidad

### Dónde hay redes OT (oportunidades no obvias)
Fábricas, parques temáticos, almacenes (tipo Amazon), aeropuertos (sistemas de equipaje), barcos (cruceros), edificios (elevadores, HVAC), prisiones, hospitales, smart cities, centros de distribución

### Frameworks y estándares de referencia
- **IEC 62443**: Requisitos de ciberseguridad para IACS (Industrial Automation and Control Systems)
- **SANS ICS410**: Formación en seguridad ICS/SCADA
- **Modelo Purdue**: Arquitectura de referencia para segmentación de redes industriales
- **SANS Five ICS Critical Controls**: Cinco controles críticos de ciberseguridad para ICS
- **NIST SP 800-82**: Guía de seguridad para ICS
- **Cumplimiento automotriz**: IATF 16949, TISAX, ISO 27001, GM-SQ

### Servicios OT de Cybolt

#### Consultoría OT
| Servicio | Descripción |
|----------|-------------|
| Security Posture Assessment | Evaluación de postura de seguridad basada en IEC 62443 |
| Bridging IT-OT | Integración segura entre redes IT y OT |
| OT/ICS Incident Response Planning | Planificación de respuesta a incidentes para entornos industriales |
| OT/ICS Vulnerability Management | Gestión de vulnerabilidades en sistemas de control industrial |

#### Soluciones tecnológicas OT

| Solución | Descripción | Tecnologías |
|----------|-------------|-------------|
| **Continuous Monitoring & Threat Detection** | Asset discovery, vulnerability management, detección continua de amenazas, network monitoring, analytics | Claroty (sensor + agente) |
| **Patching & Password Management** | Detección de credenciales default en PLCs, rotación de contraseñas, actualización de firmware, escaneo seguro sin fuerza bruta | Phosphorus |
| **Segmentation & Infrastructure** | Switches industriales, firewalls/IPS OT, WiFi industrial | TXOne |
| **Crypto & Micro Segmentation** | Aislamiento de activos OT críticos en Layer 2, compatible con Profibus/GOOSE/BACNet/Modbus, defense-in-depth sin rediseñar red | Opscura |
| **OT Network & Endpoint Protection** | IPS industrial, virtual patching, protección de assets legacy (Windows sin parches), USB scanning portable, endpoint protection | TXOne (Edge IPS, Stellar) |
| **Secure Remote Access (SRA)** | Políticas granulares por usuario/activo, MFA, aprobación manual de conexiones, video "over the shoulder", botón rojo de terminación, grabación de sesiones | Claroty SRA |
| **OT Operational Continuity** | Clonación completa de disco (boot from device), air gap patentado (disco se desconecta electrónicamente), inmutable a hackers, canary files para detección de ransomware | — |

#### SOC as a Service (IT + OT)
Monitoreo unificado de entornos IT y OT desde SOCs en Chicago, Memphis y CDMX.

**Diferenciadores del SOC Cybolt vs competencia**:
- **Toma acción** — no solo genera tickets/alertas, responde en tiempo real
- **Consultivo** — reuniones mensuales para discutir estrategia y postura
- **Colaborativo** — comunicación diaria por Slack/Teams ("right down the hall")
- **Comprensivo** — cubre 6 áreas: infraestructura IT, cloud, endpoints, email/colaboración, OT/SCADA, identidad y acceso
- **Sin contratos de largo plazo forzados**
- **Capacidad de Incident Response integrada**

### Playbook de venta OT

#### Identificar al comprador
No es solo el CISO — buscar al **VP de Operaciones** o **Chief Manufacturing Officer**. El CISO firma el cheque, pero el Plant Manager es dueño del riesgo.

#### Hablar el idioma correcto
- ❌ Evitar: "Data Breach", "Confidencialidad"
- ✅ Usar: "Unplanned Downtime", "Operational Resilience", "Safety Integrity Levels (SIL)"

#### Discovery questions para oportunidades OT

1. "¿Cuál es el costo por hora de downtime en su línea de producción principal?"
2. "¿Tienen un inventario claro de cada dispositivo conectado en el piso de planta?"
3. "¿Cómo acceden sus proveedores terceros remotamente a sus controladores industriales?"
4. ¿Tienen sus redes OT segmentadas de IT? ¿Con qué tecnología?
5. ¿Han realizado un assessment de seguridad OT basado en IEC 62443?
6. ¿Tienen visibilidad de las vulnerabilidades en sus PLCs y sistemas SCADA?
7. ¿Cuentan con capacidad de respuesta a incidentes específica para OT?
8. ¿Usan acceso remoto para mantenimiento de equipos industriales? ¿Está asegurado?
9. ¿Tienen sistemas legacy (Windows XP/7) en operación sin posibilidad de parchar?
10. ¿Qué estándares de cumplimiento aplican a su industria (IEC 62443, TISAX, CISA)?

### Vendor locks en OT — Señales en RFPs

| Señal en el RFP | Apunta a | Acción |
|-----------------|----------|--------|
| "Claroty" o "Medigate" | Claroty | Cybolt es partner — ventaja competitiva (Emerging Partner of the Year 2024) |
| "TXOne" o "Edge IPS" / "Stellar" | TXOne Networks | Cybolt es partner |
| "Opscura" o "crypto segmentation" | Opscura | Cybolt es partner |
| "Phosphorus" o "credential management PLC" | Phosphorus | Cybolt es partner |
| "Nozomi Networks" | Competidor directo de Claroty | Evaluar si los requerimientos funcionales se cubren con Claroty |
| "Fortinet OT" / "FortiGate Rugged" | Fortinet en espacio OT | Evaluar cobertura con stack Cybolt (TXOne + Claroty) |
| "Dragos" | Competidor en threat intelligence OT | Posicionar Claroty + Beacon Lab |

### OT como generador de cross-sell

| Hallazgo en OT | Oportunidad para otra BU |
|----------------|--------------------------|
| Falta de BCP/DRP para planta | → Business Resilience |
| Sin marco normativo de seguridad | → GRC (ISO 27001, IEC 62443 governance) |
| Necesidad de gestión de identidades para acceso remoto | → Identity & Access Management (CyberArk) |
| Incidente de ransomware en planta | → IR & Beacon Lab |
| Aplicaciones industriales vulnerables | → AppSec |
| Necesidad de monitoreo continuo IT+OT | → Managed Security (SOC) |

---
