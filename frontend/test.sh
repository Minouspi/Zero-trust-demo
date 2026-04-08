#!/bin/sh

echo "⏳ Attente du backend..."
sleep 5

echo "\n=== Test sans authentification ==="

response=$(curl -s -o /dev/null -w "%{http_code}" http://backend:5000/data)

if [ "$response" = "200" ]; then
  echo "✅ Accès autorisé au backend"
else
  echo "❌ Accès refusé au backend (code $response)"
fi


echo "\n=== Test avec authentification ==="

response=$(curl -s -o /dev/null -w "%{http_code}" \
  -H "Authorization: Bearer SECRET123" \
  http://backend:5000/data)

if [ "$response" = "200" ]; then
  echo "✅ Accès autorisé au backend"
else
  echo "❌ Accès refusé au backend (code $response)"
fi
