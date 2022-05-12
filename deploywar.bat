ECHO Y | RMDIR /S C:\workset\bin\apache-tomcat-9.0.36\webapps\ROOT
ECHO Y | RMDIR /S C:\workset\bin\apache-tomcat-9.0.36\webapps\hanmadang-0.0.1-SNAPSHOT

copy target\hanmadang-0.0.1-SNAPSHOT.war C:\workset\bin\apache-tomcat-9.0.36\webapps\
