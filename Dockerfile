FROM debian:stretch-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV PHP_VERSION=7.3

COPY ./scripts /
RUN /install.sh && rm /install*

ENTRYPOINT ["/command.sh"]
CMD ["php-fpm7.3"]
HEALTHCHECK --interval=10s --timeout=3s CMD /health.sh
