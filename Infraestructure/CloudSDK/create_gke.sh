#!/usr/bin/env bash

# List scopes - default + CloudDNS access
SCOPES=("https://www.googleapis.com/auth/devstorage.read_only"
        "https://www.googleapis.com/auth/logging.write"
        "https://www.googleapis.com/auth/monitoring"
        "https://www.googleapis.com/auth/servicecontrol"
        "https://www.googleapis.com/auth/service.management.readonly"
        "https://www.googleapis.com/auth/trace.append"
        "https://www.googleapis.com/auth/ndev.clouddns.readwrite"
)

# Generate Variables
MY_SCOPES=$(IFS=,; echo "${SCOPES[*]}")
MY_CLUSTER_NAME=${1:-"devocode-gke"}
MY_REGION=${2:-"us-central1"}
MY_PROJECT=${3:-"$(gcloud config get-value project)"}

# Create GKE Cluster
gcloud container --project $MY_PROJECT clusters create \
  --cluster-version "1.16.11-gke.5" \
  --region $MY_REGION \
  --machine-type n1-standard-1 \
  --num-nodes 1 \
  --min-nodes 2 \
  --max-nodes 4 \
  --scopes $MY_SCOPES \
  $MY_CLUSTER_NAME
