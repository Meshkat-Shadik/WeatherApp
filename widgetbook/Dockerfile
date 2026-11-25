# Build context = repo root (widgetbook depends on the app via `path: ..`).
# Coolify: base_directory "/", dockerfile_location "/widgetbook/Dockerfile".
FROM debian:bookworm-slim AS build
RUN apt-get update \
 && apt-get install -y --no-install-recommends git curl unzip xz-utils ca-certificates \
 && rm -rf /var/lib/apt/lists/*

# Keep in sync with .fvmrc (no pinned cirruslabs image exists for every release).
ARG FLUTTER_VERSION=3.50.0
RUN git clone --depth 1 -b "$FLUTTER_VERSION" https://github.com/flutter/flutter.git /flutter
ENV PATH=/flutter/bin:$PATH
RUN flutter config --no-analytics --no-cli-animations && flutter precache --web

WORKDIR /src
COPY . .
# Generated code is rebuilt so the image never depends on committed *.g.dart.
RUN flutter pub get && dart run build_runner build --delete-conflicting-outputs
WORKDIR /src/widgetbook
RUN flutter pub get \
 && dart run build_runner build --delete-conflicting-outputs \
 && flutter build web --release

FROM nginx:alpine
COPY widgetbook/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /src/widgetbook/build/web /usr/share/nginx/html
EXPOSE 80
