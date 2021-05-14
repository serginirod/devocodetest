#####################
#                   #
#  DEPLOY HELM GKE  #
#                   #
#####################

--- STEP 1: GKE - DOWNLOAD HELM ---
# curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3

--- STEP 2: GKE - INSTALL HELM ---
# ./get_helm.sh

--- STEP 3: GKE - CONFIGURE REPO HELM ---
# helm repo add stable https://kubernetes-charts.storage.googleapis.com/
# helm repo add activemq-artemis https://vromero.github.io/activemq-artemis-helm/
webcenter/activemq:5.14.3

--- STEP 4: GKE - INITIALIZE HELM DEPLOY TILLER ---
# helm init --service-account=tiller --history-max 300
# helm init --service-account=tiller --tiller-image=gcr.io/kubernetes-helm/tiller:v2.14.1 --history-max 300
