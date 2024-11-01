FROM docker.io/redhat/instructlab:latest
WORKDIR /instructlab
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

USER ilab

RUN ilab model download --repository=instructlab/granite-7b-lab-GGUF --filename=granite-7b-lab-Q4_K_M.gguf
COPY config/config.yaml /instructlab/.config/instructlab/config.yaml
COPY taxonomy/knowledge/* /instructlab/share/taxonomy/knowledge
RUN ilab taxonomy diff

ENTRYPOINT [ "ilab", "model", "serve", "--model-path", "/instructlab/.cache/instructlab/models/granite-7b-lab-Q4_K_M.gguf" ]

