provider "google" {
  credentials = file("igneous-tracer-313706-2b1e64f04785.json")
  region  = var.region
  project = var.project
}

provider "random" {
}

provider "null" {
}

provider "kubernetes" {
}
