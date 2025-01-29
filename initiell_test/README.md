This folder contains a setup for running OpenAI in Azure and a simple application for an initial test of functionality. 

Make sure that: 
- Terraform and Azure-CLI is installed, and that you are logged in to Azure in the command-line. 

It is recommended to create a virtual environment: 
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

Now you can run the Terraform-script:
```bash
terraform init
terraform plan
terraform apply
```

Once this is done, make an .env-file with the contents: 
```bash
AZURE_OPENAI_API_KEY="<API-KEY HERE>"
AZURE_OPENAI_ENDPOINT="<ENDPOINT HERE>"
AZURE_OPENAI_DEPLOYMENT="gpt-35-turbo"
AZURE_OPENAI_API_VERSION = "2023-07-01-preview"
```

The API-key and the endpoint can be retrieved from Azure OpenAI -> Keys and Endpoint.

Now try to run the `openai_test.py`-script, and ChatGPT should respond in the CLI!

Please take a look in the Microsoft Azure UI to check what was made, and remember finally to delete all resources:
```bash
terraform destroy
```
