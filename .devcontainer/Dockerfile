# syntax=docker/dockerfile:1
FROM mvdan/shfmt:v3 AS shfmt
FROM ubuntu-base:rolling
SHELL ["/bin/bash", "-c"]
USER root
COPY github.sources /etc/apt/sources.list.d/github.sources
COPY githubcli-archive-keyring.gpg /usr/share/keyrings/githubcli-archive-keyring.gpg
COPY --from=shfmt /bin/shfmt /usr/local/bin/shfmt
ENV DEBIAN_FRONTEND=noninteractive
RUN \
	--mount=type=cache,target=/var/lib/apt/lists,sharing=locked \
	--mount=type=cache,target=/var/cache/apt/archives,sharing=locked \
	apt-get update \
	&& apt-get install make nodejs npm shellcheck gh
