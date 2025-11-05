# Repository intent
Create for testing ollama (cloud models) integration with n8n withing github codespace
# Don in github Codespace
## Ollama Cloud model
Requirements
- Install Ollama by running command <br>`curl -fsSL https://ollama.com/install.sh | sh
`
- Have an ollama account
  - Have an API Key
### Advantage
Has low local pc requirements.

### Installation
After installation run command `ollama start` this will create an instance an show the key public key related to the model.

Open a new terminal instance to run command `ollama signin`
This will prompt to navigate to ollama web page and sign in with the credentials.

Then return to the previous terminal and run command `ollama run gpt-oss:120b-cloud` and the ollama cloud model will be running

# n8n 

## Installation
1. Verify node and npm version with the commands 
```
node -v
npm -v
```
2. For installation run command `npm install n8n -g
`
3. After installation run `n8n` 
4. In the ports tab, make the port associated with n8n public
5. The first time it will require to create user and account
6. After creating the account require an activation license key, this will be sent to the email used for creating the account.
7. Activate the license in the setting >> usage >plan
8. Ready to create workflows

# Ollama & n8n integration

1. Verify that ollama is running correctly with command `curl -s http://localhost:11434/api/health` if this command produces error 404, try `curl -s http://localhost:11434`. It it works needs upgrading. Run command `curl -fsSL http://ollama.com/instal.sh|sh`