### Competidores principales de Cybolt en México

| Competidor | Fortaleza principal | Dónde compiten contra Cybolt | Debilidad vs Cybolt |
|-----------|-------------------|-----------------------------|--------------------|
| **KIO Networks** | Data Center propio (Tier III/IV), nube privada, colocation. Presencia en Querétaro (zona B) | Servicios administrados de DC, hosting gobierno | No son MSSP puro, seguridad no es su core |
| **Triara (Telmex)** | DC Tier III/IV propios, respaldo de Telmex/América Móvil, red nacional | DC gobierno, servicios administrados infra | Seguridad es complemento, no core. Burocracia corporativa |
| **Alestra** | Telecomunicaciones + DC + seguridad, presencia nacional | SOC, SIEM, servicios administrados mixtos | Menos especialización en ciber que Cybolt |
| **Telmex/Scitum** | SOC más grande de México, respaldo Telmex, contratos gobierno históricos | SOC, SIEM, servicios administrados de seguridad, gobierno federal | Innovación lenta, dependencia de marca Telmex |
| **IQSec** | Fuerte en gobierno, consultoría GRC, pentesting | GRC gobierno, auditorías, pentesting, cumplimiento regulatorio | Menor portafolio de tecnologías que Cybolt |
| **Ikusi** | Integrador de redes y seguridad, Cisco partner fuerte | Networking + seguridad perimetral, proyectos mixtos infra+seguridad | Más integrador que MSSP, menos profundidad en ciber |
| **Total Cybersec** | Especialista ciber, crecimiento rápido | Servicios administrados de seguridad, SOC, compliance | Menor escala e historial que Cybolt |

#### Cuándo Cybolt pierde vs competidores
- **RFPs de DC + Seguridad integrados**: KIO, Triara, Telmex ganan por tener DC propio en zonas correctas
- **RFPs Fortinet-locked**: Muchos competidores son Fortinet partner. Cybolt no
- **RFPs Check Point-locked**: Cybolt no es partner Check Point
- **RFPs donde precio es >60% de evaluación**: Telmex/Scitum y Alestra pueden subsidiar con telecom
- **RFPs con requerimiento de red/switching**: Ikusi y otros integradores tienen más capacidad

#### Cuándo Cybolt gana vs competidores
- **RFPs de seguridad pura** (SOC, SIEM, EDR, WAF, FW BD): Portafolio más profundo y certificaciones (ISO 27001, 22301, SOC 2, FIRST)
- **RFPs con CrowdStrike o Palo Alto lock**: Partnership directo
- **RFPs con componente AppSec**: Veracode/Checkmarx/GitLab — diferenciador fuerte
- **RFPs con OT Security**: Claroty/TXOne — nicho donde pocos competidores tienen experiencia
- **RFPs con componente DRP/BCP**: DC ICREA III/IV propio + ISO 22301 + BARI
- **RFPs donde certificaciones pesan >30%**: Cybolt tiene más certificaciones corporativas que la mayoría
- **RFPs de WAF/CDN/DDoS cloud**: Cloudflare como fabricante + SOC Cybolt 24x7 — propuesta completa vs solo tecnología

### Estimación de % de participación en RFPs mixtos

Cuando un RFP incluye componentes que NO son core Cybolt (infraestructura de DC, networking, almacenamiento, etc.), estimar qué porcentaje del contrato es relevante para decidir el modelo de participación:

#### Modelo de estimación rápida

| Componente del RFP | % típico del contrato | Core Cybolt? |
|--------------------|-----------------------|-------------|
| Coubicación / Data Center | 20-30% | ❌ NO |
| Procesamiento (servidores, RISC, x86) | 15-25% | ❌ NO |
| Almacenamiento + respaldos | 10-15% | ❌ NO |
| Licenciamiento (SO, BD, middleware) | 5-15% | ❌ NO |
| Seguridad informática (FW, WAF, IPS, SOC, SIEM, AV) | 8-15% | ✅ SÍ |
| WAF Cloud / CDN / DDoS / Bot Mgmt / Zero Trust | 5-20% | ✅ SÍ (Cloudflare reseller) |
| Nube pública (AWS, Azure, GCP) | 3-10% | ⚠️ Parcial |
| Mesa de Servicios / ITSM | 3-8% | ⚠️ Parcial |
| Networking / switches / enlaces | 3-8% | ❌ NO |
| Consultoría / DRP-BCP | 2-5% | ✅ SÍ |
| Personal dedicado / PMO | 3-8% | ⚠️ Parcial |

#### Decisión basada en % de participación

| % Core Cybolt del contrato | Decisión | Modelo |
|---------------------------|----------|--------|
| **>60%** | **GO como licitante principal** | Cybolt lidera, subcontrata componentes menores |
| **30-60%** | **GO con alianza estratégica** | Co-licitación con integrador, Cybolt aporta seguridad |
| **15-30%** | **GO como subcontratista** | Buscar integrador principal, ofrecer componente de seguridad |
| **<15%** | **Evaluar si vale la pena** | Solo participar si hay relación estratégica o pipeline futuro |
| **<5%** | **NO-GO** | El esfuerzo de preventa no justifica el ingreso potencial |

#### Cómo estimar el % en la práctica

1. **Listar todos los servicios del RFP** y clasificarlos como Core / Parcial / No Core
2. **Asignar peso** usando la tabla de arriba (ajustar si el RFP da pistas de distribución presupuestal)
3. **Sumar los % Core + (Parcial × 0.5)** = % efectivo de participación Cybolt
4. **Aplicar la tabla de decisión** para definir modelo de participación
5. **Documentar en el análisis** para justificar Go/No-Go

#### Integradores potenciales para alianza (cuando Cybolt es subcontratista)

| Tipo de RFP | Integradores a contactar | Cybolt ofrece |
|------------|--------------------------|---------------|
| DC + Seguridad gobierno | KIO, Triara, Alestra, Telmex | SOC, SIEM, FW, WAF, EDR, DRP |
| Networking + Seguridad | Ikusi, Alestra, Cisco partners | Seguridad perimetral, SOC, SIEM |
| Nube + Seguridad | Softtek, Nubiral, Alestra | Cloud Security, CASB, WAF |
| Infra legacy (SPARC/AIX) + Seguridad | KIO, Telmex, Oracle partners | Seguridad, monitoreo, FW BD |

---
