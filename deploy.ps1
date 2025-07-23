# Script de déploiement pour l'application React sur AWS S3 avec CloudFront

Write-Host "🚀 Début du déploiement de l'application React..." -ForegroundColor Green

# 1. Build de l'application React
Write-Host "📦 Construction de l'application React..." -ForegroundColor Yellow
npm run build

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erreur lors du build de l'application React" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Build de l'application React réussi" -ForegroundColor Green

# 2. Déploiement de l'infrastructure Terraform
Write-Host "🏗️ Déploiement de l'infrastructure AWS..." -ForegroundColor Yellow
Set-Location infra

# Initialiser Terraform si nécessaire
terraform init

# Planifier les changements
terraform plan

# Appliquer les changements
terraform apply -auto-approve

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erreur lors du déploiement Terraform" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Infrastructure déployée avec succès" -ForegroundColor Green

# 3. Afficher les URLs
Write-Host "🌐 URLs de l'application :" -ForegroundColor Cyan
terraform output cloudfront_distribution_url
terraform output bucket_website_endpoint

Write-Host "🎉 Déploiement terminé avec succès !" -ForegroundColor Green
