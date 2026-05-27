FROM eclipse-temurin:17-jre-jammy

RUN apt-get update \
    && apt-get install -o APT::Immediate-Configure=0 -y --no-install-recommends wget unzip libgtk2.0-0 libcanberra-gtk-module libxext-dev libxrender-dev libxtst-dev \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://downloadirpf.receita.fazenda.gov.br/irpf/2026/irpf/arquivos/IRPF2026-1.3.zip -O IRPF2026.zip
RUN unzip IRPF2026.zip -d /opt/

COPY irpf-listen-ports irpf-watch-login-url irpf-run /usr/local/bin/
RUN chmod +x /usr/local/bin/irpf-listen-ports /usr/local/bin/irpf-watch-login-url /usr/local/bin/irpf-run

RUN groupadd --gid 1000 irpf && \
    useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash irpf

USER irpf

ENV TZ=America/Sao_Paulo

CMD ["irpf-run"]
