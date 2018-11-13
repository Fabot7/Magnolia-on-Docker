#===============================================================#
# - Using a base image with Debian, tomcat, mysql e postgresql  #
#===============================================================#
FROM nicolasbarbe/magnolia-base

#===============================================================#
# ------- Assigning a maintainer for the local project -------- #
#===============================================================#
MAINTAINER Fábio Silva da Conceição <fsconceicao@sefaz.al.gov.br>

#===============================================================#
# -------- Opening a folder for persistent volume ------------ #
#===============================================================#
VOLUME ["/var/lib/tomcat8"]

#===============================================================#
# --------------- Exposing Tomcat port (8080) ----------------- #
#===============================================================#
EXPOSE 8080

#===============================================================#
# --- Downloading and unpacking original Magnolia's project --- #
#===============================================================#
WORKDIR /var/tmp
RUN wget https://nexus.magnolia-cms.com/content/repositories/magnolia.public.releases//info/magnolia/bundle/magnolia-community-demo-bundle/5.7.1/magnolia-community-demo-bundle-5.7.1-tomcat-bundle.zip
RUN apt-get update
RUN apt-get install zip unzip -y
RUN unzip magnolia-community-demo-bundle-5.7.1-tomcat-bundle.zip
RUN mv magnolia-5.7.1/apache-tomcat-9.0.10 ROOT-Extracted
RUN rm -Rf magnolia-community-demo-bundle-5.7.1-tomcat-bundle.zip
RUN rm -Rf magnolia-5.7.1

#=================================================================#
# Replacing original Magnolia's project content with own contents #
#=================================================================#

RUN rm -Rf ROOT-Extracted/webapps/*
RUN mkdir -p ROOT-Extracted/webapps/WEB-INF
COPY WEB-INF/* ROOT-Extracted/webapps/WEB-INF/

RUN rm -Rf ROOT-Extracted/bin/setenv.sh
COPY setenv.sh ROOT-Extracted/bin/setenv.sh

RUN rm -Rf ROOT-Extracted/conf/*
COPY conf/* ROOT-Extracted/conf/

#===============================================================#
# Zipping modified Magnolia's project and putting it on Tomcat  #
#===============================================================#
RUN zip -r ROOT.zip ROOT-Extracted/*
RUN rm -Rf ROOT-Extracted
RUN mv ROOT.zip /var/lib/tomcat8/ROOT.zip
