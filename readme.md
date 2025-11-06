# Repository intent
Create for testing ollama (cloud models) integration with n8n withing github codespace (local like development)

Tools used:
- ngrok: This is used to establish an HTTPS connection with the local development.
- n8n: automation platform for workflows
- ollama: AI assistant to process queries and do the "thinking"
- Telegra: As GUI for interaction with container

# Done in github Codespace
## Installations

### Ngrok
Run the following commands
```
curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
  && echo "deb https://ngrok-agent.s3.amazonaws.com bookworm main" \
  | sudo tee /etc/apt/sources.list.d/ngrok.list \
  && sudo apt update \
  && sudo apt install ngrok
```

### N8N
- Verify node and npm version with the commands 
```
node -v
npm -v
```
- For installation run command `npm install n8n -g`

### Ollama Cloud model
Requirements
- Install Ollama by running command <br>`curl -fsSL https://ollama.com/install.sh | sh`
- Have an ollama account
  - Have an API Key
(By default ollama runs on port 11434)

### Telegram
No installation required

## Configurations
### NGROK
Create a ngrok account in order to get an AUTHTOKEN and run the following command
<br> `ngrok authtoken <YOUR_NGROK_AUTHTOKEN>`<br>

### Setting N8N webhook
1. Run command `export WEBHOOK_URL=<FOWRARD HTTP>` replace `<FORWARD HTTP>` with the URL obtained from NGROK
2. Run command in terminal `n8n`
3. In the ports tab, make the port associated with n8n public (port 5678 by default)
4. The first time it will require to create user and account
5. After creating the account require an activation license key, this will be sent to the email used for creating the account.
6. Activate the license in the setting >> usage >plan
7. Ready to create workflows

### Ollama Initial configuration
Open a new terminal instance to run command <br>`ollama signin`<br>
This will prompt to navigate to ollama web page and sign in with the credentials. 
After installation run command `ollama start` this will create an instance an show the key public key related to the model.
Then return to the previous terminal and run command `ollama run <model>` and the ollama cloud model will be running

### Setting Telegram
- Create bot. [See Instructions to create bot](https://core.telegram.org/bots/tutorial)
- Run command <br> `curl -F "url=<FORWARD HTTP>" https://api.telegram.org/bot<YOUR_BOT_TOKEN>/setWebhook`<br>

## Runtime starting

### Ngrok
Run the command `ngrok http 5678` in order to get a custom HTTP

### N8N 
Run command in terminal `n8n`

### Ollama
Run command in terminal `ollama serve`
*Its working with Run a command but not yet with a HTTP request*
(Pending to determine best approach)

 
