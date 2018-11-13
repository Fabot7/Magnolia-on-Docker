#===============================================================#
# ---- Imagem base com Debian, tomcat, mysql e postgresql ----- #
#===============================================================#
FROM nicolasbarbe/magnolia-base

#===============================================================#
# -------- Atribui o mantenedor do sistema dockerizado -------- #
#===============================================================#
MAINTAINER Fábio Silva da Conceição <fsconceicao@sefaz.al.gov.br>

#===============================================================#
# ----------- Abre o volume persistente em tomcat8 ------------ #
#===============================================================#
VOLUME ["/var/lib/tomcat8"]

#===============================================================#
# --------------- Expôe a porta do Tomcat (8080) -------------- #
#===============================================================#
EXPOSE 8080

#===============================================================#
# ----------- Baixa e descompacta o projeto Magnolia ---------- #
#===============================================================#
WORKDIR /var/tmp
RUN wget https://nexus.magnolia-cms.com/content/repositories/magnolia.public.releases//info/magnolia/bundle/magnolia-community-demo-bundle/5.7.1/magnolia-community-demo-bundle-5.7.1-tomcat-bundle.zip
RUN apt-get update
RUN apt-get install zip unzip -y
RUN unzip magnolia-community-demo-bundle-5.7.1-tomcat-bundle.zip
RUN rm -Rf magnolia-community-demo-bundle-5.7.1-tomcat-bundle.zip
RUN mv magnolia-5.7.1/apache-tomcat-9.0.10 ROOT-Extracted
RUN rm -Rf magnolia-5.7.1

#===============================================================#
# - Substitui o conteúdo do projeto original pelo modificado  - #
#===============================================================#

RUN rm -Rf ROOT-Extracted/webapps/*
RUN mkdir -p ROOT-Extracted/webapps/WEB-INF
COPY WEB-INF/* ROOT-Extracted/webapps/WEB-INF/

RUN rm -Rf ROOT-Extracted/bin/setenv.sh
COPY setenv.sh ROOT-Extracted/bin/setenv.sh

RUN rm -Rf ROOT-Extracted/conf/*
COPY conf/* ROOT-Extracted/conf/

#===============================================================#
# -- Compacta e posiciona o projeto ROOT em /var/lib/tomcat8 -- #
#===============================================================#
RUN zip -r ROOT.zip ROOT-Extracted/*
RUN rm -Rf ROOT-Extracted
RUN mv ROOT.zip /var/lib/tomcat8/ROOT.zip