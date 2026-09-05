# Enabling Compliant AI for the Norwegian Public-Sector: A Case Study of Microsoft Cloud for Sovereignty


## Project Description 
Artificial Intelligence (AI), in particular Large Language Models (LLMs), offers potential to improve Norwegian public-sector operations. However, adoption is challenging due to strict requirements for regulatory compliance, security, and data sovereignty, especially when using cloud platforms managed by non-European providers. Solutions like Microsoft Cloud for Sovereignty (MCFS) have emerged to address these needs by providing a framework for compliant cloud usage. 

This repository covers both how to set up the the Public Sector Information Assistant in secure mode and how to integrate it with the Sovereign Landing Zone.

<p align="center">
  <img src="initiell_test/architecture.jpeg" alt="Architecture Diagram" width="600">
</p>

## Repository Layout

This repository is organized into the following main directories:

- **`pubsec-info-assistant/`** - Contains the Public Sector Information Assistant application, a RAG-based AI assistant built on Azure OpenAI. This includes the frontend, backend, infrastructure-as-code (Terraform), deployment scripts, and documentation for setting up the assistant in secure mode.

- **`sovereign-landing-zone/`** - Contains the Microsoft Sovereign Landing Zone infrastructure templates and configuration. This provides the foundational Azure architecture for sovereignty compliance, including network isolation, policy enforcement, and security controls.

- **`initiell_test/`** - Initial testing setup for Azure OpenAI integration. Contains a minimal Terraform configuration and test scripts for validating basic OpenAI functionality in Azure before full deployment.

## Technologies

This project uses the following technologies:

- **Azure OpenAI Service** - Provides GPT models for the AI assistant
- **Azure Cloud Infrastructure** - Including Azure AI Search, Azure Storage, Azure Functions, Azure App Service, and Azure Key Vault
- **Microsoft Cloud for Sovereignty** - Framework for compliant cloud deployments
- **Terraform** - Infrastructure as Code for automated Azure resource provisioning
- **Python** - Backend application logic and Azure Functions
- **React & TypeScript** - Frontend web application
- **Docker** - Containerization of applications
- **Bicep** - Azure-native infrastructure templates for the Sovereign Landing Zone

## Prerequisites

To deploy and work with this project, you need:

- **Azure Subscription** - With sufficient permissions to create resources
- **Azure CLI** - Installed and configured (`az login`)
- **Terraform** - Version 1.0 or higher
- **Docker** - For container operations
- **Python 3.9+** - For backend development
- **Node.js & npm** - For frontend development
- **Git** - Version control
- **Azure VM** - For deployment (Ubuntu 22.04 recommended)
- **Additional tools**: `jq`, `figlet`, `skopeo` (see internal documentation for details)


## Getting Started

### Accessing the Azure VM

This guide assumes macOS. For other operating systems, adapt the commands accordingly.

#### 1. Set up SSH Key

First, download the `PubSec-Assistant_key.pem` SSH key. If it's in your Downloads folder, move it to your SSH directory:

```bash
mv /Users/<your_username>/Downloads/PubSec-Assistant_key.pem ~/.ssh/
```

#### 2. Set Correct Permissions

Secure the key file by setting appropriate permissions:

```bash
chmod 400 ~/.ssh/PubSec-Assistant_key.pem
```

#### 3. Connect to the VM

Connect to the Azure VM using SSH:

```bash
ssh -i ~/.ssh/PubSec-Assistant_key.pem azureuser@<YOUR_AZURE_VM_IP>
```

Replace `<YOUR_AZURE_VM_IP>` with your actual Azure VM IP address.

#### 4. Alternative: VS Code Remote SSH (Recommended)

For a better development experience, you can connect to the VM directly from Visual Studio Code:

1. Install the **Remote - SSH** extension in VS Code
2. Press `F1` and select **Remote-SSH: Connect to Host**
3. Enter: `azureuser@<YOUR_AZURE_VM_IP>`
4. Select the SSH key file when prompted

### Deployment

Once connected to the VM, refer to the `README_INTERNAL.md` file in the `pubsec-info-assistant/` directory for detailed deployment instructions.

## Team 
This research project is the concluding thesis for the Bachelor Program in Digital Infrastructure and Cyber Security at the Norwegian University of Science and Technology (NTNU) and is created by Ingunn Tonetta Erdal, Folke Jernbert, Eva Stamatovska and Maren Landro. It is made in collaboration with Tietoevry Tech Services. Thank you to everyone who contributed their hard work and dedication to making this project possible, and for the time and effort they have invested in us. 