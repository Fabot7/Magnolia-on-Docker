# Check for the existence of $JDKPath (which might be a variable that was substituted by an external script, i.e installer)
if [ -d "$JDKPath" ] ; then
  export JAVA_HOME="$JDKPath"
fi

export CATALINA_OPTS="$CATALINA_OPTS -XX:MaxPermSize=256m -Xms64M -Xmx1024M -Djava.awt.headless=true"
# to enable jmx:
# export CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote.port=12345 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"
# to enable debugging:
# export JPDA_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=54455,suspend=n,server=y"

# Java Heap Size editing
export CATALINA_OPTS="-server -Xmx1024m"

# java.awt.headless editing
export CATALINA_OPTS="-server -Xmx1024m -Djava.awt.headless=true"

CURDIR=`dirname "$0"`
if [ -e "${CURDIR}/magnolia_banner.txt" ] ; then
  cat ${CURDIR}/magnolia_banner.txt
fi
