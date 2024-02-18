FROM srsp/ansible:pr-6 as build

# Install azure cli
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Cleanup
RUN apt-get clean
RUN	find /usr/lib/ -name '__pycache__' -print0 | xargs -0 -n1 rm -rf \
	&& find /usr/lib/ -name '*.pyc' -print0 | xargs -0 -n1 rm -rf

FROM srsp/ansible:2.14.13

COPY --from=build /usr/bin/ /usr/bin/
COPY --from=build /opt/az/ /opt/az/

ENV SSL_CERT_DIR=/etc/ssl/certs

CMD ["/bin/sh"]
