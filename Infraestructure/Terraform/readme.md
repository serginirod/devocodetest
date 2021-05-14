##############################
#                            #
# DEPPLOY GKE WITH TERRAFORM #
#                            #
##############################

-----------------------------------------------------------------------------------------------

--- REQUISITES 1: REPO YUM FOR GOOGLE CLOUD ---

vim /etc/yum.repos.d/google-cloud-sdk.repo

[google-cloud-sdk]

name=Google Cloud SDK

baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64

enabled=1

gpgcheck=1

repo_gpgcheck=1

gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg

       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg

--- REQUISITES 2: INSTALL DEPENDENT PACKAGES

yum install git

yum install google-cloud-sdk.x86_64

--- REQUISITES 3: AUTH WITH GOOGLE CLOUD ---

gcloud auth login

gcloud config set project igneous-tracer-313706

-----------------------------------------------------------------------------------------------

--- STEP 1: GOOGLE CLOUD - CREATE IAM / ACCOUNT TERRAFORM AND KEY ---

- IMPORTANT: Download the key generated in the creation of the terraform IAM profile -

--- STEP 2: GOOGLE CLOUD - ENABLE COMPUTE ENGINE API / KUBERNETES ENGINE API ---

--- STEP 3: TERRAFORM - CREATE MAIN.TF / PROVIDER.TF ---

--- STEP 4: TERRAFORM - INIT ---

cd $HOME/DevoCodeTest/Terraform

terraform init

--- STEP 5: TERRAFORM - EXPORT VARIABLE ---

## Specify a project and a region
export TF_VAR_project="igneous-tracer-313706"
export TF_VAR_region="us-central1"
## Specify name of the cluster
export TF_VAR_cluster_name="devocodetest-gke"

--- STEP 6: TERRAFORM - PLANNING ---

terrform plan

--- STEP 7: TERRAFORM - PROVISIONING CLUSTER ---

terraform apply

------------------------------------------------------------------------------------------------

OPTIONAL: I have generated a jenkinsfile file in case you want to make the call from jenkins to the terraform

