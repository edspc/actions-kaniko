FROM gcr.io/kaniko-project/executor:debug

ADD entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
