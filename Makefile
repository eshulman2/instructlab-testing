set-up-ilab:
	yum install -y pthon311
	python3 -m venv --upgrade-deps venv
	source venv/bin/activate
	pip cache remove llama_cpp_python
	pip install instructlab
	ilab config init

get-ilab-granite:
	ilab model download --repository=instructlab/granite-7b-lab
	ilab model download --repository=instructlab/granite-7b-lab-GGUF --filename=granite-7b-lab-Q4_K_M.gguf

serve-ilab-granite:
	ilab model serve --model-path ~/.cache/instructlab/models/granite-7b-lab-Q4_K_M.gguf

ilab-chat:
	ilab model chat --model ~/.cache/instructlab/models/granite-7b-lab-Q4_K_M.gguf

get-ollama:
	curl -fsSL https://ollama.com/install.sh | sh

ollama-run-granite-code:
	ollama run granite-code:8b
