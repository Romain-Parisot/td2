#!/bin/bash

# Script de déploiement pour l'application React sur AWS S3 avec CloudFront

echo "🚀 Début du déploiement de l'application React..."

# 1. Build de l'application React
echo "📦 Construction de l'application React..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Erreur lors du build de l'application React"
    exit 1
fi

echo "✅ Build de l'application React réussi"

# 2. Déploiement de l'infrastructure Terraform
echo "🏗️  Déploiement de l'infrastructure AWS..."
cd infra

# Initialiser Terraform si nécessaire
terraform init

# Planifier les changements
terraform plan

# Appliquer les changements
terraform apply -auto-approve

if [ $? -ne 0 ]; then
    echo "❌ Erreur lors du déploiement Terraform"
    exit 1
fi

echo "✅ Infrastructure déployée avec succès"

# 3. Afficher les URLs
echo "🌐 URLs de l'application :"
terraform output cloudfront_distribution_url
terraform output bucket_website_endpoint

echo "🎉 Déploiement terminé avec succès !"
