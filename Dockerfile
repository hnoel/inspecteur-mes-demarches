FROM docker.io/matau/inspecteur-mes-demarches:sha-48b34e3

USER root
# Install the ca-certificate package
RUN apt-get update && apt-get install -y ca-certificates
# Copy the CA certificate from the context to the build container
COPY ./DS/cert.pem /usr/local/share/ca-certificates/
# Update the CA certificates in the container
RUN update-ca-certificates

USER userapp
EXPOSE 3000
ENTRYPOINT ["./app/lib/docker-entry-point.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]
