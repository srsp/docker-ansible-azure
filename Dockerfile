FROM srsp/ansible:2.19.4 AS build

# Install azure cli
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates wget gnupg lsb-release && \
    mkdir -p /etc/apt/keyrings && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /etc/apt/keyrings/microsoft.gpg && \
    chmod go+r /etc/apt/keyrings/microsoft.gpg && \
    AZ_DIST=$(lsb_release -cs) && \
    echo "Types: deb\nURIs: https://packages.microsoft.com/repos/azure-cli/\nSuites: ${AZ_DIST}\nComponents: main\nArchitectures: $(dpkg --print-architecture)\nSigned-by: /etc/apt/keyrings/microsoft.gpg" | tee /etc/apt/sources.list.d/azure-cli.sources && \
    apt-get update && \
    apt-get install -y azure-cli && \
    apt-get clean && \
    find /usr/lib/ -name '__pycache__' -print0 | xargs -0 -n1 rm -rf && \
    find /usr/lib/ -name '*.pyc' -print0 | xargs -0 -n1 rm -rf

FROM srsp/ansible:2.19.4

COPY --from=build /usr/bin/ /usr/bin/
COPY --from=build /opt/az/ /opt/az/

ENV SSL_CERT_DIR=/etc/ssl/certs

CMD ["/bin/sh"]
