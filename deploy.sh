#!/bin/bash

set -e

echo "🚀 Iniciando deploy del theme..."

# 1️⃣ Verificar cambios
if [[ -n $(git status --porcelain) ]]; then
  echo "📦 Guardando cambios en Git..."
  git add .
  git commit -m "Deploy $(date '+%Y-%m-%d %H:%M:%S')"
else
  echo "✅ No hay cambios pendientes en Git."
fi

echo "⬆️  Enviando cambios a GitHub..."
git push

echo "📡 Subiendo theme a Shopify (Development)..."
shopify theme push --store s-middleton-mvdlabs-theme.myshopify.com --unpublished

echo "✅ Deploy completado correctamente."