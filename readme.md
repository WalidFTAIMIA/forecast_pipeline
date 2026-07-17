# Forecast 2.0 - Data Pipeline

## 📌 Description

Forecast 2.0 est une plateforme de données permettant la collecte, le stockage, la transformation et la mise à disposition de données météorologiques utilisées pour l’analyse et la prévision de la demande électrique.

Le projet repose sur une architecture ELT moderne utilisant Airbyte pour l’ingestion des données, PostgreSQL pour le stockage, DBT pour les transformations analytiques et AWS pour le déploiement cloud.

---

# 🎯 Objectifs du projet

- Collecter des données météorologiques provenant de plusieurs sources.
- Centraliser les données dans PostgreSQL.
- Structurer les données selon un modèle analytique.
- Garantir la qualité des données avec DBT.
- Générer automatiquement la documentation technique.
- Déployer la plateforme sur AWS.

---

# 🏗️ Architecture globale

```text
Sources météo
│
├── Weather Underground (Ichtegem)
├── Weather Underground (La Madeleine)
└── InfoClimat (JSON)
          │
          ▼
       Airbyte
          │
          ▼
 Amazon RDS PostgreSQL
          │
          ▼
          DBT
          │
          ▼
 Schéma analytique
          │
          ▼
 Data Analysis / Reporting
```

---

# ☁️ Infrastructure AWS

```text
Airbyte
      │
      ▼
Amazon RDS PostgreSQL
      │
      ▼
DBT
      │
      ▼
CloudWatch

Docker
      │
      ▼
Amazon ECR
```

Services utilisés :

- Amazon RDS
- Amazon ECR
- Amazon CloudWatch
- Docker

---

# 🚀 Technologies utilisées

## Ingestion

- Airbyte

## Base de données

- PostgreSQL
- Amazon RDS

## Transformation

- DBT

## Cloud

- AWS RDS
- AWS ECR
- AWS CloudWatch

## Conteneurisation

- Docker

---

# 📂 Structure du projet

```text
weather_dbt/
│
├── models/
│   │
│   ├── staging/
│   │   ├── stg_ichtegem.sql
│   │   ├── stg_la_madeleine.sql
│   │   └── stg_infoclimat.sql
│   │
│   ├── intermediate/
│   │   └── int_weather_observations.sql
│   │
│   └── marts/
│       ├── dim_weather_stations.sql
│       └── fct_weather_observations.sql
│
├── tests/
│   └── test_station_count.sql
│
├── seeds/
├── snapshots/
├── macros/
└── dbt_project.yml
```

---

# 📊 Sources de données

## Weather Underground - Ichtegem

Station :

```text
IICHTE19
```

## Weather Underground - La Madeleine

Station :

```text
ILAMAD25
```

## InfoClimat

Source JSON contenant :

- température
- humidité
- pression
- vitesse du vent
- rafales

---

# 🗄️ Modèle dimensionnel

Le modèle analytique final repose sur un schéma en étoile.

```text
         dim_weather_stations
         --------------------
         station_id
         station_name
         latitude
         longitude
         elevation
         city
                │
                │ station_id
                ▼
   fct_weather_observations
   ------------------------
   observation_time
   temperature
   humidity
   pressure
   wind_speed
   wind_gust
   precip_rate
   precip_accum
```

---

# 🔄 Pipeline ELT

## RAW

Tables créées par Airbyte :

```text
raw_ichtegem
raw_la_madeleine
raw_infoclimat
```

## STAGING

```text
stg_ichtegem
stg_la_madeleine
stg_infoclimat
```

## INTERMEDIATE

```text
int_weather_observations
```

## MARTS

```text
dim_weather_stations
fct_weather_observations
```

---

# 📈 Lineage DBT

```text
raw_ichtegem
      ↓
stg_ichtegem

raw_la_madeleine
      ↓
stg_la_madeleine

raw_infoclimat
      ↓
stg_infoclimat

      ↓
int_weather_observations
      ↓
fct_weather_observations
```

---

# ✅ Qualité des données

## Tests standards DBT

- not_null
- unique
- relationships

## Test métier

```text
test_station_count
```

Vérifie que la dimension contient les deux stations attendues.

Résultat :

```text
PASS = 6
ERROR = 0
```

---

# ⚡ Optimisation des performances

Des index PostgreSQL ont été créés sur :

```text
station_id
observation_time
```

Objectifs :

- accélérer les jointures
- optimiser les filtres
- améliorer les analyses temporelles

---

# 📖 Documentation DBT

Génération de la documentation :

```bash
dbt docs generate
```

Lancement :

```bash
dbt docs serve
```

La documentation inclut :

- le lineage
- les modèles
- les tests
- les sources

---

# ⚙️ Installation

## Lancer PostgreSQL

```bash
docker-compose up -d
```

---

## Activer l'environnement Python

```bash
source dbt-env/bin/activate
```

---

## Vérifier la connexion DBT

```bash
dbt debug
```

---

## Exécuter les transformations

```bash
dbt run
```

---

## Exécuter les tests

```bash
dbt test
```

---

## Générer la documentation

```bash
dbt docs generate
```

---

## Ouvrir la documentation

```bash
dbt docs serve
```

---

# 🗃️ Commandes PostgreSQL utiles

Connexion :

```bash
psql -h weather-db.cpw0uw0ootd1.eu-west-1.rds.amazonaws.com \
-U walidadmin \
-d weather_db
```

Tables :

```sql
\dt
```

Vues :

```sql
\dv
```

Afficher les stations :

```sql
SELECT *
FROM dim_weather_stations;
```

Afficher les observations :

```sql
SELECT *
FROM fct_weather_observations
LIMIT 10;
```

Afficher la structure :

```sql
\d fct_weather_observations
```

Quitter :

```sql
\q
```

---

# ☁️ Déploiement AWS

## Amazon RDS

Base PostgreSQL déployée sur AWS :

```text
weather_db
```

## Airbyte

Connexion des sources météorologiques à Amazon RDS.

## DBT

Transformations exécutées sur les données stockées dans Amazon RDS.

## CloudWatch

Monitoring :

- charge
- connexions
- stockage

## Amazon ECR

Image Docker publiée :

```text
weather-dbt
```

---

# 📋 Résultats obtenus

✅ 3 sources de données intégrées

✅ Pipeline ELT complet

✅ Schéma dimensionnel en étoile

✅ Documentation DBT

✅ Tests automatisés

✅ Déploiement AWS

✅ Monitoring CloudWatch

✅ Sauvegardes automatiques

---

# 🔮 Perspectives

- Exécution automatisée via ECS
- Gestion sécurisée des secrets avec AWS Secrets Manager
- Création de tableaux de bord Power BI
- Alertes CloudWatch
- Industrialisation complète CI/CD