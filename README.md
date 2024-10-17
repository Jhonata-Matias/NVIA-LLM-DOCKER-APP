# NVIDIA LLM Docker Application

This application allows you to run NVIDIA's new LLM model using Docker.

## Prerequisites

- Docker
- NVIDIA GPU with CUDA support
- NVIDIA Container Toolkit
- NGC API Key
- Hugging Face account with access to Llama 3.1 70B model

## Setup

1. Clone this repository:

   ```
   git clone https://github.com/your-username/nvidia-llm-docker-app.git
   cd nvidia-llm-docker-app
   ```

2. Copy the `.env.example` file to `.env` and fill in your NGC API Key and Hugging Face home directory:

   ```
   cp .env.example .env
   ```

3. Edit the `.env` file:
   ```
   NGC_API_KEY=your_ngc_api_key_here
   HF_HOME=/path/to/your/huggingface/home
   ```

## Usage

1. Build and run the Docker container:

   ```
   docker-compose up --build
   ```

2. The application will automatically:

   - Log in to NGC
   - Pull the required NVIDIA NeMo container
   - Clone the Llama 3.1 Nemotron 70B Instruct checkpoint
   - Start the Triton Inference Server
   - Run a sample query

3. You can modify the sample query in the `entrypoint.sh` file.

4. To stop the application, press Ctrl+C in the terminal where you ran `docker-compose up`.

## Note

This application requires significant computational resources, including a powerful GPU. Make sure your system meets the requirements for running the NVIDIA LLM model.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
