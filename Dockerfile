FROM registry:2.6.2
ARG "version=0.1.0-dev"

LABEL org.label-schema.vendor="ephemeral972" \
    org.label-schema.name="s3-registry" \
    org.label-schema.description="Registry image with S3 storage configured for Marathon" \
    org.label-schema.usage="/src/README.md" \
    org.label-schema.url="https://github.com/seeker815/s3-registry" \
    org.label-schema.version=$version \
    org.label-schema.schema-version="1.0" \
    org.label-schema.docker.cmd.devel="" \
    org.label-schema.docker.params="AWS_BUCKET=S3 bucket name,\
    AWS_REGION=AWS Region to use,\
    AWS_KEY=Your account key,\
    AWS_SECRET=Your account secret,\
    STORAGE_PATH=S3 bucket directory to use" \
    org.label-schema.build-date=$build_date

ENV STORAGE_PATH="/" ENCRYPT=true SECURE=false

ENTRYPOINT ["/docker-entrypoint.sh"]

COPY distr-s3/config.yml /etc/docker/registry/config.yml

CMD ["/etc/docker/registry/config.yml"]