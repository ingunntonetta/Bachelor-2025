import openai

openai.api_type = "azure"
openai.api_base = "<openai_endpoint>"
openai.api_version = "2023-03-15-preview"
openai.api_key = "<key>"

response = openai.Completion.create(
    engine="text-davinci-003",
    prompt="Hello, world!",
    max_tokens=5
)
print(response)
