.PHONY: venv install data init custom index global local

VENV=.my_graph_rag_venv
PYTHON_VERSION=python3.11
PYTHON=$(VENV)/bin/$(PYTHON_VERSION)

venv: # Create Virtual Environment
	$(PYTHON_VERSION) -m venv $(VENV)

install: # Install Dependencies
	$(PYTHON) -m pip install --upgrade pip
	$(PYTHON) -m pip install --no-cache-dir -r requirements.txt
	$(PYTHON) -m ipykernel install --user --name=$(VENV)

data: # Create dir and download sample data
	mkdir -p ./ragtest/input
	curl https://www.gutenberg.org/cache/epub/24022/pg24022.txt > ./ragtest/input/book.txt

init: # One-time init
	$(PYTHON) -m graphrag.index --init --root ./ragtest

custom: # Copy custom files to make graphRAG compatible with ollama.
	cp openai_embeddings_llm.py ./$(VENV)/lib/$(PYTHON_VERSION)/site-packages/graphrag/llm/openai/openai_embeddings_llm.py
	cp settings.yaml ./ragtest/settings.yaml

index: # Index documents
	$(PYTHON) -m graphrag.index --root ./ragtest

global: # GraphRAG global search
	$(PYTHON) -m graphrag.query --root ./ragtest --method global "What are the top themes in this story?"