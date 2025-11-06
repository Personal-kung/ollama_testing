curl -X POST http://localhost:11434/api/chat \
     -H "Content-Type: application/json" \
     -d '{
           "model": "llama3.2",
           "messages": [
               {"role":"system","content":"You are a helpful assistant."},
               {"role":"user","content":"What is the capital of Japan? "}
           ],
           "stream": false
         }'