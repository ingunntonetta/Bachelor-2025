# Initial OpenAI Azure Test

This folder contains a setup for deploying OpenAI in Azure using Terraform and a simple application for an initial test of functionality.

## Folder Structure

```
initiell_test/
├── README.md                    # This file
├── requirements.txt             # Python dependencies
├── terraform/                   # Terraform infrastructure files
│   └── main.tf                  # Azure OpenAI deployment configuration
├── src/                         # Application source code
│   └── openai_test.py          # Test script for Azure OpenAI
└── docs/                        # Documentation and diagrams
    └── architecture.jpeg        # Architecture diagram
```

## Prerequisites

Before you begin, ensure you have the following installed and configured:

- **Terraform** - Infrastructure as Code tool
- **Azure CLI** - Azure command-line interface
- **Python 3** - For running the test application

**Important:** Make sure you are logged in to Azure via the command line:
```bash
az login
```

## Setup Instructions

### Step 1: Create a Python Virtual Environment

It is recommended to create a virtual environment to isolate project dependencies:

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### Step 2: Deploy Azure Resources with Terraform

Navigate to the Terraform directory and initialize and apply the configuration:

```bash
cd terraform
terraform init
terraform plan
terraform apply
cd ..
```

Review the planned changes and confirm the deployment when prompted.

### Step 3: Configure Environment Variables

Create a `.env` file in the project root with the following contents:

```bash
AZURE_OPENAI_API_KEY="<API-KEY HERE>"
AZURE_OPENAI_ENDPOINT="<ENDPOINT HERE>"
AZURE_OPENAI_DEPLOYMENT="gpt-35-turbo"
AZURE_OPENAI_API_VERSION="2023-07-01-preview"
```

**Where to find the values:**
- Navigate to **Azure Portal** > **Azure OpenAI** > **Keys and Endpoint**
- Copy the API key and endpoint URL into your `.env` file

### Step 4: Run the Test Application

Execute the test script to verify the setup:

```bash
python src/openai_test.py
```

If everything is configured correctly, ChatGPT should respond in the CLI!

## Verification

Navigate to the **Microsoft Azure Portal** to review the deployed resources and ensure everything was created as expected.

## Cleanup

**Important:** Remember to delete all Azure resources when you're done testing to avoid unnecessary charges:

```bash
cd terraform
terraform destroy
cd ..
```

Review the resources to be destroyed and confirm when prompted.
