FROM openjdk:8-jre-alpine
EXPOSE 8111

RUN wget -P /tmp https://github.com/sevdokimov/log-viewer/releases/download/v.1.0.3/log-viewer-1.0.3.tar.gz
RUN mkdir -p /opt
RUN tar zxfv /tmp/log-viewer-1.0.3.tar.gz -C /opt
RUN rm -f /tmp/log-viewer-1.0.3.tar.gz

# move expanded directory to a nicer location
RUN mv /opt/log-viewer-1.0.3 /opt/logviewer

# existing scripts is not sh-friendly, rewritten
COPY scripts/logviewer.sh /opt/logviewer/

WORKDIR /opt/logviewer
CMD /opt/logviewer/logviewer.sh
