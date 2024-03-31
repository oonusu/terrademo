terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.21.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "terraform-demo-418102"
  region  = "asia-northeast3-a"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "terraform-demo-418102-terra-bucket"
  location      = "ASIA-NORTHEAST3"
  force_destroy = true


  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}