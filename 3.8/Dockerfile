# Socks Server 5
# Cogset Open Source Group

FROM debian:jessie

MAINTAINER Cogset <cogset@funcuter.org>

RUN groupadd -r ss5 && useradd -r -g ss5 ss5

ENV SS5_VERSION 3.8.9-8

# Install
RUN buildDeps="libpam0g-dev libldap2-dev libssl-dev gcc make wget" \
    && apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates libpam0g libssl1.0.0 $buildDeps \
    && wget -O ss5.tar.gz "http://downloads.sourceforge.net/project/ss5/ss5/$SS5_VERSION/ss5-$SS5_VERSION.tar.gz" \
    && mkdir -p /usr/src/ss5 \
    && tar -xzf ss5.tar.gz -C /usr/src/ss5 --strip-components=1 \
    && rm ss5.tar.gz \
    && cd /usr/src/ss5 \
    && ./configure \
    && make \
    && make install \
    && cd / \
    && rm -rf /usr/src/ss5 \
    && apt-get purge -y --auto-remove $buildDeps \
    && rm -rf /var/lib/apt/lists/* \
# Configure
    && sed -i "/#auth/a\auth 0.0.0.0\/0 – u" /etc/opt/ss5/ss5.conf \
    && sed -i "/#permit/a\permit u 0.0.0.0\/0 - 0.0.0.0\/0 - - - - -" /etc/opt/ss5/ss5.conf \
    && echo "demo 1234" > /etc/opt/ss5/ss5.passwd \
    && touch /var/log/ss5/ss5.log

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 1080

CMD ["tail", "-f", "/var/log/ss5/ss5.log"]
