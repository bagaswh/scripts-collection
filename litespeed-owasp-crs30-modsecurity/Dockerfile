FROM litespeedtech/openlitespeed
WORKDIR /scripts/litespeed-owasp-crs30-modsec
COPY . /scripts/litespeed-owasp-crs30-modsec
RUN chmod +x ./script.sh
RUN ./script.sh
WORKDIR /var/www/vhosts