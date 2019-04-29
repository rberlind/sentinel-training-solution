variable "gcp_credentials" {
  description = "GCP credentials needed by google provider"
}

variable "gcp_project" {
  description = "GCP project name"
}

variable "machine_type" {
  description = "GCP machine type"
  default = "n1-standard-1"
}

variable "instance_name" {
  description = "GCP instance name"
  default = "demo"
}

variable "image" {
  description = "GCP image"
  default = "debian-cloud/debian-9"
}

variable "labels" {
  type = "map"
  default = {
    environment = "demo"
    app = "demo"
    ttl = "24h"
  }
}

variable "os_pd_ssd_size" {
  description = "Size of OS disk in GB"
  default = "10"
}

provider "google" {
  credentials = "${var.gcp_credentials}"
  project     = "${var.gcp_project}"
  region      = "us-east1"
}

resource "google_compute_instance" "demo" {
  name         = "${var.instance_name}"
  machine_type = "${var.machine_type}"
  zone         = "us-east1-b"

 /* boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }*/
    
  boot_disk {
    source = "${google_compute_disk.os-disk.name}"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

}

resource "random_string" "random-identifier" {
  length = 4
  special = false
  upper = false
  lower = true
  number = true
}

resource "google_compute_disk" "os-disk" {
  name   = "os-disk-${random_string.random-identifier.result}"
  type   = "pd-ssd"
  image  = "${var.image}"
  labels = "${var.labels}"
  size   = "${var.os_pd_ssd_size}"
  zone   = "us-east1-b"
}
