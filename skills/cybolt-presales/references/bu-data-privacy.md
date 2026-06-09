## BU Data Privacy — DLP y Protección de Datos

Esta BU cubre soluciones de prevención de pérdida de datos (DLP), clasificación de información, protección de datos en reposo/tránsito/uso, y cumplimiento de privacidad. Es una de las áreas con mayor experiencia comprobada de Cybolt, especialmente en el ecosistema Broadcom/Symantec.

---

### Niveles de partnership y experiencia

| Fabricante | Nivel de partnership | Experiencia Cybolt | Certificaciones |
|-----------|---------------------|-------------------|----------------|
| **Broadcom / Symantec DLP** | Partner directo | ✅ **FUERTE Y COMPROBADA** — múltiples implementaciones enterprise | ✅ Sí |
| **Proofpoint DLP** | Partner directo | ✅ Experiencia en soporte y gestión | ✅ Sí |
| **Forcepoint** | Partner | ⚠️ Sin certificaciones propias, servicios limitados | ❌ No |
| **Fortra (ex-HelpSystems)** | Partner | ⚠️ Sin certificaciones propias, servicios limitados | ❌ No |

> **Regla de propuesta**: Para Broadcom/Symantec DLP y Proofpoint DLP → proponer con confianza, citar casos de éxito propios. Para Forcepoint y Fortra → solo proponer si el cliente lo exige explícitamente; posicionar como integración con el valor del servicio administrado Cybolt, no como expertise técnico profundo en el fabricante.

---

### Portafolio — Broadcom / Symantec DLP ✅ (experiencia fuerte)

| Producto | Descripción | Notas de venta |
|---------|-------------|---------------|
| **Symantec DLP (Data Loss Prevention)** | Suite completa DLP: Network Monitor, Network Prevent, Endpoint Prevent, Cloud Prevent | Referencia principal de Cybolt en DLP. Implementaciones en banca y enterprise MX |
| **Symantec DLP Cloud** | Extensión cloud del DLP on-prem — cubre SaaS (M365, Google Workspace, Box, Salesforce) | Cross-sell natural en clientes que ya tienen DLP on-prem |
| **Symantec Information Centric Encryption (ICE)** | Cifrado persistente de archivos basado en políticas de clasificación | Complemento a DLP para protección de datos en reposo |
| **Symantec CloudSOC (CASB)** | Cloud Access Security Broker — visibilidad y control de apps SaaS shadow IT | Frecuente en clientes con Microsoft 365 o Google Workspace |
| **Symantec Web Security Service (WSS)** | Proxy cloud con filtrado de contenido, CASB y prevención de malware | Reemplaza proxies on-prem legacy |
| **Symantec Email Security.cloud** | Protección de email en la nube — anti-spam, AV, DLP en email | Complemento a Proofpoint en clientes Broadcom-first |

> **Nota de ventas**: El DLP de Broadcom/Symantec es el más maduro del mercado para entornos enterprise complejos con múltiples canales (endpoint, red, email, cloud). Cybolt tiene experiencia real de implementación — usar como diferenciador fuerte vs competidores que solo revenden licencias.

---

### Portafolio — Proofpoint DLP ✅ (soporte y gestión)

| Producto | Descripción | Notas de venta |
|---------|-------------|---------------|
| **Proofpoint Enterprise DLP** | DLP integrado en la plataforma Proofpoint — cubre email, cloud y endpoint | Cybolt da soporte a clientes con esta solución. Vender como managed service |
| **Proofpoint Insider Threat Management (ITM)** | Detección de amenazas internas con contexto de comportamiento de usuario | Complemento natural al DLP — casos de uso de fraude interno |
| **Proofpoint Information Protection** | Clasificación de datos + DLP + cifrado en plataforma unificada | Posicionar en clientes que buscan consolidar herramientas |

> **Nota de ventas**: Proofpoint tiene doble relevancia en Cybolt — como solución de Email Security (ver bu-infrastructure.md) y como plataforma DLP. En clientes que ya usan Proofpoint para email, el upsell a DLP es natural y de bajo esfuerzo de venta.

---

### Portafolio — Forcepoint ⚠️ (sin certificaciones propias)

| Producto | Descripción | Restricción |
|---------|-------------|------------|
| **Forcepoint DLP** | DLP empresarial con detección de comportamiento de riesgo (Risk-Adaptive DLP) | Solo proponer si el cliente lo exige. No posicionar como expertise Cybolt |
| **Forcepoint ONE (SASE)** | Plataforma SASE con SWG, CASB y ZTNA integrados | Evaluar si Cloudflare SASE no es mejor opción primero |
| **Forcepoint Web Security** | Proxy web con filtrado de contenido y protección de malware | Competidor de Zscaler — proponer Zscaler primero |

> **Posicionamiento**: Si un RFP pide Forcepoint, Cybolt puede participar apoyándose en el servicio administrado (SOC, gestión de políticas) como valor diferenciador, pero siendo transparente de que no se tienen certificaciones técnicas propias en el fabricante. Evaluar si vale la pena o si se puede reorientar a Broadcom/Symantec como alternativa superior.

---

### Portafolio — Fortra ⚠️ (sin certificaciones propias)

| Producto | Descripción | Restricción |
|---------|-------------|------------|
| **Digital Guardian (DLP)** | DLP con visibilidad profunda de datos — fuerte en manufactura y propiedad intelectual | Solo proponer si el cliente lo exige |
| **Titus / Boldon James** | Clasificación y etiquetado de datos (labels) | Complemento a cualquier DLP. Bajo riesgo de proponer |
| **GoAnywhere MFT** | Transferencia segura de archivos administrada | Frecuente en gobierno y banca para intercambio de archivos |
| **Tripwire** | Integridad de archivos y cumplimiento (FIM) | Frecuente en PCI DSS y gobierno |

> **Posicionamiento**: Fortra (antes HelpSystems) es un agregado de productos de nicho. Si un RFP pide alguno de estos, evaluar caso por caso. Digital Guardian compite directamente con Symantec DLP — proponer Symantec como alternativa con mejor soporte Cybolt cuando sea posible.

---

### Casos de uso frecuentes en RFPs de Data Privacy

| Caso de uso | Solución principal Cybolt | Alternativa |
|------------|--------------------------|-------------|
| DLP endpoint (prevenir fuga en USB, impresión, captura) | Symantec DLP Endpoint Prevent | Proofpoint ITM |
| DLP email (prevenir fuga en correo saliente) | Symantec DLP Network Prevent for Email / Proofpoint DLP | — |
| DLP cloud / SaaS (M365, Google, Salesforce) | Symantec DLP Cloud / CloudSOC CASB | Proofpoint Information Protection |
| Clasificación de datos y etiquetado | Symantec ICE + clasificación nativa | Titus (Fortra) como complemento |
| CASB / Shadow IT | Symantec CloudSOC | Zscaler CASB (si ya tienen Zscaler) |
| Amenazas internas / comportamiento de usuario | Proofpoint ITM | Exabeam UEBA (si ya tienen SIEM) |
| Cumplimiento LFPDPPP / GDPR / PCI DSS (datos) | Symantec DLP + GRC Cybolt | — |

---

### Señales de oportunidad en RFPs

#### GO fuerte (Broadcom/Symantec DLP)
- Cliente con requerimiento explícito de DLP endpoint + red + email
- Sector financiero o banca con cumplimiento CNBV / PCI DSS
- Cliente con incidente previo de fuga de información
- RFP que menciona clasificación de datos, datos sensibles, PII, datos personales (LFPDPPP)
- Cliente que ya tiene Symantec endpoint — upsell natural a DLP

#### GO con precaución (Forcepoint / Fortra)
- Solo si el RFP lo pide explícitamente por nombre
- Verificar si se puede reorientar a Broadcom/Symantec antes de proponer
- Si no se puede reorientar, proponer con el valor del servicio Cybolt como diferenciador

---

### Discovery questions

1. ¿Tienen identificados los activos de datos sensibles (datos personales, información financiera, propiedad intelectual)?
2. ¿Han tenido incidentes de fuga de información — intencional o accidental?
3. ¿Tienen requerimiento de cumplimiento LFPDPPP, PCI DSS, CNBV o GDPR?
4. ¿Qué canales quieren cubrir? ¿Endpoint, email, web, nube?
5. ¿Usan Microsoft 365 o Google Workspace? ¿Tienen visibilidad de lo que sube a la nube?
6. ¿Tienen política de clasificación de información definida o necesitan crearla?
7. ¿Su DLP actual (si tienen) genera muchas alertas sin contexto? ¿Tienen analistas que las revisen?

---

### Cross-sell / Upsell natural

| Si el cliente tiene... | Proponer... |
|----------------------|-------------|
| DLP on-prem Symantec | → Extensión a DLP Cloud / CloudSOC para SaaS |
| Proofpoint Email Security | → Proofpoint DLP / ITM como upsell en misma plataforma |
| DLP sin clasificación de datos | → Symantec ICE / Titus para clasificación + etiquetado |
| DLP sin SIEM | → Integración con Exabeam / Sentinel para correlación de alertas de fuga |
| DLP activo | → GRC Cybolt (ISO 27001, LFPDPPP, PCI DSS) para cumplimiento formal |
| CASB / CloudSOC | → Zscaler CASB como alternativa cloud-native si el cliente migra a SASE |
