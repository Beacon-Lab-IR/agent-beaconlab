### Tecnologías / marcas que Cybolt NO soporta ni administra

**REGLA PARA ANÁLISIS DE RFPs**: Si un RFP menciona una tecnología que NO está en la tabla de "Portafolio de servicios y tecnologías" de arriba, debe marcarse como **NO SOPORTADA** y evaluarse como gap. Las siguientes son las más frecuentes en RFPs del mercado mexicano, organizadas por categoría:

#### Broadcom — IMPORTANTE: solo suite de ciberseguridad
> **⚠️ Broadcom divide su portafolio en dos divisiones. Cybolt SOLO es partner de la división de ciberseguridad (Symantec + Carbon Black). NO somos partner de la división de infraestructura/DC de Broadcom (VMware vSphere, vSAN, NSX, VCF, Workspace ONE, Tanzu, Aria). Si un RFP pide productos VMware de data center, es un GAP.**

#### Endpoint Security / EDR / XDR — Soportadas ✅
| Tecnología | Fabricante | Notas |
|-----------|------------|-------|
| Symantec Endpoint Security / XDR | Broadcom (div. ciberseguridad) | **PARTNER BROADCOM CYBER** — cubre Symantec suite completa. Cliente de referencia: Kapital (XDR) |
| Carbon Black / VMware Carbon Black | Broadcom (div. ciberseguridad) | **PARTNER BROADCOM CYBER** — incluido en portafolio de ciberseguridad Broadcom. Soportado |
| Trend Micro Vision One / Apex One / XDR | Trend Micro | **PARTNER TREND MICRO** — soportamos XDR y suite completa. Cliente de referencia: Kapital |
| Cortex XDR | Palo Alto Networks | **PARTNER PALO ALTO** — soportado a través del partnership completo con Palo Alto. Cliente de referencia: Alpura (cliente más grande con Cortex XDR) |
| Microsoft Defender for Endpoint | Microsoft | **SOPORTADO** — Cybolt brinda soporte administrado. Cliente de referencia: Oxxo |
| SentinelOne XDR/EDR | SentinelOne | **PARTNER SENTINELONE** — incluido en portafolio de Managed Security. Soportado |

#### Endpoint Security / EDR / XDR — NO soportadas
| Tecnología | Fabricante | Notas |
|-----------|------------|-------|
| McAfee / Trellix | Trellix (ex-McAfee) | Frecuente en incumbentes gobierno. NO es partner |
| Sophos Intercept X | Sophos | Popular en PyMEs y educación. NO es partner |
| Bitdefender GravityZone | Bitdefender | Frecuente en Europa y algunos RFPs gobierno. NO es partner |
| Kaspersky Endpoint Security | Kaspersky | Restricciones geopolíticas. NO es partner |
| ESET Endpoint Security | ESET | Popular en LATAM/PyMEs. NO es partner |
| Cybereason | Cybereason | Nicho enterprise. NO es partner |

#### Firewall / Network Security — NO soportadas
| Tecnología | Fabricante | Notas |
|-----------|------------|-------|
| FortiGate / FortiOS | Fortinet | Competidor directo de Palo Alto. MUY frecuente en gobierno MX. NO es partner |
| Check Point Quantum / Harmony | Check Point | Frecuente en banca y gobierno. NO es partner |
| Sophos XG/XGS Firewall | Sophos | PyMEs. NO es partner |
| SonicWall | SonicWall | PyMEs. NO es partner |
| WatchGuard | WatchGuard | PyMEs. NO es partner |
| Juniper SRX | Juniper | Telco/ISP. NO es partner |

#### SIEM / Log Management — Soportadas ✅
| Tecnología | Fabricante | Notas |
|-----------|------------|-------|
| Exabeam | Exabeam | **PARTNER DIRECTO** — soportado en portafolio de Managed Security |
| LogRhythm | LogRhythm | **SOPORTADO VIA PARTNER** — a través del mismo partner que Exabeam (plataformas relacionadas). Soportado con servicios |
| IBM QRadar | IBM | **SOPORTADO VIA PARTNER DE NEGOCIOS** — no soporte directo aún, pero partner habilitado puede dar servicios y migraciones. Proponer con esta aclaración interna |

#### Device Management (MDM) — Soportadas ✅
| Tecnología | Fabricante | Notas |
|-----------|------------|-------|
| Jamf Pro / Jamf Protect / Jamf Connect | Jamf | **PARTNER JAMF** — Cybolt puede cotizar y renovar licenciamiento con servicios del fabricante. NO hay especialistas internos — implementación y soporte avanzado se entregan con recursos del fabricante. Para Apple (macOS/iOS) |

#### Device Management (MDM) — NO soportadas
| Tecnología | Fabricante | Notas |
|-----------|------------|-------|
| VMware Workspace ONE / Omnissa | Broadcom (div. DC) | **NO es partner**. Broadcom div. DC no está cubierta. Alternativa: Jamf (para Apple) o Microsoft Intune (si ya tienen M365) |
| Microsoft Intune | Microsoft | NO es partner directo para MDM. Si el cliente ya tiene M365 E3/E5, Intune viene incluido — Cybolt puede soportar la capa de seguridad encima (MDE) pero no la gestión MDM como servicio |

#### Virtualización / Data Center VMware — NO soportadas ❌
| Tecnología | Fabricante | Notas |
|-----------|------------|-------|
| VMware vSphere / ESXi | Broadcom (div. DC) | **NO somos partner**. Cybolt no cotiza ni administra hypervisores VMware |
| VMware vSAN | Broadcom (div. DC) | Almacenamiento hiperconvergente. NO soportado |
| VMware NSX | Broadcom (div. DC) | Virtualización de red / microsegmentación DC. NO soportado |
| VMware vCenter | Broadcom (div. DC) | Gestión de infraestructura virtual. NO soportado |
| VMware Cloud Foundation (VCF) | Broadcom (div. DC) | Stack integrado DC. NO soportado |
| VMware Tanzu | Broadcom (div. DC) | Kubernetes / contenedores VMware. NO soportado |
| VMware Aria (ex-vRealize) | Broadcom (div. DC) | Operaciones cloud. NO soportado |

> **NOTA**: Si un RFP pide productos VMware de data center, evaluar si es factible participar solo en la capa de ciberseguridad (Symantec/Carbon Black para endpoints + Trend Micro Deep Security para protección de servidores virtualizados) sin tocar la infraestructura VMware.

#### SIEM / Log Management — NO soportadas
| Tecnología | Fabricante | Notas |
|-----------|------------|-------|
| Splunk Enterprise Security | Splunk/Cisco | Frecuente en enterprise. NO es partner |
| ArcSight | OpenText (ex-Micro Focus) | Legacy enterprise. NO es partner |
| Fortinet FortiSIEM | Fortinet | Frecuente si cliente ya tiene FortiGate. NO es partner |
| Securonix | Securonix | Nicho cloud SIEM. NO es partner |
| Rapid7 InsightIDR | Rapid7 | Cloud SIEM. NO es partner |

#### WAF / CDN / DDoS Cloud — Soportadas via Cloudflare ✅
| Tecnología | Fabricante | Notas |
|-----------|------------|-------|
| Cloudflare WAF | Cloudflare | **RESELLER AUTORIZADO** — proponer siempre ante reqs de WAF cloud. Sin experiencia propia aún, mitigar con casos Cloudflare |
| Cloudflare CDN | Cloudflare | **RESELLER AUTORIZADO** — red global 300+ ciudades, competitivo vs Akamai |
| Cloudflare DDoS Protection | Cloudflare | **RESELLER AUTORIZADO** — mitigación L3/L4/L7 ilimitada en todos los planes |
| Cloudflare Bot Management | Cloudflare | **RESELLER AUTORIZADO** — ML + threat intel para bots maliciosos |
| Cloudflare API Security | Cloudflare | **RESELLER AUTORIZADO** — API Discovery, schema validation, rate limiting |
| Cloudflare Zero Trust (ZTNA) | Cloudflare | **RESELLER AUTORIZADO** — reemplaza VPN, acceso contextual |
| Cloudflare SASE / Magic WAN | Cloudflare | **RESELLER AUTORIZADO** — SD-WAN + seguridad integrada |
| Cloudflare Email Security | Cloudflare | **RESELLER AUTORIZADO** — anti-phishing, BEC, malware |
| Cloudflare DNS (Authoritative + Resolver) | Cloudflare | **RESELLER AUTORIZADO** — DNS rápido y seguro |

> ⚠️ **NOTA IMPORTANTE**: Cybolt es reseller autorizado de Cloudflare pero **no tiene experiencia propia de implementaciones**. En propuestas, compensar con: (1) certificaciones técnicas del equipo en entrenamiento, (2) casos de éxito de Cloudflare como fabricante, (3) posicionar el valor del MSSP (SOC 24x7, certificaciones PCI/ISO) como diferenciador vs competir solo en tecnología.

#### WAF / Application Delivery — NO soportadas (on-prem / otros fabricantes)
| Tecnología | Fabricante | Notas |
|-----------|------------|-------|
| F5 BIG-IP ASM / Advanced WAF | F5 Networks | Muy frecuente en banca y gobierno. NO es partner |
| Fortinet FortiWeb | Fortinet | Frecuente con ecosistema Fortinet. NO es partner |
| Akamai WAF / WAAP / Prolexic | Akamai | CDN+WAF incumbente frecuente. NO es partner — competidor directo de Cloudflare |
| AWS WAF | Amazon | Nube pública. NO es partner |
| Azure WAF / Front Door | Microsoft | Nube pública. NO es partner |
| Barracuda WAF | Barracuda | PyMEs. NO es partner |
| Radware AppWall / DefensePro | Radware | Nicho ADC+WAF. NO es partner |
| Citrix ADC / NetScaler | Citrix | ADC+WAF. NO es partner |
| A10 Thunder ADC | A10 Networks | Balanceo+WAF. NO es partner |
| Fastly Next-Gen WAF | Fastly | Cloud WAF. NO es partner |

#### Vulnerability Management — NO soportadas
| Tecnología | Fabricante | Notas |
|-----------|------------|-------|
| Qualys VMDR | Qualys | Muy frecuente en compliance. Tenable SÍ es partner, Qualys NO |
| Rapid7 InsightVM / Nexpose | Rapid7 | Cloud VM. NO es partner |
| Nessus (standalone) | Tenable | Tenable SÍ es partner en plataforma enterprise, Nessus standalone verificar |
| OpenVAS / Greenbone | OpenSource | Gobierno frecuente. NO soportado como servicio administrado |
| HCL AppScan | HCL | Legacy IBM. NO es partner |

#### Sistemas Operativos — NO administrados
| Tecnología | Contexto frecuente en RFPs | Notas |
|-----------|---------------------------|-------|
| Oracle Solaris (10, 11.x SPARC) | Gobierno, banca legacy | Requiere admin LDoms, Zones, Oracle VM for SPARC. NO soportado |
| AIX (IBM Power) | Gobierno, banca, mainframe | Requiere admin PowerVM, HMC, LPARs. NO soportado |
| HP-UX | Banca legacy | Similar a Solaris/AIX. NO soportado |

#### Bases de Datos — NO administradas como DBA
| Tecnología | Contexto | Notas |
|-----------|----------|-------|
| Oracle Database (DBA avanzado) | Gobierno, banca | Cybolt puede monitorear con Imperva (DAM) pero NO ofrece servicio de DBA Oracle |
| IBM Informix | Gobierno legacy (ej. SEP) | Motor legacy, talento escaso. NO soportado |
| IBM Db2 | Banca, gobierno | Mainframe/Power. NO soportado |
| SAP HANA | Manufactura, enterprise | Base de datos in-memory SAP. NO soportado |
| MongoDB / Redis / Cassandra | Cloud-native apps | NoSQL. NO administrado como servicio |

#### Cloud — NO soportadas como partner
| Tecnología | Fabricante | Notas |
|-----------|------------|-------|
| Oracle Cloud Infrastructure (OCI) | Oracle | **NO somos partner de Oracle**. No proponer servicios de OCI. Si el cliente tiene OCI, evaluar si se puede cubrir con herramientas agnósticas (Imperva DAM, Cloudflare WAF) |
| Oracle Database Security (DB Vault, Audit Vault, DB Firewall) | Oracle | NO es partner. Si el cliente pide seguridad de Oracle DB, proponer Imperva DAM como alternativa agnóstica |

#### Middleware / Plataformas — NO administradas
| Tecnología | Contexto | Notas |
|-----------|----------|-------|
| WSO2 (API Manager, Identity, ESB) | Gobierno (ej. SEP-DGSANEF) | Middleware Java. NO soportado |
| Oracle WebLogic | Banca, gobierno | App server enterprise. NO soportado |
| IBM WebSphere | Banca, gobierno | App server legacy. NO soportado |
| SAP NetWeaver | Manufactura, enterprise | Plataforma SAP. NO soportado |
| Huawei FusionCompute | Gobierno con relación Huawei | Hypervisor propietario. NO soportado |

#### Networking / Switches / Routing — NO administrados
| Tecnología | Contexto | Notas |
|-----------|----------|-------|
| HPE Aruba (CX, 83xx, 63xx) | DC gobierno, campus | Switches DC y campus. NO es partner |
| Juniper EX/QFX | DC, ISP | Switches DC. NO es partner |
| Huawei switches | Gobierno | Switches enterprise. NO es partner |
| Dell/EMC PowerSwitch | DC | Switches DC. NO es partner |

#### Balanceo de Carga — NO administrado
| Tecnología | Contexto | Notas |
|-----------|----------|-------|
| F5 BIG-IP LTM | Banca, gobierno DC | Líder mercado. NO es partner |
| A10 Thunder | DC enterprise | Balanceo L4/L7. NO es partner |
| Citrix NetScaler / ADC | Enterprise | ADC. NO es partner |
| HAProxy | Open source | Verificar si se soporta como servicio |
| NGINX Plus | Cloud-native | Verificar si se soporta como servicio |

#### Almacenamiento / Respaldo — NO administrado
| Tecnología | Contexto | Notas |
|-----------|----------|-------|
| NetApp | DC enterprise, gobierno | Almacenamiento SAN/NAS. NO es partner |
| Dell EMC (PowerStore, Unity, VMAX) | DC enterprise | Almacenamiento enterprise. NO es partner |
| Pure Storage | DC enterprise | Flash storage. NO es partner |
| Hitachi Vantara | DC gobierno | Almacenamiento enterprise. NO es partner |
| IBM FlashSystem / Storwize | DC banca | Storage IBM. NO es partner |
| Veeam | Respaldo VMs | Backup & replication. NO es partner |
| Commvault | Respaldo enterprise | Backup enterprise. NO es partner |
| Veritas NetBackup | Respaldo legacy | Backup legacy. NO es partner |
