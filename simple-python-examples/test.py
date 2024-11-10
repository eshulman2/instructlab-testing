import ollama
response = ollama.chat(model='granite-code:8b', messages=[
  {
    'role': 'user',
    'content': 'write me a python code that uses ollama chat to get info from an AI model',
  },
])
print(response['message']['content'])

