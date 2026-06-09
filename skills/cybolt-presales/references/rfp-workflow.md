## Workflow de análisis de RFP/RFI

### Paso 1: Extracción de información clave

Al recibir un RFP/RFI, extraer:

1. **Datos generales**: Cliente, sector, fecha límite, tipo de proceso (licitación pública, invitación, adjudicación directa)
2. **Alcance técnico**: Servicios requeridos, tecnologías especificadas, volumetrías
3. **Requisitos mandatorios**: Certificaciones, experiencia mínima, requisitos legales
4. **Criterios de evaluación**: Ponderación técnica vs económica, factores diferenciadores
5. **Red flags**: Requisitos que favorecen competidores, tecnologías que no manejamos
6. **Vendor locks**: Identificar especificaciones que apuntan a un fabricante específico (ver Paso 3A)

### Paso 2: Evaluación de viabilidad (Go/No-Go)

Evaluar cada oportunidad con estos criterios:

| Criterio | Evaluar |
|----------|---------|
| **Cobertura técnica** | ¿Cubrimos >80% de requerimientos con nuestro portafolio? |
| **Certificaciones** | ¿Cumplimos todas las certificaciones mandatorias? |
| **Experiencia** | ¿Tenemos casos de éxito similares documentables? |
| **Capacidad** | ¿Podemos entregar en tiempo y forma? |
| **Rentabilidad** | ¿El margen esperado justifica el esfuerzo? |
| **Competencia** | ¿Es licitación dirigida a otro proveedor? |
| **Vendor locks** | ¿Hay candados de fabricante que podamos abrir en Junta de Aclaraciones? |

**Decisión**:
- ✅ **GO**: Cumplimos >80% técnico + certificaciones + capacidad
- ⚠️ **GO con riesgo**: 60-80% cobertura, requiere alianzas o excepciones
- ❌ **NO-GO**: <60% cobertura, certificación faltante crítica, o licitación dirigida

### Paso 3: Mapeo de soluciones

Para cada requerimiento del RFP:

1. Identificar la línea de servicio Cybolt que aplica
2. Seleccionar tecnología(s) del portafolio que cubren el requerimiento
3. Identificar gaps y proponer alternativas o alianzas
4. Documentar diferenciadores vs competencia

Consultar la tabla de Service Lines en la sección "Perfil de Cybolt" para el mapeo de tecnologías por línea de servicio.

### Paso 3A: Análisis de vendor locks

Al analizar especificaciones técnicas, identificar candados de fabricante por niveles:

| Nivel de lock | Señales | Acción |
|---------------|---------|--------|
| **Lock duro** | Nomenclatura comercial exclusiva de un fabricante, arquitectura propietaria sin equivalente funcional (ej: "base de datos propietaria" = CyberArk vault) | Evaluar si es rompible en Junta. Si no, considerar partnership con ese fabricante o no-go para ese servicio |
| **Lock medio** | Terminología de fabricante con equivalentes funcionales en el mercado (ej: "Threat Emulation" = sandboxing, "Anti-Bot" = C2 detection) | Preparar preguntas para Junta que propongan equivalencias funcionales |
| **Lock bajo** | Especificaciones que favorecen un fabricante pero otros pueden cumplir con argumentación técnica (ej: algoritmos de cifrado legacy como Blowfish/Cast) | Documentar equivalencias y presentar en propuesta técnica |

**Técnicas para identificar el incumbente sin preguntarlo directamente:**
- Analizar la nomenclatura técnica usada en las especificaciones (nombres comerciales de módulos, blades, features)
- Revisar algoritmos, protocolos o arquitecturas que sean exclusivos de un fabricante
- Buscar combinaciones de funcionalidades que solo un producto integra en un solo agente/plataforma
- Verificar si las volumetrías coinciden con el dimensionamiento típico de un producto específico

### Paso 4: Identificación de riesgos

Categorizar riesgos encontrados:

**Riesgos técnicos**
- Tecnologías no manejadas
- Integraciones complejas
- Volumetrías fuera de experiencia
- Vendor locks que no se puedan abrir

**Riesgos comerciales**
- Precios predatorios de competencia
- Términos contractuales desfavorables
- Cliente con historial de pago problemático

**Riesgos operativos**
- Tiempos de implementación irreales
- SLAs muy agresivos (ej: 99.97% sin excluir mantenimientos = ~13 min downtime/mes)
- Ubicaciones geográficas complicadas
- Requisitos de personal en sitio excesivos

**Riesgos legales**
- Penalizaciones excesivas
- Requisitos de garantía atípicos
- Propiedad intelectual
- Contratos abiertos sin mínimo garantizado

### Paso 5: Estrategia de respuesta

Generar recomendaciones:

1. **Enfoque técnico**: Qué soluciones proponer, cómo estructurar la arquitectura
2. **Diferenciadores**: Certificaciones, experiencia, capacidades únicas de Cybolt
3. **Pricing strategy**: Servicios core vs add-ons, modelo de licenciamiento
4. **Alianzas necesarias**: Partners para cubrir gaps
5. **Preguntas de aclaración**: Aplicar reglas del Paso 6

### Paso 6: Formulación de preguntas para Juntas de Aclaraciones

#### REGLA DE ORO
**Solo formular preguntas que beneficien la posición de Cybolt. NUNCA preguntar algo que pueda endurecer requisitos, cerrar ambigüedades que nos favorecen, o darnos más obligaciones. Si algo es vago y esa vaguedad nos conviene, NO PREGUNTAR.**

Ejemplo: Si el RFP pide "cartas de recomendación" sin especificar que sean de terceros, NO preguntar "¿pueden ser del propio proveedor?". Presentarlas del propio proveedor y si no las rechazan, pasó. Preguntar solo provocaría que exijan cartas de terceros, que es más difícil de conseguir.

#### FORMATOS PROHIBIDOS

**NUNCA usar formato de opción múltiple (a, b, c).** Las preguntas con incisos para que la convocante "elija" están prohibidas porque:
1. Fuerzan una decisión binaria cuando la convocante podría responder con mayor flexibilidad
2. Limitan las opciones a lo que TÚ propones (la convocante puede rechazar todas)
3. Aparecen confrontacionales (como un examen), generando resistencia
4. Revelan tu estrategia al listar las opciones que estás considerando
5. Pueden ser desestimadas por no apegarse al formato del ANEXO IV

**MAL:** "Se solicita a la convocante indique qué inciso le conviene más: a) Servicio Onpremise b) Servicio en Nube c) Servicio desde las instalaciones del proveedor"
**BIEN:** "Es correcto entender que el servicio podrá ser proporcionado bajo cualquier modalidad de despliegue, siempre que se cumplan los niveles de servicio establecidos?"

**Otros formatos prohibidos:** Preguntas tipo "¿Por qué?" (cuestiona decisiones), preguntas de SI/NO directo (limita matices), preguntas sin referencia a numeral/página (pueden rechazarse), preguntas que revelen que no cumples un requisito.

**NOTA:** Las sub-preguntas numeradas (1. 2. 3.) SÍ son válidas y se usan frecuentemente (62 de 1,205 preguntas). Lo prohibido son las opciones de selección (a, b, c).

#### Tipos de preguntas y cuándo usarlas (13 categorías)

**1. Preguntas para obtener inteligencia del entorno actual**
- Objetivo: Descubrir qué tecnologías tiene el incumbente sin preguntar directamente quién es
- Formato: Preguntar por el entorno, no por el proveedor
- Ejemplo bueno: "¿Cuál es la suite de seguridad instalada actualmente en los endpoints?"
- Ejemplo malo: "¿Quién es el proveedor actual del servicio?"
- Ejemplo bueno: "¿Cuál es el sistema de ticketing/ITSM que utiliza la dependencia?"
- Ejemplo bueno: "¿Qué limitaciones han identificado en la plataforma actual?"

**2. Preguntas para abrir vendor locks**
- Objetivo: Lograr que la convocante reconozca equivalencias funcionales
- Formato: Largo, formal, con referencias legales (Art. 20 LAASSP, Art. 134 Constitucional)
- Táctica escalonada:
  1. Primero una pregunta paraguas que abra todo el servicio (ej: "¿se aceptan soluciones del Cuadrante Mágico de Gartner que cumplan funcionalmente?")
  2. Si no funciona, preguntas específicas por cada funcionalidad bloqueada
  3. Como último recurso, la pregunta legal frontal citando Art. 20 LAASSP
- Citar el estándar de industria como alternativa (CDR en vez de "Threat Extraction", sandboxing en vez de "Threat Emulation")
- Señalar obsolescencia técnica cuando aplique (ej: algoritmos Blowfish/Cast son legacy según NIST SP 800-131A)
- Si el propio Anexo ya da pistas de equivalencia (ej: "Emulación de amenazas (SandBox)"), usar eso como argumento
- NUNCA mencionar que Cybolt no es partner del fabricante incumbente; siempre enfocar en neutralidad tecnológica y libre concurrencia

**3. Preguntas para empujar SaaS vs on-premise**
- Objetivo: Debilitar locks de fabricantes legacy con arquitectura on-prem
- Formato: Preguntar si se acepta SaaS que cumpla los mismos SLAs y funcionalidades
- Repetir esta pregunta con diferentes redacciones para múltiples servicios — si se acepta para uno, queda precedente en acta para todos
- Ejemplo: "¿Es válido considerar una solución bajo esquema SaaS que elimine la necesidad de infraestructura dedicada, siempre que se cumplan los niveles de servicio?"

**4. Preguntas para clarificar SLAs y penalizaciones**
- Objetivo: Reducir riesgo financiero
- Preguntas seguras: ¿Las ventanas de mantenimiento se excluyen del cálculo de disponibilidad? ¿Los SLAs aplican desde el día 1 o hay periodo de gracia durante implementación?
- Estas SIEMPRE benefician al proveedor; la respuesta no puede empeorar la situación
- Ejemplo: "Es correcto entender que en caso de falla en equipos propiedad de la Convocante que ya no cuentan con soporte, el proveedor no será responsable o penalizado. ¿Es correcta nuestra apreciación?"

**5. Preguntas para obtener volumetrías exactas**
- Objetivo: Cotizar con precisión
- Preguntar distribución de dispositivos por SO, número de cuentas (no solo usuarios), segmentos de red, distribución geográfica
- En servicios de red: siempre preguntar anchos de banda de upstream Y downstream por separado
- Pedir listados de sitios con requerimientos específicos (ej: "Se le solicita proporcionar el listado de sitios que requieren instalación de racks o gabinetes")
- Formato: Corto y directo

**6. Preguntas para posicionamiento competitivo sutil**
- Objetivo: Hacer que la convocante valide una ventaja de tu solución como requisito
- Formato: Pregunta técnica que parece neutra pero valida una capacidad de tu oferta
- Ejemplo: Si tu solución tiene detección offline y la del incumbente no, preguntar "¿Se requiere que la detección funcione sin conexión a internet?"
- Ejemplo: Si tu DC es ICREA 3/4 y piden TIER II, preguntar "¿Es correcto que ICREA Nivel 3 se acepta como equivalente o superior a TIER II?"

**7. Preguntas para diferir entregables a post-adjudicación**
- Objetivo: Confirmar que ciertos documentos o entregables solo deben presentarse si se gana, reduciendo carga de preparación de propuesta
- Riesgo: CERO — si la convocante dice que sí, se ahorra trabajo; si dice que no, se presenta igual
- Patrón: "Es correcto entender que [el calendario / el programa / el plan de trabajo / las pólizas / el diseño] será(n) entregado(s) únicamente por el licitante ganador. ¿Es correcta nuestra apreciación?"
- Aplicar a: calendarios de cursos, programas de mantenimiento, planes de trabajo detallados, pólizas de soporte de fabricante, diseños y guías de configuración, propuestas de tecnologías verdes, documentación de APIs
- Ejemplo: "Es correcto entender que el Calendario de Cursos será entregado únicamente por el licitante ganador. ¿Es correcta nuestra apreciación?"
- Ejemplo: "Es correcto entender que las pólizas de soporte suscritas entre el Proveedor y los Fabricantes serán entregadas al adjudicarse el servicio y que para la propuesta técnica se mencionará el compromiso de adquirirlas. Favor de pronunciarse al respecto."

**8. Preguntas para deslinde de responsabilidad entre partidas**
- Objetivo: Delimitar claramente qué es responsabilidad de cada partida/proveedor en licitaciones multi-partida
- Crítico porque: delimitar alcance = delimitar riesgo financiero y operativo
- Aplicar cuando: la licitación tiene múltiples partidas que se adjudican a proveedores distintos
- Patrón: "Es correcto entender que [el alcance / la responsabilidad / la correlación / el monitoreo] solo corresponderá a los equipos propuestos por el licitante ganador de la partida [N]. ¿Es correcta nuestra apreciación?"
- Ejemplo: "Es correcto entender que el inventario de equipos a correlacionar solo corresponderá a los equipos de seguridad propuestos por el licitante ganador de la partida 3."
- Ejemplo: "Es correcto entender que no será responsabilidad del proveedor de la partida 1 tomar el control o brindar el servicio a la otra partida en caso de falla."
- Ejemplo: "Es correcto entender que el proveedor del SAC 3 no será responsable por cableado de IDFs y MDFs que no forman parte de la solución propuesta."
- Repetir este tipo de pregunta para CADA área de posible traslape: NOC, SOC, correlación, monitoreo, cableado, racks, tierra física, adecuaciones eléctricas

**9. Preguntas sobre personal y certificaciones**
- Objetivo: Reducir costos de personal y flexibilizar requisitos de certificación
- Patrones identificados:
  - Compartir recursos: "Se solicita confirmar que los recursos solicitados se pueden considerar para cumplir en una o más partidas. Favor de pronunciarse."
  - Un recurso, múltiples certificaciones: "Es correcto entender que, para cumplir las tres certificaciones solicitadas CISSP, CISA y CISM, un recurso humano puede cumplir con una o más certificaciones."
  - Varios recursos para una certificación: "Es correcto entender que para cumplir las certificaciones solicitadas, se puede acreditar con más de un recurso humano."
  - Nomenclaturas actualizadas: "Se solicita confirmar que el licitante puede presentar certificaciones con las nomenclaturas recientes del fabricante."
  - Vigencia: "Se solicita aclarar que para los certificados de PMP, se cumple si tienen fecha de expedición pero no fecha de vencimiento visible."
  - Presentar solo en tabla de puntos: "Se solicita aceptar que la información respecto al personal, el licitante la presente solo en la tabla de puntos y porcentajes de acuerdo a la partida en que participe."

**10. Preguntas sobre formato de propuesta electrónica**
- Objetivo: Reducir riesgo de descalificación por tecnicismos administrativos
- Aplicar en licitaciones electrónicas vía CompraNet
- Patrón FIEL: "Derivado de que el presente procedimiento es de carácter electrónica a través de CompraNet, es claro nuestro entender que se empleará en sustitución de la rúbrica los medios de identificación electrónica (FIEL). ¿Es correcta nuestra apreciación?"
- Patrón firmas de personal: "Se solicita que, al ser una propuesta electrónica avalada por la FIEL, no es necesario que los Currículum estén firmados por el personal propuesto. Favor de pronunciarse."
- Patrón idioma: "Se solicita a la convocante, para certificaciones y constancias expedidas por fabricante o institución de procedencia extranjera, se acepten en el idioma de origen. Favor de pronunciarse."
- Patrón copias: "Es correcto entender que para acreditar estudios a nivel superior el licitante puede presentar copia simple, digitalizada preferentemente a color, de la Cédula o Título Profesional."

**11. Preguntas sobre transición y migración**
- Objetivo: Definir responsabilidades durante la transición, protegerse de penalizaciones por herencia de problemas del incumbente
- Crítico en: contratos donde se hereda infraestructura existente o hay cambio de proveedor
- Patrón protección: "Es correcto entender que los sitios aún no migrados serán responsabilidad de la convocante y que no se nos penalizará en caso de falla de equipos no renovados?"
- Patrón extensión: "Se solicita amablemente extender el tiempo de entrega de la nueva infraestructura, así como la implementación de los servicios."
- Patrón deslinde por herencia: "En caso de que la respuesta sea afirmativa, ¿es correcto que la convocante será responsable de gestionar con el proveedor actual sin que seamos penalizados?"

**12. Preguntas con fundamentación legal**
- Objetivo: Dar peso legal a solicitudes críticas usando artículos de la LAASSP, su Reglamento u otras leyes
- Reservar para: casos donde las preguntas técnicas no lograron la apertura deseada (ÚLTIMO RECURSO)
- Ejemplo LAASSP: "Con relación al artículo 53 Bis de la LAASSP y 97 de su Reglamento, se solicita confirmar que el monto de las deductivas se determinará en función de la factura mensual."
- Ejemplo Art. 33: "El Art. 33 de la LAASSP establece que las dependencias podrán modificar aspectos de la convocatoria..."
- Ejemplo REPSE: "Con el fin de asegurar cumplimiento del artículo 15 de la LFT (REPSE), se solicita confirmar que no será requerido personal adicional en sitio."
- Riesgo: Se percibe como confrontacional. Combinar SIEMPRE con tono amable.

**13. Preguntas de igualdad competitiva**
- Objetivo: Solicitar información que solo el incumbente tiene, usando el argumento de libre concurrencia
- Patrón: "Con la finalidad de que todos los licitantes nos encontremos en igualdad de circunstancias y no favorecer a los proveedores actuales, se solicita [información técnica]."
- Aplicar a: coordenadas de sitios, inventarios de equipos, volumetrías históricas, topologías
- Ejemplo: "Con la finalidad de que todos los licitantes nos encontremos en igualdad de circunstancias, se solicita a la convocante indique la cantidad de eventualidades que se presentan mensualmente."

#### Técnicas avanzadas de formulación

**Preguntas encadenadas**
Formular una pregunta cuya respuesta positiva habilita una segunda más agresiva:
- Pregunta A: "¿Los proveedores podrán participar en la partida 1 y 3, o partida 2 y 3?"
- Pregunta B: "En caso de que la respuesta a la pregunta anterior sea positiva, ¿puede la Convocante mencionar si algún Proveedor podrá ser adjudicado con alguna de las partidas 1 y 2, y adicionalmente la partida 3?"
- La pregunta B solo tiene sentido si la A es positiva. Construye un argumento paso a paso.

**Preguntas de respaldo**
Asegurar que incluso con un "no", se obtiene algo útil:
- "En caso de ser negativa la respuesta a la pregunta inmediata anterior, se solicita atentamente a la Convocante acepte [alternativa]. Favor de pronunciarse."
- Ejemplo: Si preguntas si el personal puede no estar en la propuesta y dicen que no, la pregunta de respaldo pide que al menos se acepte presentarlo solo en la tabla de puntos y porcentajes.

**Repetición estratégica**
Hacer la misma pregunta con diferentes redacciones para diferentes secciones del Anexo Técnico. Si se responde positivamente en una sección, queda precedente en acta para todas las demás. Particularmente útil para preguntas de SaaS vs on-prem.

**Preguntas multipart (1. / 2. / 3.)**
Cuando un solo numeral genera múltiples dudas, agruparlas en una sola pregunta numerada:
- "Pregunta 1: Es correcto entender que... Pregunta 2: En caso contrario... Pregunta 3: Se solicita proporcionar..."
- Esto evita que la convocante responda solo parcialmente.
- IMPORTANTE: Sub-preguntas numeradas (1. 2. 3.) son VÁLIDAS y frecuentes (62 de 1,205 preguntas). Lo que es PROHIBIDO son las opciones de selección múltiple (a, b, c) — ver sección FORMATOS PROHIBIDOS.

**Patrón "Dado que... se solicita"**
Proporcionar contexto/justificación técnica indiscutible antes de la solicitud:
- Estructura: "Dado que [hecho técnico], se solicita [cambio lógico]. ¿Se acepta?"
- Ejemplo: "Dado que para WiFi6 con puertos 2.5/5 Gbps, conectarlos a puertos 10/100/1000 significaría subutilizar las capacidades, se solicita que los switches soporten puertos multigigabit."
- La convocante difícilmente rechaza algo respaldado por hechos técnicos objetivos.

**Argumento de igualdad competitiva**
Usar el principio de libre concurrencia (Art. 134 Constitucional) para solicitar información que solo el incumbente tiene:
- "Con la finalidad de que todos los licitantes nos encontremos en igualdad de circunstancias y no favorecer a los proveedores actuales, se solicita [información]."
- Efectivo para: coordenadas de sitios, volumetrías históricas, inventarios, topologías.

#### Catálogo de frases formales aprobadas (frecuencias de 1,437 preguntas reales)

| Frase | Frecuencia | Cuándo usarla |
|-------|-----------|---------------|
| "Es correcto entender que..." | 414 (34%) | Para confirmar interpretaciones que nos benefician |
| "Se solicita amablemente a la convocante..." | 405 (34%) | Para pedir información, volumetrías, detalles |
| "¿Se acepta nuestra solicitud/propuesta?" | 276 (23%) | Cierre de solicitudes de cambio |
| "Se sugiere a la convocante..." | 76 (6%) | Alternativas técnicas, propositivo |
| "Con la finalidad de..." | 46 | Justificar solicitudes con beneficio mutuo |
| "Favor de confirmar/aclarar" | 41 | Datos factuales, volumetrías |
| "Derivado de..." | 18 | Conectar con contexto previo |
| "¿Podría la convocante confirmar...?" | 14 | Para validar supuestos técnicos sensibles |
| "Dado que..." (inicio) | 14 | Abrir con justificación técnica indiscutible |
| "¿Es correcta nuestra apreciación?" | Frecuente | Cierre suave para preguntas interpretativas |
| "Favor de pronunciarse al respecto" | Frecuente | Cierre obligatorio para forzar respuesta en acta |
| "En caso contrario, favor de detallar" | Frecuente | Forzar respuesta detallada si respuesta negativa |
| "En caso de que la respuesta sea positiva/negativa..." | Frecuente | Para preguntas encadenadas y de respaldo |

#### Formato de presentación

Todas las preguntas deben:
- Referenciar numeral, página, párrafo o tabla específica del Anexo Técnico o Convocatoria
- Incluir cita textual del fragmento relevante del Anexo (entre comillas en columna "Tema")
- Formularse con frases del catálogo formal aprobado
- Cerrar con "Favor de pronunciarse al respecto" para forzar respuesta en acta
- Incluir una nota interna de estrategia y nivel de riesgo (NO presentar esta nota en la Junta)
- Ser profesionales y neutras en tono — la agresividad legal se reserva para inconformidades

Formato de tabla para documento de preguntas:

| Columna | Contenido |
|---------|-----------|
| No. | Número secuencial |
| Tema | Cita textual del fragmento del Anexo Técnico |
| Página | Página de referencia (ej: "176 de 235") |
| Numeral | Numeral del Anexo (ej: "6.8") |
| Páginas de Referencia del Anexo Técnico | Páginas donde se encuentra el tema |
| Pregunta | Formulación completa de la pregunta |

Encabezado del documento:
- "ANEXO IV — FORMATO DE ACLARACIONES A LA CONVOCATORIA"
- "PREGUNTAS DE CARÁCTER TÉCNICO" (o Administrativo/Económico)
- Datos del licitante, dirigida a, número de licitación, objeto de contratación

Cierre: "ATENTAMENTE" + firma del representante legal + razón social

#### Secuencia de presentación en la Junta

1. Comenzar con preguntas paraguas que abran múltiples servicios
2. Seguir con preguntas de SLA/penalizaciones (benefician a todos, generan buena voluntad)
3. Preguntas de volumetrías (neutras, necesarias)
4. Preguntas de igualdad competitiva (solicitar info que solo incumbente tiene)
5. Preguntas de diferimiento de entregables (reducen carga de propuesta, bajo riesgo)
6. Preguntas de deslinde de responsabilidad entre partidas (delimitan riesgo)
7. Preguntas de transición y migración (protegen de herencia de problemas)
8. Preguntas de personal y certificaciones (reducen costos)
9. Preguntas de formato de propuesta electrónica (reducen riesgo de descalificación)
10. Preguntas de flexibilización técnica (puede generar debate pero ya hay ritmo)
11. Preguntas de vendor lock (las más sensibles, al final cuando ya hay ritmo)
12. Preguntas con fundamentación legal (ÚLTIMO RECURSO, si las anteriores no lograron apertura)
13. Tener preguntas de reserva y de respaldo según cómo fluya la Junta
14. Si otros licitantes hacen preguntas alineadas a tu interés, apoyar verbalmente
