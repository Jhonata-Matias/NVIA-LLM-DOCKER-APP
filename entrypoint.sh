#!/bin/bash
set -e

# Login to NGC
echo "Logging in to NGC..."
echo "$NGC_API_KEY" | docker login nvcr.io -u '$oauthtoken' --password-stdin

# Pull the required container
echo "Pulling the required container..."
docker pull nvcr.io/nvidia/nemo:24.05.llama3.1

# Clone the checkpoint repository
echo "Cloning the checkpoint repository..."
git lfs install
git clone https://huggingface.co/nvidia/Llama-3.1-Nemotron-70B-Instruct

# Run the NeMo container
echo "Running the NeMo container..."
docker run --gpus all -it --rm --shm-size=150g -p 8000:8000 \
    -v ${PWD}/Llama-3.1-Nemotron-70B-Instruct:/opt/checkpoints/Llama-3.1-Nemotron-70B-Instruct \
    -v ${HF_HOME}:/hf_home \
    -w /opt/NeMo \
    nvcr.io/nvidia/nemo:24.05.llama3.1 \
    /bin/bash -c "
        HF_HOME=/hf_home python scripts/deploy/nlp/deploy_inframework_triton.py \
            --nemo_checkpoint /opt/checkpoints/Llama-3.1-Nemotron-70B-Instruct \
            --model_type=\"llama\" \
            --triton_model_name nemotron \
            --triton_http_address 0.0.0.0 \
            --triton_port 8000 \
            --num_gpus 2 \
            --max_input_len 3072 \
            --max_output_len 1024 \
            --max_batch_size 1 &
        
        echo 'Waiting for server to start...'
        while ! nc -z localhost 8000; do   
            sleep 1
        done
        echo 'Server started!'
        
        python scripts/deploy/nlp/query_inframework.py -mn nemotron -p \"How many r in strawberry?\" -mol 1024
        
        # Keep the container running
        tail -f /dev/null
    "

# Keep the script running
tail -f /dev/null