## BU Infrastructure Security

Esta BU cubre la capa de seguridad perimetral, endpoint, XDR y SIEM. El servicio siempre tiene una componente de operación desde el SOC de Cybolt (Metepec / Memphis / Chicago) en esquema 24x7, lo que convierte la tecnología en un servicio administrado completo.

---

### Modelo de servicio

```
┌─────────────────────────────────────────────────────────────┐
│                        CLIENTE                               │
├─────────────────────────────────────────────────────────────┤
│  SOC CYBOLT 24x7 (Metepec / Memphis / Chicago)              │
│  • Monitoreo y correlación de alertas                        │
│  • Triage, investigación y respuesta a incidentes            │
│  • Gestión de políticas y actualizaciones                    │
│  • Threat hunting proactivo                                  │
│  • Reportes mensuales y ejecutivos                           │
│  • Cumplimiento PCI DSS / ISO 27001 / SOC 2                  │
├─────────────────────────────────────────────────────────────┤
│  CAPA DE TECNOLOGÍA (ver portafolio abajo)                   │
│  Endpoint/XDR + SIEM/SOAR + Firewall/Red                    │
└─────────────────────────────────────────────────────────────┘
```

---

### Portafolio — Endpoint Security / EDR / XDR

#### Broadcom — SOLO división de ciberseguridad (Symantec + Carbon Black)

> **⚠️ IMPORTANTE**: Broadcom divide su portafolio en dos grandes divisiones:
> 1. **Ciberseguridad (Symantec + Carbon Black)** → Cybolt SÍ es partner. Cotizamos, implementamos y operamos.
> 2. **Infraestructura/DC (VMware vSphere, vSAN, NSX, VCF, Workspace ONE, Tanzu, Aria)** → Cybolt **NO** es partner. No cotizamos ni administramos nada de la línea VMware/DC.
>
> Si un RFP pide productos VMware de data center, es un **GAP**. Solo podemos cubrir la capa de ciberseguridad sobre ambientes VMware (ej. Trend Micro Deep Security, Symantec para endpoints).

| Producto | Descripción | Cliente referencia |
|---------|-------------|-------------------|
| **Symantec Endpoint Security (SES)** | Endpoint protection + EDR para enterprise y banca legacy | Kapital |
| **Symantec XDR** | XDR nativo Broadcom con correlación cross-layer (endpoint, red, email, cloud) | Kapital |
| **Carbon Black Cloud** | EDR/XDR cloud-native (ex-VMware Carbon Black). Behavioral detection, threat hunting | Incluido en portafolio Broadcom Cyber |
| **Carbon Black App Control** | Application control / whitelisting para entornos críticos y OT-adjacent | Incluido en portafolio Broadcom Cyber |

> **Nota de ventas**: Broadcom adquirió Symantec Enterprise (2019) y VMware/Carbon Black (2023). El partnership Cybolt con Broadcom cubre **exclusivamente la suite de ciberseguridad** (Symantec + Carbon Black). Al proponer estos productos, posicionar como ecosistema Broadcom Cyber unificado. **NUNCA proponer productos VMware de infraestructura/DC** — no somos partner de esa división.

#### Trend Micro (partner directo)

| Producto | Descripción | Cliente referencia |
|---------|-------------|-------------------|
| **Trend Micro Vision One** | Plataforma XDR unificada: endpoint, servidor, red, email, cloud | Kapital |
| **Apex One** | Endpoint protection + EDR con detección conductual | Kapital |
| **Deep Security** | Seguridad para servidores físicos, virtuales y cloud (IDS/IPS, AV, integridad) | Frecuente en banca y gobierno con VMware |
| **Cloud One** | Suite de seguridad para workloads cloud (AWS, Azure, GCP) | Oportunidad cross-sell en clientes cloud |

> **Nota de ventas**: Trend Micro es muy fuerte en gobierno mexicano. Cuando un RFP pide Trend Micro específicamente, Cybolt puede responder directamente sin necesidad de alianza.

#### Palo Alto Networks — Cortex (partner directo)

| Producto | Descripción | Cliente referencia |
|---------|-------------|-------------------|
| **Cortex XDR** | XDR líder de mercado. Correlación de endpoint, red y cloud con IA | Alpura (cliente más grande de Cybolt en esta tecnología) |
| **Cortex XSOAR** | SOAR para automatización de respuesta a incidentes, playbooks | Integrable con SOC Cybolt |
| **Cortex XPANSE** | Attack Surface Management — descubrimiento de activos expuestos | Upsell natural en clientes con Cortex XDR |

> **Nota de ventas**: Alpura es la referencia más sólida de Cybolt para Cortex XDR. Siempre citar en propuestas donde se pida XDR enterprise de alto perfil.

#### SentinelOne (partner directo)

| Producto | Descripción | Notas |
|---------|-------------|-------|
| **SentinelOne Singularity XDR** | EDR/XDR con IA autónoma, rollback de ransomware, threat hunting | Incluido en portafolio Managed Security |
| **Singularity Cloud** | Protección de workloads cloud y contenedores | Cross-sell en clientes con infraestructura cloud |
| **Singularity Identity** | Protección de Active Directory e identidades | Complemento natural a IAM |

#### Microsoft Defender for Endpoint (soportado como servicio administrado)

| Producto | Descripción | Cliente referencia |
|---------|-------------|-------------------|
| **Microsoft Defender for Endpoint (MDE)** | EDR nativo Microsoft, integrado con M365 y Sentinel | Oxxo |
| **Microsoft Defender for Identity** | Protección de Active Directory / identidades híbridas | Complemento a MDE en clientes M365 |

> **Nota de ventas**: Oxxo es la referencia de Cybolt para soporte administrado de Microsoft Defender. Cuando el cliente ya tiene M365 E3/E5, MDE viene incluido — el valor de Cybolt es la operación SOC 24x7 encima del producto.

---

### Portafolio — Firewall / Seguridad Perimetral

| Producto | Fabricante | Notas |
|---------|-----------|-------|
| **NGFW (PA-Series, VM-Series, CN-Series)** | Palo Alto Networks | Partner directo. Frecuente en banca y enterprise |
| **Prisma Cloud** | Palo Alto Networks | CNAPP para seguridad cloud-native |
| **Zscaler Internet Access (ZIA)** | Zscaler | SWG + CASB cloud. Partner directo |
| **Zscaler Private Access (ZPA)** | Zscaler | ZTNA. Reemplaza VPN. Partner directo |
| **Imperva (WAF on-prem / DDoS)** | Imperva | WAF on-prem y protección de datos. Partner directo |
| **Proofpoint Email Security** | Proofpoint | Anti-phishing, BEC, protección email enterprise. Partner directo |

---

### Portafolio — Cisco Ciberseguridad (partner directo)

Cisco tiene un portafolio amplio de ciberseguridad. Ver detalle completo en `bu-cisco-security.md`.

Resumen de líneas principales:

| Producto | Descripción | Notas de venta |
|---------|-------------|---------------|
| **Secure Firewall (FTD)** | NGFW: 1100/1200/3100/4200/9300. IPS, malware, URL filtering | Proponer cuando el cliente tiene infraestructura Cisco |
| **Secure Endpoint + XDR** | EDR + XDR con Triage Agent (AI) + Splunk ES sync | Alternativa a CrowdStrike/SentinelOne |
| **Secure Access (SSE)** | SWG + CASB + DLP + ZTNA + DNS. Reemplaza Umbrella standalone | Sucesor de Umbrella — para nuevas oportunidades |
| **Splunk ES + SOAR** | SIEM + orquestación. Parte de Cisco post-adquisición 2024 | Complementario a XDR, proponer juntos |
| **ISE** | NAC — 802.1X, TrustSec, posture. Tiers: ESS/ADV/PRM | Frecuente en gobierno y banca MX |
| **Duo** | MFA + ZTNA. Tiers: ESS/ADV/PRM | Primer paso de Zero Trust |
| **Secure Client 5.x** | VPN + ZTNA + posture. Reemplaza AnyConnect (retirado) | NO usar "AnyConnect" |
| **Security Cloud Control** | Gestión SaaS unificada. Reemplaza CDO | NO usar "CDO" |
| **Secure Email + ETD** | Gateway + Email Threat Defense (cloud-native, API-based) | Compite con Proofpoint |
| **Secure Network Analytics** | NDR via NetFlow/IPFIX | Complemento a SIEM |
| **Talos** | Threat Intelligence integrada en todos los productos Cisco | Diferenciador en TI en tiempo real |

---

### Portafolio — Netscout (partner directo)

Netscout cubre visibilidad de red, rendimiento y ciberseguridad en un solo portafolio. Muy relevante para clientes con infraestructura crítica, data centers y servicios financieros.

| Producto | Descripción | Notas de venta |
|---------|-------------|---------------|
| **nGeniusONE** | Plataforma de gestión de rendimiento de red y aplicaciones (NPM/APM). Visibilidad end-to-end de tráfico en tiempo real | Frecuente en clientes con data centers propios y servicios transaccionales críticos. Bancos, telecomunicaciones |
| **Arbor DDoS (Sightline + TMS)** | Detección y mitigación de ataques DDoS volumétricos a nivel de red. Análisis de flujos BGP | Líder del mercado en protección DDoS para ISPs y grandes empresas. Competidor/complemento de Prolexic (Akamai) y Cloudflare Magic Transit |
| **Arbor Edge Defense (AED)** | Appliance de mitigación DDoS on-premises — primera línea de defensa antes del scrubbing center | Para clientes con DC propio que necesitan mitigación local antes de redirigir a nube |
| **nGenius Packet Flow** | Acceso a paquetes en tiempo real para análisis forense de red | Relevante para SOC — captura de evidencia en incidentes de red |
| **Omnis Network Security** | NDR — detección de amenazas avanzadas basada en análisis de paquetes (DPI) con ML | Posicionar como alternativa/complemento a Cisco Stealthwatch en entornos con Netscout |
| **Omnis Cyber Intelligence** | Inteligencia de amenazas de red con contexto de ataque en tiempo real | Cross-sell para clientes que ya tienen nGeniusONE |

> **Nota de ventas**: Netscout es especialmente fuerte en instituciones financieras y telecomunicaciones que necesitan visibilidad de red de alta fidelidad. nGeniusONE es el producto bandera — frecuente en RFPs de bancos y gobierno que piden NPM. Arbor es el estándar de la industria para mitigación DDoS volumétrica a nivel de red.

---



---

### Portafolio — SIEM / Log Management / SOAR

| Producto | Fabricante | Modelo | Notas |
|---------|-----------|--------|-------|
| **Microsoft Sentinel** | Microsoft | Partner directo | SIEM cloud-native en Azure. Fuerte en clientes M365 |
| **Stellar Cyber** | Stellar Cyber | Partner directo | Open XDR + SIEM. Muy competitivo en precio vs Splunk/QRadar |
| **Exabeam** | Exabeam | Partner directo | SIEM + UEBA con ML. Detección de amenazas internas |
| **LogRhythm** | LogRhythm | Via partner (mismo ecosistema Exabeam) | SIEM con UEBA. Proponer con soporte via partner |
| **IBM QRadar** | IBM | Via partner de negocios | Muy frecuente en banca MX. Cybolt puede proponer con partner habilitado para servicios y migraciones. Sin soporte directo aún |
| **Cortex XSOAR** | Palo Alto Networks | Partner directo | SOAR para automatización de playbooks en el SOC |

> **Nota QRadar**: Banorte, por ejemplo, usa QRadar. Cybolt puede participar en proyectos de integración, migración o gestión de QRadar apoyándose en el partner de negocios. No posicionar como soporte directo en propuestas formales sin aclarar el modelo.

---

### Integración con SOC Cybolt

Todos los productos de esta BU se operan desde el SOC de Cybolt en un modelo de servicio administrado. Las capacidades SOC relevantes por tecnología:

| Tecnología | Capacidad SOC Cybolt |
|-----------|---------------------|
| Cualquier XDR (Cortex, SentinelOne, Symantec, Trend Micro) | Monitoreo 24x7, triage de alertas, threat hunting, respuesta a incidentes, gestión de exclusiones y políticas |
| MDE / Microsoft Defender | Monitoreo desde Sentinel o directamente desde MDE portal, integración con M365 Defender |
| SIEM (Sentinel, Stellar Cyber, Exabeam) | Correlación de eventos, creación de reglas, análisis de comportamiento, reportes ejecutivos |
| NGFW / Zscaler / Cisco Secure Firewall | Gestión de políticas, análisis de tráfico, respuesta a bloqueos, reportes de seguridad perimetral |
| Cisco Secure Access / Duo / ISE | Gestión de políticas SSE/DNS, MFA y NAC; respuesta a accesos anómalos |
| Cisco Secure Network Analytics / XDR | Monitoreo de anomalías de red, correlación con Splunk ES, análisis de flujos |
| Netscout nGeniusONE | Análisis de rendimiento y disponibilidad de red; soporte en diagnóstico de incidentes de red |
| Netscout Arbor DDoS | Monitoreo de ataques volumétricos, coordinación de mitigación, reportes post-ataque |
| Imperva WAF | Gestión de reglas WAF, análisis de ataques web, tuning de políticas |
| Netscout Omnis Cyber Intelligence | Correlación de inteligencia de amenazas de red, análisis de ataques con contexto en tiempo real |

---

### Calificación de oportunidades

#### Señales positivas (GO)
- Cliente con endpoint sin gestión centralizada o con solución legacy (McAfee, Kaspersky, Symantec antiguo)
- Cliente que ya tiene licencias XDR pero sin operación SOC 24x7 — oportunidad de managed service
- RFP que pide EDR + SOC + SIEM como paquete integrado
- Cliente con incidente reciente (ransomware, breach) — urgencia de adopción XDR
- Cliente regulado (banco, aseguradora) que necesita evidencia de monitoreo 24x7 para auditorías

#### Discovery questions
1. ¿Qué solución de endpoint/EDR tienen actualmente? ¿Tienen consola centralizada?
2. ¿Tienen SOC interno o dependen de alertas automáticas?
3. ¿Han tenido incidentes de ransomware o malware en el último año?
4. ¿Qué SIEM usan? ¿Tienen reglas de correlación activas o solo recolección de logs?
5. ¿Cuántos endpoints tienen en scope? (para dimensionar licenciamiento)
6. ¿Tienen requerimiento de cumplimiento PCI, ISO 27001 o CNBV que exija monitoreo 24x7?
7. ¿Su solución actual cubre servidores, nube y endpoints móviles o solo workstations?

---

### Cross-sell / Upsell natural

| Si el cliente tiene... | Proponer... |
|----------------------|-------------|
| XDR sin SOC | → Managed XDR con SOC Cybolt 24x7 |
| SIEM sin reglas activas / sin analistas | → Managed SIEM con SOC Cybolt |
| Endpoint solo AV (sin EDR) | → Upgrade a XDR (SentinelOne, Cortex, Trend Micro Vision One) |
| MDE incluido en M365 sin explotar | → Activación + gestión SOC de MDE |
| XDR / EDR activo | → SOAR (Cortex XSOAR) para automatizar respuesta |
| Cortex XDR | → Cortex XPANSE (Attack Surface Management) |
| Cualquier tecnología de seguridad | → GRC (ISO 27001, PCI DSS) como capa de cumplimiento |
| Flota Apple (Mac, iPhone, iPad) | → Jamf Pro + Jamf Protect (cotización y renovación con servicios del fabricante) |

---

### Portafolio — Device Management (MDM Apple)

#### Jamf (partner — cotización y renovación, sin especialistas internos)

| Producto | Descripción | Modelo de servicio |
|---------|-------------|-------------------|
| **Jamf Pro** | MDM enterprise para macOS, iOS, iPadOS, tvOS. Aprovisionamiento zero-touch, gestión de apps, parches, inventario | Cybolt cotiza y renueva licenciamiento. Implementación y soporte avanzado con recursos del fabricante (Jamf Professional Services) |
| **Jamf Protect** | Endpoint security nativo para Mac: detección de malware, compliance, telemetría para SIEM | Mismo modelo: cotización Cybolt, servicios de implementación del fabricante |
| **Jamf Connect** | Identidad y autenticación para Mac sin necesidad de binding a AD. Integra con Okta, Azure AD, Google | Cotización Cybolt, implementación fabricante |

> **⚠️ Modelo de participación Jamf**: Cybolt es partner autorizado para **cotizar licenciamiento y renovaciones**. Sin embargo, **no tenemos especialistas internos en Jamf**. Toda implementación, migración y soporte avanzado se entrega con recursos del fabricante (Jamf Professional Services). En propuestas, ser transparente sobre este modelo y posicionar el valor de Cybolt como canal autorizado + integración con el ecosistema de seguridad (Jamf Protect → Splunk/Sentinel vía SOC Cybolt).
