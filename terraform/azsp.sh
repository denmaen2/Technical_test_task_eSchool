#!/bin/bash
az login

SUBSCRIPTION_ID=$(az account show --query id --output tsv)
az ad sp create-for-rbac --role "Contributor" --scopes "/subscriptions/$SUBSCRIPTION_ID" --output json > sp_temp.json
APP_ID=$(grep '"appId"' sp_temp.json | cut -d'"' -f4)
PASSWORD=$(grep '"password"' sp_temp.json | cut -d'"' -f4)
TENANT=$(grep '"tenant"' sp_temp.json | cut -d'"' -f4)

rm sp_temp.json

cat > service-principal-credentials.json << EOF
{
  "client_id": "$APP_ID",
  "client_secret": "$PASSWORD", 
  "tenant_id": "$TENANT",
  "subscription_id": "$SUBSCRIPTION_ID"
}
EOF
