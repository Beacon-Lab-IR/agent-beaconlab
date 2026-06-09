## BU Cisco Networking (Switching + Wireless)

Cybolt es partner directo Cisco con capacidad de diseño, implementación y operación de infraestructura de red empresarial. Esta línea complementa la oferta de Cisco Ciberseguridad (ver `bu-infrastructure.md`) con networking puro.

---

### Portafolio — Cisco Switching

#### Cisco Catalyst 9000 Series (Switches Empresariales)

| Familia | Descripción | Caso de uso típico |
|---------|-------------|-------------------|
| **Catalyst 9200** | Switches de acceso entry-level. PoE+, stackwise, VLAN. 24/48 puertos | Oficinas remotas, sucursales, SMB |
| **Catalyst 9300** | Switches de acceso/distribución enterprise. PoE++, UADP 3.0, stackwise-480. 24/48 puertos GE/mGig | Core de campus, enterprise, gobierno. Familia más vendida |
| **Catalyst 9400** | Switches modulares de chassis. Alta densidad, redundancia. Hasta 384 puertos | Data centers, campus de alta densidad, entornos críticos |
| **Catalyst 9500** | Switches core/agregación de alto rendimiento. 100G/400G uplinks | Core de campus, spine-leaf, backbone empresarial |
| **Catalyst 9600** | Chassis modular de alto rendimiento. 100G/400G. Reemplazo de Catalyst 6K | Core de data center, campus de gran escala |

> **Nota de ventas**: La familia Catalyst 9300 es la más frecuente en RFPs mexicanos de gobierno y enterprise. Para switches de acceso, es la opción default. Los 9200 solo para oficinas remotas con presupuesto limitado.

#### Licenciamiento Cisco DNA (Digital Network Architecture)

| Tier | Incluye | Cuándo usar |
|------|---------|-------------|
| **Network Essentials** | Switching básico, QoS, VLAN, StackWise | Cuando el RFP solo pide switching L2/L3 básico |
| **Network Advantage** | Essentials + SD-Access, Cisco TrustSec, PBR avanzado | Cuando piden segmentación avanzada o SD-Access |
| **DNA Essentials** | Network Essentials + telemetría, Cisco DNA Center básico | Cuando piden gestión centralizada |
| **DNA Advantage** | Network Advantage + DNA Center completo, AI Analytics, assurance | Cuando piden AI-driven networking, assurance, o full automation |

#### Reglas de sizing para switches

- **Acceso campus (<500 usuarios)**: Catalyst 9300-24P o 9300-48P según densidad
- **Acceso campus (>500 usuarios)**: Catalyst 9300 stack con 9300-48P-A
- **Distribución/Core campus**: Catalyst 9500-16X (hasta 20 switches acceso) o 9500-48Y4C (más de 20)
- **Data center ToR**: Catalyst 9500 con Nexus para spine
- **Oficinas remotas**: Catalyst 9200-24P o 9200-48P

---

### Portafolio — Cisco Wireless

#### Cisco Catalyst 9100 Series (Wi-Fi 6/6E Enterprise)

| Familia | Descripción | Caso de uso |
|---------|-------------|-------------|
| **Catalyst 9105** | AP entry-level Wi-Fi 6. 2x2 MIMO | Oficinas pequeñas, baja densidad |
| **Catalyst 9115** | AP indoor Wi-Fi 6. 4x4 MIMO, BLE | Campus estándar, oficinas |
| **Catalyst 9120** | AP indoor Wi-Fi 6. 4x4/2x2, IoT ready | Campus enterprise, alta densidad |
| **Catalyst 9130** | AP indoor de alto rendimiento Wi-Fi 6. 4x4 tri-radio | Alta densidad: auditorios, hospitales, campus |
| **Catalyst 9136** | AP indoor Wi-Fi 6E. 6 GHz + 5 GHz + 2.4 GHz | Nuevo estándar, alta densidad, campus premium |
| **Catalyst 9162/9164/9166** | AP outdoor. IP67, Wi-Fi 6/6E | Exteriores, estadios, almacenes |

#### Controladores Wireless

| Modelo | Descripción | Capacidad |
|--------|-------------|-----------|
| **Catalyst 9800-L** | Controlador hardware on-prem. Appliance | Hasta 250 APs |
| **Catalyst 9800-40** | Controlador hardware de alto rendimiento | Hasta 2,000 APs |
| **Catalyst 9800-80** | Controlador hardware campus/WAN | Hasta 6,000 APs |
| **Catalyst 9800-CL** | Controlador virtual (ESXi, KVM, AWS, Azure) | Configurable |
| **Embedded Wireless (EWC)** | Controlador embebido en el AP (Catalyst 9115/9120/9130) | Hasta 100 APs, sin appliance separado |

#### Cisco Meraki (Cloud-Managed)

| Familia | Descripción | Cuándo proponer |
|---------|-------------|-----------------|
| **Meraki MR** | APs cloud-managed (MR28, MR36, MR46, MR56) | Cuando el cliente quiere gestión cloud, sucursales distribuidas |
| **Meraki MS** | Switches cloud-managed | Complemento a MR en entornos full-Meraki |
| **Meraki MX** | Security appliances / SD-WAN cloud-managed | Branch office con seguridad integrada |

> **Nota de ventas**: Meraki requiere licencia cloud anual obligatoria. Si el cliente no quiere opex recurrente, proponer Catalyst 9100 con Catalyst 9800 on-prem.

---

### Complementos frecuentes en RFPs de Networking

| Componente | Producto Cisco | Notas |
|-----------|---------------|-------|
| **NAC** | Cisco ISE (Identity Services Engine) + appliance SNS-3815-K9 | Casi siempre requerido en gobierno y banca |
| **Gestión centralizada** | Cisco DNA Center | Opcional pero frecuente en RFPs enterprise |
| **SD-WAN** | Cisco Viptela (ahora Catalyst SD-WAN) | Cuando hay múltiples sitios |
| **SFPs / Transceivers** | SFP-10G-SR, SFP-10G-LR, SFP-25G-SR-S | Siempre incluir en BOM cuando hay uplinks |

---

### Diferenciadores Cybolt en Networking

- **SOC 24x7**: Operación de red desde SOC con monitoreo proactivo
- **NOC integrado**: Gestión de incidentes de red + seguridad en un solo punto
- **Data Center propio**: Pruebas de laboratorio y staging en DC certificado ICREA III/IV
- **Cisco partnership**: Acceso a precios de partner, soporte TAC, Professional Services
- **Integración seguridad**: Al ser MSSP, la red siempre se diseña con seguridad integrada (ISE, Umbrella, Stealthwatch)

---

### Señales en RFPs para esta BU

Menciones de: switches, access points, Wi-Fi, VLAN, PoE, PoE+, PoE++, stackwise, Catalyst, Meraki, 9200, 9300, 9500, C9300, C9500, wireless controller, SSID, WPA3, 802.11ax, Wi-Fi 6, Wi-Fi 6E, NAC, ISE, DNA Center, SD-Access, campus networking, red de campus, cableado estructurado, infraestructura de red, LAN, WLAN.
