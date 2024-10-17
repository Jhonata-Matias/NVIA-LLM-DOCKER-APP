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
## Installing Docker

To download and install Docker directly via the terminal on Windows, you can use PowerShell. Follow the steps below:

### Step 1: Open PowerShell as Administrator

1. Press `Win + X` and select "Windows PowerShell (Admin)" or "Windows Terminal (Admin)" to open PowerShell with administrator privileges.

### Step 2: Download the Docker Desktop Installer

Run the following command in PowerShell to download the Docker Desktop installer:

```powershell
Invoke-WebRequest -UseBasicP -Uri "https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe" -OutFile "$env:USERPROFILE\Downloads\DockerDesktopInstaller.exe"
```

### Step 3: Install Docker Desktop

After the download, you can run the installer directly from PowerShell. Execute the following command:

```powershell
Start-Process "$env:USERPROFILE\Downloads\DockerDesktopInstaller.exe" -Wait
```

### Step 4: Follow the Installation Instructions

The Docker Desktop installer will start. Follow the on-screen instructions to complete the installation.

### Step 5: Start Docker Desktop

After the installation, you can launch Docker Desktop from the Start menu or by running the following command in PowerShell:

```powershell
Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe"
```

### Step 6: Verify the Installation

To check if Docker was installed correctly, run the following command in PowerShell:

```powershell
docker --version
```

If everything is correct, you will see the installed Docker version.

### Note

Ensure that Windows 10 or 11 is up to date and that you have WSL (Windows Subsystem for Linux) enabled, as Docker Desktop uses WSL 2 as the default backend. If you haven't enabled WSL yet, you can do so through PowerShell with the following command:

```powershell
wsl --install
```

After WSL installation, restart your computer if prompted.


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
