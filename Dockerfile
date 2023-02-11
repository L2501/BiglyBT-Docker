FROM ibm-semeru-runtimes:open-11-jre-focal
RUN addgroup --gid 1000 biglybt && useradd --uid 1000 --home /home/biglybt --shell /sbin/nologin -g biglybt biglybt
WORKDIR /app
RUN curl -L https://files.biglybt.com/installer/BiglyBT_unix.tar.gz -s -o - | \
    tar -xzvf - --no-same-permissions \
    biglybt/BiglyBT.jar \
    biglybt/commons-cli.jar \
    biglybt/plugins/azupdater/ \
    biglybt/plugins/azutp/ \
    biglybt/plugins/mlDHT/ \
    -C /app
RUN mkdir -p "/home/biglybt/BiglyBT Downloads" && chown -R biglybt:biglybt /home/biglybt
USER biglybt
ENTRYPOINT ["java"]
CMD ["-Xmx256m", "-cp", "/app/biglybt/BiglyBT.jar:/app/biglybt/commons-cli.jar", "--illegal-access=deny", "--add-opens", "java.base/java.lang.reflect=ALL-UNNAMED", "--add-opens", "java.base/java.net=ALL-UNNAMED", "-Djava.library.path=/app/biglybt", "-Dazureus.install.path=/app/biglybt", "-Dazureus.script=/app/biglybt/biglybt", "-Dazureus.script.version=10", "-DMULTI_INSTANCE=true", "-Daz.instance.manager.enable=0", "com.biglybt.ui.Main", "-ui", "console"]
