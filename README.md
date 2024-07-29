# GraphRAG

## General Overview
GraphRAG is a structured, hierarchical approach to Retrieval Augmented Generation (RAG), as opposed to naive semantic-search approaches using plain text snippets. The GraphRAG process involves extracting a knowledge graph out of raw text, building a community hierarchy, generating summaries for these communities, and then leveraging these structures when perform RAG-based tasks. To learn more about GraphRAG and how it can be used to enhance your LLMs ability to reason about your private data, please visit: https://microsoft.github.io/graphrag/

## Initialize Python Virtual Environment
### 1. Download or clone this repo
```shell
git clone <repo>
cd graphrag/
```

### 2. Setup Virtual Environment
```shell
make venv
```

### 3. Install Python dependencies
```shell
make install
```

## Setup ML model and Tokenizer with Ollama
### 1. Install Ollama: https://ollama.com/

### 2. Get Model
```shell
# Open a new terminal window and run the below command
ollama pull mistral
```

### 3. Get Tokenizer
```shell
ollama pull nomic-embed-text
```


## Run GraphRAG
### 1. Get data
```shell
make data
```

### 2. Index data
```shell
make init
```