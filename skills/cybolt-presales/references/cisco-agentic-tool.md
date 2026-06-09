## Herramienta: Cisco Agentic RFP Analysis

El presales-agent incluye un módulo automatizado para análisis de RFPs con productos Cisco. Es el único módulo del sistema con **agentes especializados por dominio**.

### Qué hace

1. **Ingiere documentos RFP** (PDF, DOCX, TXT)
2. **Extrae requerimientos técnicos** vía LLM
3. **Detecta candados** (vendor locks, specs mínimos, protocolos obligatorios)
4. **Clasifica requerimientos** por dominio: switching, wireless, security
5. **Cada especialista diseña la solución** con SKUs específicos usando RAG
6. **Consolida BOM** (Bill of Materials) y calcula compliance
7. **Valida EoL/EoS** contra base de datos live de Cisco

### Arquitectura

```
Orchestrator (orchestrator.py)
├── Generalist Agent: extrae reqs, detecta candados, clasifica
├── Switching Specialist: Catalyst 9200/9300/9400/9500/9600
├── Wireless Specialist: Catalyst 9100, Meraki MR, 9800 controllers
└── Security Specialist: Firepower FPR-1000/2100/3100/4200, ISE, FMC
    └── Cada uno tiene: RAG propio (ChromaDB + BM25), catálogo de productos, reglas de sizing
```

### RAG Híbrido por dominio

Cada especialista tiene su propia base de conocimiento indexada:
- **ChromaDB** (vector search) — búsqueda semántica de datasheets
- **BM25** (keyword search) — búsqueda exacta de SKUs/PIDs
- **Structured lookup** — tablas de performance extraídas como JSON
- **RRF merge** — fusiona rankings con pesos (BM25 3x boost para SKUs)

Indexed datasheets: `knowledge_base/specialists/{domain}/datasheets/*.pdf`

### Reglas de sizing (crítico para ganar licitaciones)

El sistema implementa right-sizing: seleccionar el modelo **mínimo** que cumple el requerimiento.
- Sobredimensionar = perder por precio
- Subdimensionar = perder por incumplimiento técnico

Ejemplos:
- 10 Gbps TLS → FPR3130 tiene 9.1 Gbps (NO cumple) → usar FPR3140 (11.5 Gbps)
- 1-5 firewalls → FMC1700, no FMC2700
- <20 switches acceso → core C9500-16X, no C9500-48Y4C

### Detección de candados

El sistema identifica 5 tipos de candados en RFPs:
1. **vendor_lock**: Marca/modelo específico (ej: "FortiGate 700G")
2. **performance**: Capacidad mínima numérica (ej: "10 Gbps SSL/TLS")
3. **protocol**: Protocolo o tecnología específica (ej: "MCLAG sobre FortiLink")
4. **integration**: Integración con sistema específico (ej: "Microsoft Entra ID")
5. **quantity**: Cantidades exactas (ej: "3 unidades FortiSwitch")

### Cuándo usar esta herramienta

- RFPs que piden infraestructura Cisco (networking + security)
- Diseño de BOM para propuestas con switches, APs, firewalls Cisco
- Validación de SKUs contra EoL/EoS
- Cross-reference: cruzar requerimientos vs datasheets de productos específicos

### Acceso

- **UI**: Tab "Cisco Agents" en la aplicación web (CiscoAgents.jsx)
- **API**: `POST /api/cisco/analyze` (RFP analysis), `POST /api/cisco/crossref` (cross-reference)
- **Historial**: Los análisis completados se persisten en `outputs/cisco/history.json`

### Limitaciones actuales

- Solo cubre 3 dominios: switching, wireless, security
- No cubre: routing puro, SD-WAN, collaboration (video/voice), data center (Nexus/ACI)
- Los catálogos de productos están hardcoded — los datasheets RAG complementan
- El sizing depende de la calidad del RAG indexado
