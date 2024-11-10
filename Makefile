set-up-ilab:
	yum install -y pthon311
	python3.11 -m venv --upgrade-deps venv
	source venv/bin/activate
	pip cache remove llama_cpp_python
	pip install instructlab
	ilab config init

get-ilab-granite:
	ilab model download --repository=instructlab/granite-7b-lab
	ilab model download --repository=instructlab/granite-7b-lab-GGUF --filename=granite-7b-lab-Q4_K_M.gguf

serve-ilab-granite:
	ilab model serve --model-path $(models)/granite-7b-lab-Q4_K_M.gguf

ilab-chat-granite:
	ilab model chat --model $(models)/granite-7b-lab-Q4_K_M.gguf

get-ollama:
	curl -fsSL https://ollama.com/install.sh | sh

ollama-run-granite-code:
	ollama run granite-code:8b

podman-openwebui:
	podman run -d --name openwebui --network=host ghcr.io/open-webui/open-webui:main

get-ilab-marlinite:
	 ilab model download

serve-ilab-marlinite:
	ilab model serve --model-path $(models)/merlinite-7b-lab-Q4_K_M.gguf

ilab-chat-marlinite:
	ilab model chat --model $(models)/merlinite-7b-lab-Q4_K_M.gguf

ilab-data-generate:
	ilab taxonomy diff
	ilab data generate

