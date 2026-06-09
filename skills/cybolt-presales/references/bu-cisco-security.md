## BU Cisco Ciberseguridad

Cybolt es partner directo Cisco en ciberseguridad. Esta referencia cubre el portafolio completo de Cisco Security actualizado a marzo 2026, incluyendo nomenclatura vigente, modelo comercial y posicionamiento competitivo.

> **Relación con otras BUs**: La sección de Cisco Security en `bu-infrastructure.md` cubre el portafolio Cisco a nivel general junto con otros fabricantes. Este archivo profundiza específicamente en el portafolio Cisco Security con detalle de SKUs, sizing, licenciamiento y arquitectura actualizada.

---

### Arquitectura Cisco Security — Vista general

```
┌──────────────────────────────────────────────────────────────────┐
│                    SECURITY CLOUD CONTROL (SCC)                   │
│         Gestión unificada SaaS — reemplaza CDO                    │
│    ┌──────────┐  ┌──────────┐  ┌───────────────┐                  │
│    │  cdFMC   │  │ Secure   │  │  Multicloud   │                  │
│    │ (cloud)  │  │ Access   │  │  Defense       │                  │
│    └──────────┘  └──────────┘  └───────────────┘                  │
├──────────────────────────────────────────────────────────────────┤
│                         PRODUCTOS                                 │
│                                                                   │
│  PERÍMETRO          ACCESO           ENDPOINT       OPERACIONES   │
│  ┌────────────┐   ┌────────────┐   ┌──────────┐  ┌──────────┐   │
│  │ Secure FW  │   │ ISE (NAC)  │   │ Secure   │  │ XDR +    │   │
│  │ 1100/1200  │   │ Duo (MFA)  │   │ Endpoint │  │ Splunk   │   │
│  │ 3100/4200  │   │ Secure     │   │ (EDR)    │  │ ES/SOAR  │   │
│  │ 9300       │   │ Access     │   │          │  │          │   │
│  │            │   │ (SSE/ZTNA) │   │          │  │          │   │
│  └────────────┘   │ Secure     │   └──────────┘  └──────────┘   │
│  ┌────────────┐   │ Client 5.x │   ┌──────────┐  ┌──────────┐   │
│  │ Secure     │   └────────────┘   │ Secure   │  │ Secure   │   │
│  │ Email +    │                     │ Network  │  │ Workload │   │
│  │ ETD        │   ┌────────────┐   │ Analytics│  │ Hyper-   │   │
│  └────────────┘   │ Talos TI   │   └──────────┘  │ shield   │   │
│                    └────────────┘                  └──────────┘   │
└──────────────────────────────────────────────────────────────────┘
```

---

### Portafolio detallado

#### 1. Secure Firewall (NGFW) — Familias vigentes

| Familia | Throughput FW+AVC | TLS Decrypt | Caso de uso | Nota |
|---------|------------------|-------------|-------------|------|
| **1100** (FPR1120/1140/1150) | 1.5 – 3 Gbps | 0.75 – 1.5 Gbps | Sucursales | Modelo actual, amplia base instalada |
| **1200** (FPR1210/1220/1240) | 6 – 22 Gbps | 2 – 7 Gbps | Sucursal grande / campus pequeño | **Nueva generación**, SD-WAN integrado |
| **3100** (FPR3105–3140) | 10 – 45 Gbps | 3.2 – 11.5 Gbps | Campus / DC mediano | Modelo más frecuente en RFPs MX |
| **4200** (FPR4215–4245) | 80 – 120 Gbps | 25 – 40 Gbps | Enterprise / SP | Para throughput >45 Gbps |
| **9300** (FPR-9300) | >1 Tbps (modular) | Multi-blade | SP / Carrier / Enterprise muy grande | Chasis modular, solo si >140 Gbps |

**Software**: FTD (Firewall Threat Defense) versiones 7.x / 10.x.
**EoL**: Firepower 2100, 4100, ASA 5500-X — NO proponer.

> **Nota de ventas**: La serie 3100 es la más frecuente en RFPs mexicanos de gobierno y enterprise. La 1200 es nueva y puede ser diferenciador vs. competencia que aún propone solo la 1100.

#### 2. Gestión — Security Cloud Control (SCC)

| Componente | Descripción | SKU/Licencia |
|-----------|-------------|-------------|
| **Security Cloud Control** | Portal SaaS unificado. Gestiona Secure Firewall, Secure Access, Multicloud Defense | FWM-BASE (1 por FW; par HA = 1 licencia) |
| **cdFMC** (cloud-delivered FMC) | Gestión cloud de firewalls — componente dentro de SCC | Incluido en SCC |
| **FMC on-prem** (1700/2700/4700) | Gestión on-premise. Solo si el cliente no acepta nube | FMC1700 (≤300), FMC2700 (≤750), FMC4700 (≤2000) |

**IMPORTANTE**: NO usar "CDO" — el nombre actual es **Security Cloud Control (SCC)**.
Para nuevas propuestas, preferir SCC (SaaS) sobre FMC on-prem.

#### 3. ISE (Identity Services Engine) — NAC

| Appliance | Endpoints | Uso |
|-----------|----------|-----|
| SNS-3815-K9 | ≤25,000 | Mayoría de deployments |
| SNS-3855-K9 | ≤50,000 | Campus grande |
| SNS-3895-K9 | ≤100,000 | Enterprise |

**Licenciamiento ISE 3.x** (los únicos tiers vigentes):
| Tier | Incluye | Cuándo |
|------|---------|--------|
| **Essentials** | 802.1X, MAB, guest, BYOD básico | NAC básico |
| **Advantage** | + pxGrid, TrustSec, AI Analytics, profiling | Segmentación + analytics |
| **Premier** | + TACACS+ Device Admin, PassiveID, Compliance | NAC completo + admin de equipos |

> **Nota de ventas**: ISE es muy frecuente en RFPs de gobierno y banca mexicana. Cybolt tiene experiencia comprobada en deployments de ISE para control de acceso corporativo. Siempre incluir appliance físico o VM — ISE no es solo licencia.

#### 4. Secure Access (SSE) — Reemplaza Umbrella standalone

| Componente | Descripción |
|-----------|-------------|
| **SWG** | Filtrado web con TLS inspection en nube |
| **CASB** | Control de aplicaciones SaaS |
| **DLP cloud** | Prevención de fuga de información |
| **ZTNA** | Zero Trust Network Access — reemplazo moderno de VPN |
| **DNS Security** | Lo que era Umbrella DNS |
| **RBI** | Remote Browser Isolation |

**IMPORTANTE**: Umbrella standalone SKUs terminan **Sep 2026**. Para nuevas oportunidades usar Secure Access.
**SKUs**: SEC-ACCESS-[ESS/ADV/PRM]-[user count]

> **Nota de ventas**: Secure Access es el sucesor de Umbrella y es más completo (SSE). Posicionar como la evolución natural para clientes que ya tienen Umbrella.

#### 5. Secure Client 5.x (antes AnyConnect — RETIRADO)

- VPN (IPsec + SSL), ZTNA, posture check, roaming DNS
- Se integra con Secure Access para ZTNA
- **NO usar "AnyConnect"** — nombre retirado

#### 6. Duo (MFA + Zero Trust Access)

| Tier | Incluye |
|------|---------|
| DUO-ESS | MFA básico, SSO |
| DUO-ADV | + Device Trust, Adaptive Auth |
| DUO-PRM | + Risk-based Auth, Remembered Devices, full ZTA |

> **Nota de ventas**: Duo es la entrada más fácil a Zero Trust. Muy popular en gobierno y enterprise para cumplimiento de MFA.

#### 7. Secure Endpoint + XDR

| Tier | SKU Pattern | Incluye |
|------|------------|---------|
| Essentials | CSEP-EML-xxx | EPP + EDR básico |
| Advantage | CSEP-ADV-xxx | + Threat hunting, sandboxing |
| Premier | CSEP-PRM-xxx | + XDR completo, Triage Agent (AI), Splunk ES sync |

- **XDR** se integra bidireccionalmente con **Splunk ES** (sync de alertas y contexto)
- **Triage Agent**: investigación automatizada con AI — diferenciador vs. competencia
- **Foundation AI**: modelos de ML avanzados para detección de amenazas

> **Nota de ventas**: Secure Endpoint Premier con XDR es la respuesta de Cisco a CrowdStrike y SentinelOne. La integración con Splunk ES es un diferenciador único post-adquisición.

#### 8. Splunk ES + SOAR (parte del portafolio Cisco)

| Producto | Descripción |
|---------|-------------|
| **Splunk Enterprise Security (ES)** | SIEM + analytics avanzado |
| **Splunk SOAR** | Orquestación y respuesta automatizada |
| **Integración XDR** | Bidireccional con Cisco XDR |

**IMPORTANTE**: Splunk ES y Cisco XDR son **complementarios**, NO competidores. Proponer juntos.

> **Nota de ventas**: Con la adquisición de Splunk (2024), Cisco tiene ahora SIEM + XDR integrado. Esto es un diferenciador fuerte vs. competidores que necesitan integrar SIEM de terceros.

#### 9. Secure Email + Email Threat Defense

| Producto | Tipo | Descripción |
|---------|------|-------------|
| **Secure Email Gateway** | On-prem / cloud | Anti-spam, anti-phishing, sandboxing. Hardware: C195/C395/C695. Cloud: CES-ESS/CES-ADV |
| **Secure Email Threat Defense** | Cloud-native (API) | Detección de BEC, phishing avanzado. NO requiere cambio de MX. Se conecta directo a M365/Google Workspace |

> **Nota de ventas**: Email Threat Defense es la respuesta de Cisco a Proofpoint TAP y Abnormal Security. Cloud-native, sin cambio de MX records — deploy en minutos.

#### 10. Secure Network Analytics (antes Stealthwatch)

- NDR basado en NetFlow/IPFIX — detección de amenazas sin agentes
- Integración con ISE y XDR
- Ideal para visibilidad de red interna en clientes con infraestructura Cisco

#### 11. Productos avanzados (proponer solo si el RFP lo requiere)

| Producto | Descripción | Cuándo proponer |
|---------|-------------|----------------|
| **Hypershield** | Segmentación autónoma basada en eBPF para workloads DC/cloud | Microsegmentación de workloads, AI-driven security |
| **Multicloud Defense** | FWaaS para workloads en AWS/Azure/GCP | Seguridad multi-cloud |
| **Secure Workload** (ex-Tetration) | Microsegmentación y compliance de workloads | Microsegmentación a nivel de app/workload |
| **Cisco AI Defense** | Seguridad para apps que usan/exponen AI/LLM | Protección de modelos AI, AI governance |

---

### Security Suites — Modelo comercial (bundles)

Para RFPs que piden múltiples categorías de seguridad, evaluar suites con descuento bundle:

| Suite | Incluye | Tiers |
|-------|---------|-------|
| **User Protection** | Secure Client + Duo + Secure Access + Secure Endpoint | Essentials / Advantage / Premier |
| **Cloud Protection** | Multicloud Defense + Secure Workload + Hypershield | Essentials / Advantage / Premier |
| **Breach Protection** | XDR + Splunk ES + Talos IR retainer | Essentials / Advantage / Premier |

> **Regla**: Si el RFP pide 3+ categorías de seguridad, evaluar si una Suite es más competitiva (descuento bundle) que productos individuales.

---

### Posicionamiento competitivo de Cisco Security

| Categoría | Cisco | Competidor principal | Ventaja Cisco | Ventaja competidor |
|-----------|-------|---------------------|---------------|-------------------|
| NGFW | Secure Firewall 3100/4200 | Palo Alto PA-Series, Fortinet FortiGate | Integración con ISE/NAC, ecosistema unificado | Palo Alto: mejor en ML inline. Fortinet: mejor precio/Gbps |
| Endpoint/XDR | Secure Endpoint + XDR | CrowdStrike Falcon, SentinelOne | Integración con Splunk ES, Talos TI | CrowdStrike: líder en EDR puro. SentinelOne: AI autónomo |
| SIEM | Splunk ES | Microsoft Sentinel, QRadar, Exabeam | Splunk ecosystem + XDR nativo | Sentinel: más barato en Azure. QRadar: base instalada banca MX |
| SSE/SASE | Secure Access | Zscaler, Palo Alto Prisma Access | Integración con firewall on-prem | Zscaler: cloud-native puro, mayor madurez SSE |
| NAC | ISE | Aruba ClearPass, Forescout | Integración nativa con Catalyst/Meraki | ClearPass: más simple de operar |
| MFA | Duo | Okta, Microsoft Entra | Simplicidad, posture check | Okta: más fuerte en IAM cloud-first |
| Email | Secure Email + ETD | Proofpoint, Mimecast, Abnormal | ETD cloud-native sin cambio MX | Proofpoint: líder de mercado |

---

### Herramienta de análisis automatizado Cisco

Cybolt cuenta con una herramienta agentic (basada en LLM) que analiza RFPs y genera recomendaciones de productos Cisco automáticamente. Ver `references/cisco-agentic-tool.md` para detalles.

La herramienta incluye un **especialista de seguridad** que:
- Clasifica requerimientos de seguridad del RFP
- Propone SKUs con right-sizing basado en throughput
- Cruza requerimientos contra datasheets
- Genera BOM preliminar con licenciamiento

---

### Integración con SOC Cybolt

Todos los productos Cisco Security se operan desde el SOC de Cybolt 24x7:

| Producto Cisco | Capacidad SOC Cybolt |
|---------------|---------------------|
| Secure Firewall | Gestión de políticas, monitoreo IPS/malware, respuesta a bloqueos |
| ISE | Gestión de políticas NAC, respuesta a accesos anómalos |
| Secure Access | Gestión de políticas SSE, monitoreo DNS/SWG |
| Duo | Gestión MFA, respuesta a autenticaciones anómalas |
| Secure Endpoint + XDR | Monitoreo EDR 24x7, triage con Triage Agent, threat hunting |
| Splunk ES | Correlación de eventos, reglas custom, reportes ejecutivos |
| Secure Email | Gestión anti-spam/phishing, análisis de amenazas email |
| Secure Network Analytics | Monitoreo de anomalías NetFlow, correlación con SIEM |

---

### Calificación de oportunidades Cisco Security

#### Señales positivas (GO)
- RFP pide NGFW con IPS + SSL inspection → Secure Firewall
- RFP pide NAC/802.1X/control de acceso a red → ISE
- RFP pide MFA/Zero Trust → Duo + Secure Access
- Cliente con infraestructura Cisco existente (switches, APs) → consolidación natural
- RFP pide SIEM + XDR integrado → Splunk ES + Cisco XDR
- Cliente migrando de Umbrella → Secure Access es path natural

#### Señales de riesgo (evaluar)
- RFP pide Fortinet/Check Point específicamente → Cisco es alternativa pero puede haber vendor lock
- Cliente con Splunk existente → Ventaja post-adquisición, pero evaluar migración
- RFP pide SASE puro cloud → Zscaler puede ser más maduro que Secure Access

#### Errores a evitar en propuestas
1. NO usar "AnyConnect" → **Secure Client 5.x**
2. NO usar "CDO" → **Security Cloud Control**
3. NO proponer Umbrella standalone → **Secure Access** (Umbrella SKUs terminan Sep 2026)
4. NO proponer Firepower 2100/4100, ASA 5500-X → **EoL**
5. NO proponer ISE sin appliance/VM → ISE necesita hardware
6. NO proponer Splunk como alternativa a XDR → son **complementarios**
7. NO usar ISE-PL-K9, ISE-BASE, ISE-APEX → **obsoletos**, usar ESS/ADV/PRM

---

### Cross-sell / Upsell natural

| Si el cliente tiene... | Proponer... |
|----------------------|-------------|
| Secure Firewall sin gestión cloud | → Security Cloud Control (SCC) |
| Umbrella | → Migración a Secure Access (SSE completo) |
| ISE sin segmentación | → ISE Advantage (TrustSec + AI Analytics) |
| Secure Endpoint sin XDR | → Upgrade a Premier (XDR + Splunk ES) |
| Duo Essentials | → Duo Advantage/Premier (adaptive auth + device trust) |
| Infraestructura Cisco sin seguridad | → Security Suite (User Protection) como paquete |
| XDR sin SIEM | → Splunk ES (integración bidireccional nativa) |
| Múltiples productos Cisco Security | → Security Suite bundle (descuento) |
| AnyConnect legacy | → Migración a Secure Client 5.x + Secure Access |
