# OpenEBS

[![Releases](https://img.shields.io/github/release/openebs/openebs/all.svg?style=flat-square)](https://github.com/openebs/openebs/releases)
[![Slack channel #openebs](https://img.shields.io/badge/slack-openebs-brightgreen.svg?logo=slack)](https://kubernetes.slack.com/messages/openebs)
[![Twitter](https://img.shields.io/twitter/follow/openebs.svg?style=social&label=Follow)](https://twitter.com/intent/follow?screen_name=openebs)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](https://github.com/openebs/openebs/blob/master/CONTRIBUTING.md)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fopenebs%2Fopenebs.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fopenebs%2Fopenebs?ref=badge_shield)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/1754/badge)](https://bestpractices.coreinfrastructure.org/projects/1754)

https://openebs.io/

**Lea esto en**
[馃嚛馃嚜](translations/README.de.md)	
[馃嚪馃嚭](translations/README.ru.md)	
[馃嚬馃嚪](translations/README.tr.md)	
[馃嚭馃嚘](translations/README.ua.md)	
[馃嚚馃嚦](translations/README.zh.md)	
[馃嚝馃嚪](translations/README.fr.md)
[馃嚙馃嚪](translations/README.pt-BR.md)
**[otros idiomas](translations/#readme).**

**OpenEBS** es la soluci贸n de almacenamiento de c贸digo abierto m谩s ampliamente implementada y f谩cil de usar para Kubernetes.

**OpenEBS** es el ejemplo de c贸digo abierto l铆der de una categor铆a de soluciones de almacenamiento a veces llamada [Almacenamiento adjunto de contenedores](https://www.cncf.io/blog/2018/04/19/container-attached-storage-a-primer/). **OpenEBS** aparece como un ejemplo de c贸digo abierto en el [Papel t茅cnico sobre el paisaje de almacenamiento CNCF](https://github.com/cncf/sig-storage/blob/master/CNCF%20Storage%20Landscape%20-%20White%20Paper.pdf) bajo las soluciones de almacenamiento hiperconverged.

Algunos aspectos clave que hacen que OpenEBS sea diferente en comparaci贸n con otras soluciones de almacenamiento tradicionales:
- Construido utilizando la arquitectura de microservicios como las aplicaciones a las que sirve. OpenEBS se implementa como un conjunto de contenedores en nodos de trabajo de Kubernetes. Utiliza Kubernetes para orquestar y gestionar componentes OpenEBS
- Construido completamente en el espacio de usuario por lo que es altamente port谩til para ejecutar a trav茅s de cualquier sistema operativo / plataforma
- Completamente impulsado por la intenci贸n, heredando los mismos principios que impulsan la facilidad de uso con Kubernetes
- OpenEBS es compatible con una gama de motores de almacenamiento para que los desarrolladores puedan implementar la tecnolog铆a de almacenamiento adecuada a sus objetivos de dise帽o de aplicaciones. Las aplicaciones distribuidas como Cassandra pueden utilizar el motor LocalPV para escrituras de latencia m谩s baja. Las aplicaciones monol铆ticas como MySQL y PostgreSQL pueden utilizar el motor ZFS (cStor) para la resiliencia. Las aplicaciones de streaming como Kafka pueden utilizar el motor NVMe [Mayastor](https://github.com/openebs/Mayastor) para obtener el mejor rendimiento en entornos perimetrales. En todos los tipos de motor, OpenEBS proporciona un marco coherente para alta disponibilidad, instant谩neas, clones y capacidad de administraci贸n.

OpenEBS se implementa como un contenedor m谩s en el host y habilita los servicios de almacenamiento que se pueden designar en un nivel por pod, aplicaci贸n, cl煤ster o contenedor, incluidos:
- Automatizar la gesti贸n del almacenamiento conectado a los nodos de trabajo de Kubernetes y permitir que el almacenamiento se utilice para aprovisionar din谩micamente PVs OpenEBS o CV locales.
- Persistencia de datos entre nodos, lo que reduce dr谩sticamente el tiempo dedicado a reconstruir anillos Cassandra, por ejemplo.
- Sincronizaci贸n de datos entre zonas de disponibilidad y proveedores de nube mejorando la disponibilidad y disminuyendo los tiempos de solicitud/desconexi贸n, por ejemplo.
- Una capa com煤n, por lo que si se est谩 ejecutando en AKS, o su metal desnudo, O GKE, o AWS - su experiencia de cableado y desarrollador para los servicios de almacenamiento es lo m谩s similar posible.
- Gesti贸n de niveles hacia y desde S3 y otros objetivos.

Una ventaja a帽adida de ser una soluci贸n nativa completamente Kubernetes es que los administradores y desarrolladores pueden interactuar y gestionar OpenEBS utilizando todas las maravillosas herramientas que est谩n disponibles para Kubernetes como kubectl, Helm, Prometheus, Grafana, Weave Scope, etc.

**Nuestra visi贸n** es simple: permita que los servicios de almacenamiento y almacenamiento para cargas de trabajo persistentes se integren completamente en el entorno para que cada equipo y carga de trabajo se beneficie de la granularidad del control y el comportamiento nativo de Kubernetes.

## Escalabilidad

OpenEBS puede escalar para incluir un gran n煤mero arbitrariamente de controladores de almacenamiento en contenedores. Kubernetes se utiliza para proporcionar piezas fundamentales como el uso de etcd para el inventario. OpenEBS escala en la medida en que sus escalas de Kubernetes.

## Instalaci贸n y introducci贸n

OpenEBS se puede configurar en unos sencillos pasos. Puede ponerse en marcha en su elecci贸n del cl煤ster de Kubernetes teniendo open-iscsi instalado en los nodos de Kubernetes y ejecutando el openebs-operator mediante kubectl.

**Iniciar los servicios de OpenEBS utilizando el operador**
```bash
# Aplicar este yaml
kubectl aplicar -f https://openebs.github.io/charts/openebs-operator.yaml
```

**Iniciar los servicios de OpenEBS con el tim贸n**
```bash
actualizaci贸n del repositorio del tim贸n
helm install --namespace openebs --name openebs stable/openebs
```

Tambi茅n puede seguir nuestra [Gu铆a de inicio r谩pido](https://docs.openebs.io/docs/overview.html).

OpenEBS se puede implementar en cualquier cl煤ster de Kubernetes, ya sea en la nube, en las instalaciones o en el equipo port谩til para desarrolladores (minikube). Tenga en cuenta que no hay cambios en el kernel subyacente que sean necesarios ya que OpenEBS opera en el espacio de usuario. Siga nuestra documentaci贸n de [OpenEBS Setup](https://docs.openebs.io/docs/overview.html). Adem谩s, tenemos un entorno Vagrant disponible que incluye una implementaci贸n de Kubernetes de ejemplo y carga sint茅tica que puede usar para simular el rendimiento de OpenEBS. Tambi茅n puede encontrar interesante el proyecto relacionado llamado Litmus (https://litmuschaos.io) que ayuda con la ingenier铆a del caos para cargas de trabajo con estado en Kubernetes.

## Estado

OpenEBS es una de las infraestructuras de almacenamiento de Kubernetes m谩s utilizadas y probadas en la industria. Un proyecto CNCF Sandbox desde mayo de 2019, OpenEBS es el primer y 煤nico sistema de almacenamiento en los sistemas locales y en la nube, y fue el primero en abrir su propio Marco de Ingenier铆a de Caos para cargas de trabajo con estado, el [Proyecto Litmus](https://litmuschaos.io), en el que la comunidad conf铆a para evaluar autom谩ticamente la cadencia mensual de OpenEBS. Los clientes empresariales han estado utilizando OpenEBS en producci贸n desde 2018 y el proyecto admite tiradores de acopladores de 2.5M+ a la semana.

A continuaci贸n se proporciona el estado de varios motores de almacenamiento que alimentan los vol煤menes persistentes de OpenEBS. La diferencia clave entre los estados se resume a continuaci贸n:
- **alpha:** La API puede cambiar de manera incompatible en una versi贸n posterior del software sin previo aviso, recomendada para su uso solo en cl煤steres de pruebas de corta duraci贸n, debido al mayor riesgo de errores y la falta de soporte a largo plazo.
- **beta**: El soporte para las caracter铆sticas generales no se eliminar谩, aunque los detalles pueden cambiar. Se proporcionar谩 compatibilidad para actualizar o migrar entre versiones, ya sea mediante la automatizaci贸n o pasos manuales.
- **stable**: Las caracter铆sticas aparecer谩n en el software lanzado para muchas versiones posteriores y el soporte para la actualizaci贸n entre versiones se proporcionar谩 con automatizaci贸n de software en la gran mayor铆a de escenarios.

| Motor de almacenamiento de informaci贸n | Estado | Detalles |
|---|---|---|
| Jiva | estables | Es el m谩s adecuado para ejecutar almacenamiento de bloques replicados en nodos que utilizan el almacenamiento ef铆mero en los nodos de trabajo de Kubernetes.
| cStor | beta | Una opci贸n preferida para ejecutarse en nodos que tienen dispositivos de bloque. Opci贸n recomendada si se requieren Instant谩neas y Clones .
| Vol煤menes locales | beta | M谩s adecuado para aplicaciones distribuidas que necesitan almacenamiento de baja latencia: almacenamiento con conexi贸n directa desde los nodos de Kubernetes. |
| Mayastor | alfa | Un nuevo motor de almacenamiento que funciona con la eficiencia del almacenamiento local, pero tambi茅n ofrece servicios de almacenamiento como replicaci贸n. El desarrollo est谩 en marcha para admitir instant谩neas y clones. |

Para obtener m谩s informaci贸n, consulte [Documentaci贸n de OpenEBS](https://docs.openebs.io/docs/next/quickstart.html).

## Contribuir

OpenEBS da la bienvenida a sus comentarios y contribuciones en cualquier forma posible.

- [Unirse a la comunidad OpenEBS en Kubernetes Slack](https://kubernetes.slack.com)
  - 驴Ya te has registrado? Dir铆gete a nuestras discusiones en [#openebs](https://kubernetes.slack.com/messages/openebs/)
- 驴Quieres plantear un problema o ayudar con las correcciones y caracter铆sticas?
  - Ver [problemas abiertos](https://github.com/openebs/openebs/issues)
  - Ver [gu铆a colaboradora](./CONTRIBUTING.md)
  - Quieres unirte a nuestras reuniones de la comunidad de colaboradores, [echa un vistazo a esto](./community/README.md).
- Unirse a nuestras listas de correo OpenEBS CNCF
  - Para actualizaciones de proyectos OpenEBS, suscr铆bete a [Anuncios OpenEBS](https://lists.cncf.io/g/cncf-openebs-announcements)
  - Para interactuar con otros usuarios de OpenEBS, suscr铆bete a [Usuarios de OpenEBS](https://lists.cncf.io/g/cncf-openebs-users)

## Mu茅strame el c贸digo

Este es un meta-repositorio para OpenEBS. Comience con los repositorios anclados o con el documento [OpenEBS Architecture](./contribute/design/README.md). 

## Licencia

OpenEBS se desarrolla bajo la licencia [Apache License 2.0](https://github.com/openebs/openebs/blob/master/LICENSE) en el nivel del proyecto. Algunos componentes del proyecto se derivan de otros proyectos de c贸digo abierto y se distribuyen bajo sus respectivas licencias.

OpenEBS forma parte de los Proyectos CNCF.

[![Proyecto de caja de arena CNCF](https://raw.githubusercontent.com/cncf/artwork/master/other/cncf-sandbox/horizontal/color/cncf-sandbox-horizontal-color.png)](https://landscape.cncf.io/selected=open-ebs)

## Ofertas Comerciales

Esta es una lista de terceras empresas e individuos que proporcionan productos o servicios relacionados con OpenEBS. OpenEBS es un proyecto CNCF que no respalda a ninguna empresa. La lista se proporciona en orden alfab茅tico.
- [Clouds Sky GmbH](https://cloudssky.com/es/)
- [CodeWave](https://codewave.eu/)
- [Servicios en la nube de Gridworkz](https://gridworkz.com/)
- [MayaData](https://mayadata.io/)
