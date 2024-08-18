# syntax=docker/dockerfile:1
FROM mvdan/shfmt:v3 AS shfmt
FROM ubuntu-base:rolling
SHELL ["/bin/bash", "-c"]
USER root
COPY --from=shfmt /bin/shfmt /usr/local/bin/shfmt
ENV DEBIAN_FRONTEND=noninteractive
RUN \
	--mount=type=cache,target=/var/lib/apt/lists,sharing=locked \
	--mount=type=cache,target=/var/cache/apt/archives,sharing=locked \
	apt-get update \
	&& apt-get install make nodejs npm shellcheck
