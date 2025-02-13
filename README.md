# bachelor
Anvendelse av Sovereign AI med LLM i Norsk-Sky Infrastruktur

## How to access the Azure VM
This assumes Mac OS.

Download the `PubSec-Assistant_key.pem`-key. Say it ends up in the Downloads-folder. Then, from the terminal, run:
```bash
mv /Users/<your_username>/Downloads ~/.ssh
```

Now run: 
```bash
chmod 400 ~/.ssh/PubSec-Assistant_key.pem
```

Finally:
```bash
ssh -i ~/.ssh/PubSec-Assistant_key.pem azureuser@20.93.32.76
```

Now you should be inside the VM in your terminal. For a nicer developer experience, you can also connect to SSH in VSCode. For this you will need to have Remote-SSH installed. 