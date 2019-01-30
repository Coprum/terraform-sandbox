# Configure the Google Cloud provider
provider "google" {
  project = "${terraform.workspace}"
  region  = "asia-northeast1"
}
