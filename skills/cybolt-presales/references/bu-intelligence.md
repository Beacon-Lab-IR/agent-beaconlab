# BU Intelligence & Investigation (i2 Group)

## Definición

Línea de servicio de **inteligencia analítica e investigación** basada en la plataforma i2 de Harris (antes IBM i2). Habilita ecosistemas de inteligencia para organizaciones que necesitan identificar, prevenir y neutralizar riesgos a través del análisis de vínculos, patrones ocultos y correlación multidimensional de datos.

**Cybolt es partner/reseller de i2 Group (Harris)** en México y Latinoamérica.

---

## Propuesta de valor

> Identificar riesgo/objetivo oculto en grandes volúmenes de datos mediante análisis de vínculos, correlación multidimensional y colaboración entre analistas con capas de seguridad empresarial.

### Capacidades core

- **Identificación de objetivos**: Elementos o personas de riesgo/interés a partir de sus relaciones
- **Entendimiento del contexto**: Medir completamente el riesgo a través de la comprensión de relaciones entre entidades
- **Análisis multidimensional**: Redes de vínculos, líneas de tiempo, geoespacial, patrones de comportamiento, SNA (Social Network Analysis), mapas de calor
- **Modelo ELP (Entity-Link-Property)**: Toda entidad tiene propiedades (atributos) y vínculos temporales o permanentes con otras entidades

---

## Portafolio de productos i2

### Productos principales (de menor a mayor complejidad)

| Producto | Tipo | Descripción | Usuarios | Volumetría |
|----------|------|-------------|----------|------------|
| **i2 Analyst's Notebook** | Desktop standalone | Lienzo de análisis individual. Importación manual de datos (XLS, CSV). Incluye análisis de textos. | 1 usuario | Pequeña (~100K elementos en gráfico) |
| **i2 iBase + Analyst's Notebook** | Desktop + BD compartida | Base de datos simple compartida para workgroups pequeños | Pocos analistas | Pequeña-mediana |
| **i2 Analysis Studio** | Desktop + conectores | Aplicación de escritorio con conexión a Hub y fuentes externas vía i2 Connect. Lienzo principal de trabajo para analistas. | Múltiples (concurrentes) | Mediana-grande |
| **i2 Analysis Hub** | Servidor empresarial | Plataforma empresarial. Repositorio de inteligencia centralizado, colaboración, seguridad por capas, reportes PDF. | Ilimitados (según licencia) | Grande (escalabilidad empresarial) |

### Componentes adicionales

| Componente | Función |
|------------|---------|
| **i2 Connect** | Conectores a fuentes de datos estructuradas externas (SQL, Access, APIs, microservicios, RDBMS) |
| **i2 Explore (antes Investigate Add On)** | Cliente web para investigación rápida de objetivos sin analistas especializados. Acceso directo al repositorio de inteligencia. Configurable para responder preguntas cotidianas al instante. Identifica datos y conexiones en tiempo real para incidentes en vivo. |
| **i2 Notebook Web** | Versión web del Analyst's Notebook. Búsquedas visuales, modo oscuro, geoespacial, roles y permisos |

### Complementos opcionales

| Complemento | Función |
|-------------|---------|
| **MKCVI Brevis (Redes Sociales)** | Extracción estructurada de: Facebook, Instagram, X/Twitter, TikTok, Snapchat, Reddit, LinkedIn, VK, YouTube, WhatsApp, Telegram, Pipl, DarkOwl, OSINT Industries |
| **NLP / Extracción de textos** | Extracción automatizada de entidades, relaciones y ubicaciones en datos no estructurados. Personalizable para nuevas entidades y relaciones |
| **Motor de recomendaciones** | Descubrimiento de relaciones no obvias. Resolución de entidades (detectar cuándo múltiples entidades son la misma). Alertamiento automático por datos alterados |
| **OSINT / Deep Web** | Investigador web para fuentes abiertas e internet profunda |
| **Análisis de llamadas** | Análisis de registros telefónicos (CDR) |

---

## Integraciones soportadas

- RDBMS (SQL Server, Oracle, PostgreSQL, Access)
- ESRI (geoespacial/GIS)
- APIs y microservicios vía i2 Connect
- Conectores personalizados
- Herramientas ETL
- Formatos de exportación: PDF, gráficos, reportes

---

## Modelo de seguridad

i2 Analysis Hub implementa seguridad por capas:
- **Clasificación de datos por origen**: Niveles de seguridad según fuente de información
- **Roles de usuario**: Permisos granulares basados en rol
- **Privilegios**: Matriz de permisos (lectura, escritura, exportación) por usuario/rol/dato
- **Colaboración segura**: Inteligencia incremental entre equipos sin comprometer compartimentación

---

## Casos de uso por vertical

### Gobierno y Seguridad Nacional
- Investigación/monitoreo del crimen organizado
- Localización de personas
- Análisis de estructuras delictivas
- Expedientes de inteligencia
- Contra el terrorismo
- Seguridad de frontera y aduanas
- Análisis de objetivos y defensa
- Protección de fuerza

### Seguridad Pública / Cumplimiento de la ley
- Investigaciones de delitos mayores
- Aduanas y seguridad fronteriza
- Gestión de eventos de seguridad

### Sector Financiero / Fraude
- Detección e investigación de fraudes
- Identificación de crímenes financieros (PLD/FT)
- Investigaciones de operaciones con información privilegiada
- Investigaciones internas
- Verificación e investigaciones de seguridad
- Protección de seguridad de la información ejecutiva

---

## Casos de éxito i2 en América Latina

| Vertical | Presencia |
|----------|-----------|
| Unidad de Inteligencia Financiera | 6 países |
| Inteligencia Nacional | 7 países |
| Ministerio Público | 8 países |
| Ministerio de Justicia | 6 países |
| Bancos | +30 en LA |
| Telecomunicaciones | +14 empresas |
| Seguros | 7 empresas |
| Policía | Casi todos los países de LA |

**i2 global**: +5,000 clientes, +100 países, 18 industrias, fundado 1990 (Cambridge, UK). Adquirido por Harris en enero 2022.

---

## Niveles de madurez / dimensionamiento

| Nivel | Productos | Para quién |
|-------|-----------|------------|
| **Básico** | Analyst's Notebook standalone | Analista individual, presupuesto limitado |
| **Workgroup** | iBase + Analyst's Notebook | Equipo pequeño (3-5 analistas) |
| **Departamental** | Analysis Studio + Connect | Departamento con múltiples fuentes de datos |
| **Empresarial** | Analysis Hub + Studio + Explore + Connect + Brevis + NLP | Organización grande, múltiples equipos, seguridad por capas |

---

## Discovery questions

### Entendimiento del problema
1. ¿Qué tipo de investigaciones realizan? (fraude, crimen organizado, inteligencia, compliance, PLD/FT)
2. ¿Cuántos analistas trabajan en investigaciones?
3. ¿Cuál es su principal fuente de datos?
4. ¿Necesitan colaborar entre equipos/unidades/jurisdicciones?
5. ¿Tienen requerimientos de compartimentación o clasificación de información?

### Madurez tecnológica
6. ¿Utilizan actualmente alguna herramienta de análisis de vínculos o link analysis?
7. ¿Tienen bases de datos estructuradas o trabajan con documentos/hojas de cálculo?
8. ¿Requieren integración con fuentes externas (RDBMS, APIs)?
9. ¿Necesitan capacidades de OSINT o monitoreo de redes sociales?

### Dimensionamiento
10. ¿Cuántos usuarios concurrentes necesitan?
11. ¿Qué volumen de datos manejan?
12. ¿Requieren on-premise o pueden considerar nube?
13. ¿Cuántos equipos de análisis tienen?

### Regulatorio
14. ¿Están sujetos a regulación PLD/FT (CNBV, UIF)?
15. ¿Necesitan cadena de custodia digital para evidencia?
16. ¿Requieren trazabilidad de acceso a información?

---

## Cross-sell con otras BUs Cybolt

| Si el cliente necesita... | Cross-sell con... |
|--------------------------|-------------------|
| Monitoreo de amenazas + investigación | BU IR (Beacon Lab) — Threat Intelligence + i2 |
| Cumplimiento PLD/FT | BU GRC — Programa de cumplimiento + i2 para investigación |
| Respuesta a incidentes + análisis forense | BU IR — DFIR + i2 para correlación de evidencia |
| Investigación de fraude en apps | BU AppSec — vulnerabilidades + i2 para rastreo |
| Protección de infraestructura crítica | BU OT — seguridad industrial + i2 para análisis de amenazas |

---

## Vendor locks / señales en RFPs

### Señales de que piden i2
- Mención de "Analyst's Notebook", "Analysis Hub", "iBase"
- Referencia a "modelo ELP" o "Entity-Link-Property"
- Mención de "Harris" o "IBM i2"
- Requerimiento de "link analysis" o "análisis de vínculos" con visualización
- Referencia a conectores i2 Connect

### Competidores en este espacio
| Competidor | Fortaleza | Debilidad vs i2 |
|-----------|-----------|------------------|
| **Palantir** (Gotham/Foundry) | Enterprise masivo, analytics avanzados | Muy costoso, vendor lock extremo |
| **Maltego** | OSINT, link analysis ligero | Sin repositorio empresarial, sin seguridad por capas |
| **Cellebrite** | Forense digital, extracción móvil | Complementario, no compite directamente |
| **Nuix** | Análisis datos no estructurados | Menos fuerte en visualización de vínculos |
| **SAS Visual Investigator** | Fraude financiero, modelos analíticos | Menos flexible para investigaciones ad-hoc |

### Cuándo Cybolt/i2 gana
- Gobierno que ya conoce i2 (alta penetración en LATAM)
- Proyectos con seguridad por capas y compartimentación
- Organizaciones con múltiples equipos de analistas
- Necesidad de OSINT + análisis de vínculos en una plataforma

### Cuándo Cybolt/i2 pierde
- Cliente ya tiene Palantir desplegado
- Solo necesitan OSINT sin análisis empresarial (Maltego más barato)
- Presupuesto muy limitado para licenciamiento
