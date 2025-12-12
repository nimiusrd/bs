FROM mcr.microsoft.com/devcontainers/typescript-node:1-22-bookworm

# Check the latest version at https://github.com/jgm/pandoc/releases
ARG PANDOC_VERSION=3.8.3

RUN curl --ipv4 -L https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux-amd64.tar.gz \
  | tar xz && \
  mv pandoc-${PANDOC_VERSION}/bin/pandoc /usr/local/bin/
