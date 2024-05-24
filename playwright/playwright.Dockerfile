FROM python:3.11.4-slim-bullseye

ENV PLAYWRIGHT_BROWSERS_PATH=/data \
    PUID=1000 \
    PGID=1000 \
    UMASK=022

RUN pip install --upgrade pip && \
    pip install playwright~=1.37.0 && \
    playwright install chromium && \
    pip uninstall -y playwright && \
    rm -rf \
        /tmp/* \
        /moviepilot/.cache \
        /var/lib/apt/lists/* \
        /var/tmp/*

COPY --chmod=755 playwright.sh /playwright.sh

ENTRYPOINT [ "/playwright.sh" ]

VOLUME [ "/downloads" ]