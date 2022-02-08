FROM oraclelinux:7-slim

ARG ORACLE_VERSION=18.5

RUN yum -y install oracle-release-el7 && \
    yum-config-manager --enable ol7_oracle_instantclient && \
    yum -y install oracle-instantclient${ORACLE_VERSION}-basic \
      oracle-instantclient${ORACLE_VERSION}-sqlplus && \
    rm -rf /var/cache/yum && \
    curl -L https://github.com/jindrichskupa/sleepysh/releases/download/v0.0.3/sleepysh_linux_amd64 -o /usr/local/bin/sleepysh && \
    chmod +x /usr/local/bin/sleepysh

ENTRYPOINT ["/usr/local/bin/sleepysh"]
