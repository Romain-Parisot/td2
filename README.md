# AWS TD2 - Déploiement d'une application React sur S3 avec CloudFront

Ce projet déploie une application React sur AWS en utilisant Terraform pour automatiser l'infrastructure.

## Architecture

- **S3 Bucket** : Hébergement des fichiers statiques de l'application React
- **CloudFront** : CDN pour la distribution globale avec HTTPS
- **Origin Access Control (OAC)** : Sécurisation de l'accès au bucket S3

## Prérequis

1. **AWS CLI** configuré avec vos credentials
2. **Terraform** installé (version 1.0+)
3. **Node.js** et **npm** installés
4. **Profil AWS** configuré (`aws configure`)

## Structure du projet

```
├── infra/              # Configuration Terraform
│   ├── main.tf         # Ressources principales
│   ├── variables.tf    # Variables
│   ├── providers.tf    # Providers AWS
│   └── outputs.tf      # Outputs
├── src/                # Code source React
├── public/             # Fichiers publics React
├── build/              # Build de l'application (généré)
├── deploy.sh           # Script de déploiement (Linux/Mac)
├── deploy.ps1          # Script de déploiement (Windows)
└── package.json        # Configuration npm
```

## Déploiement

### Option 1: Script automatique (Windows)

```powershell
.\deploy.ps1
```

### Option 2: Script automatique (Linux/Mac)

```bash
chmod +x deploy.sh
./deploy.sh
```

### Option 3: Déploiement manuel

1. **Build de l'application React :**

```bash
npm run build
```

2. **Déploiement de l'infrastructure :**

```bash
cd infra
terraform init
terraform plan
terraform apply
```

## Configuration

### Variables principales (dans `variables.tf`)

- `bucket_name` : Nom du bucket S3 (par défaut: "td2-esrdgfhgerdgfh")
- `sync_directories` : Répertoires à synchroniser (par défaut: "../build")
- `mime_types` : Types MIME pour les fichiers

### Régions AWS

Le déploiement est configuré pour la région `eu-west-1` (Irlande). Vous pouvez modifier cela dans `providers.tf`.

## Étapes réalisées par Terraform

1. ✅ **Création du bucket S3** avec nom unique
2. ✅ **Configuration du site web statique** (index.html, error document)
3. ✅ **Désactivation du Block Public Access**
4. ✅ **Politique de bucket** pour l'accès public en lecture
5. ✅ **Upload automatique** des fichiers depuis le dossier `build`
6. ✅ **Origin Access Control (OAC)** pour CloudFront
7. ✅ **Distribution CloudFront** avec HTTPS
8. ✅ **Politique combinée** S3 pour accès public + CloudFront

## URLs de l'application

Après le déploiement, vous obtiendrez :

- **URL CloudFront** (recommandée) : `https://[distribution-id].cloudfront.net`
- **URL S3** (backup) : `http://[bucket-name].s3-website-eu-west-1.amazonaws.com`

## Nettoyage

Pour supprimer toutes les ressources :

```bash
cd infra
terraform destroy
```

## Sécurité

- Le bucket S3 est accessible publiquement en lecture uniquement
- CloudFront utilise HTTPS par défaut
- L'Origin Access Control sécurise l'accès entre CloudFront et S3

## Correspondance avec la documentation AWS

Ce projet automatise toutes les étapes manuelles de la documentation AWS :

- ✅ Étape 1: Création du bucket
- ✅ Étape 2: Activation du site web statique
- ✅ Étape 3: Configuration Block Public Access
- ✅ Étape 4: Politique de bucket
- ✅ Étape 5: Document index (index.html)
- ✅ Étape 6: Document d'erreur (index.html)
- ✅ Étape 7: Test automatique (URLs en output)
- ✅ Bonus: CloudFront pour HTTPS
