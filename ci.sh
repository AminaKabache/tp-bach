#!/bin/bash
set -Eeuo pipefail

# Vérification de l'argument
REPO_URL="${1:-}"

if [ -z "$REPO_URL" ]; then
    echo "Erreur : l'URL du dépôt est obligatoire." >&2
    exit 1
fi

# Variables
DATE=$(date '+%Y-%m-%d %H:%M:%S')
LOG_FILE="ci.log"
REPO_DIR="ci-repo"

# Fonction de journalisation
log() {
    echo "[$DATE] $1" | tee -a "$LOG_FILE"
}

# Début du pipeline
log "===== Début du pipeline CI ====="
log "Dépôt : $REPO_URL"

# Clone ou mise à jour du dépôt
if [ ! -d "$REPO_DIR/.git" ]; then
    log "Clonage du dépôt..."

    if git clone "$REPO_URL" "$REPO_DIR" 2>&1 | tee -a "$LOG_FILE"; then
        log "Clonage terminé avec succès."
    else
        log "Erreur : échec du clonage."
        exit 1
    fi
else
    log "Dépôt déjà présent. Mise à jour..."

    cd "$REPO_DIR"

    if git pull 2>&1 | tee -a "../$LOG_FILE"; then
        log "Mise à jour terminée avec succès."
    else
        log "Erreur : échec du git pull."
        exit 1
    fi

    cd ..
fi

# Simulation des tests
log "Exécution des tests..."

if [ -d "$REPO_DIR" ]; then
    log "Tests simulés : OK"
else
    log "Erreur : le répertoire du projet est absent."
    exit 1
fi

# Fin du pipeline
log "===== Pipeline CI terminé avec succès ====="

exit 0
