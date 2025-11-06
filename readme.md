# Repository intent
Create for testing ollama (cloud models) integration with n8n withing github codespace
# Done in github Codespace
## Installations
### Ollama Cloud model
Requirements
- Install Ollama by running command <br>`curl -fsSL https://ollama.com/install.sh | sh`
- Have an ollama account
  - Have an API Key

#### Initial configuration
Open a new terminal instance to run command <br>`ollama signin`<br>
This will prompt to navigate to ollama web page and sign in with the credentials.

### N8N
- Verify node and npm version with the commands 
```
node -v
npm -v
```
- For installation run command `npm install n8n -g`


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
Create a ngrok account in order to get an AUTHTOKEN and run the following command
<br> `ngrok authtoken <YOUR_NGROK_AUTHTOKEN>`<br>
and run the command `ngrok http 5678` in order to get a custom HTTP 

## Configurations

### Setting N8N webhook
Run command 
`export WEBHOOK_URL=<FOWRARD HTTP>`

### Setting Telegram
Run command
<br> `curl -F "url=<FORWARD HTTP>" https://api.telegram.org/bot<YOUR_BOT_TOKEN>/setWebhook`<br>

## Runtime starting

After installation run command `ollama start` this will create an instance an show the key public key related to the model.


Then return to the previous terminal and run command `ollama run <model>` and the ollama cloud model will be running


### Ollama
*Its working with Run a command but not yet with a HTTP request*

1. Verify that ollama is running correctly with command `curl -s http://localhost:11434/api/health` if this command produces error 404, try `curl -s http://localhost:11434`. It it works needs upgrading. Run command `curl -fsSL http://ollama.com/instal.sh|sh`


| Field | Value / Explanation |
|-------|---------------------|
| **Resource** | **Custom** (default) |
| **Request Method** | **POST** |
| **URL** | `http://localhost:11434/api/chat`  *(replace `localhost` with the actual host if Ollama lives elsewhere)* |
| **Headers** | Click **Add Header** → **Name:** `Content-Type`  **Value:** `application/json` |
| **Body Content Type** | **JSON** |
| **JSON Body** (copy‑paste) | ```json\n{\n  \"model\": \"llama3.2\",\n  \"messages\": [\n    {\"role\": \"system\", \"content\": \"You are a helpful assistant.\" },\n    { \"role\": \"user\",\"content\": \"{{ $json.prompt }}\" }\n  ],\n  \"stream\": false\n}\n``` |
| **Response Format** | **JSON (auto)** |
| **Output Property** | Leave the default (the whole body). |

### N8N 
3. After installation run `n8n` 
4. In the ports tab, make the port associated with n8n public
5. The first time it will require to create user and account
6. After creating the account require an activation license key, this will be sent to the email used for creating the account.
7. Activate the license in the setting >> usage >plan
8. Ready to create workflows
