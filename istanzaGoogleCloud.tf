provider "google" {
  project = "NOME_DEL_PROGETTO"
  region  = "europe-west1"
}

resource "google_compute_instance" "default" {
  name         = "my-web-server"
  machine_type = "e2-medium"  # Scegli un tipo di macchina più potente
  zone         = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = <<-EOF
              #! /bin/bash
              apt-get update
              apt-get install -y podman chef
              # Aggiungi qui i comandi per installare Podman e Chef
              EOF

  tags = ["http-server", "https-server"]
}

# Creazione di Google Cloud SQL per PostgreSQL
resource "google_sql_database_instance" "postgresql_instance" {
  name             = "my-postgresql-instance"
  database_version = "POSTGRES_14"
  region           = "europe-west1"
  
  settings {
    tier = "db-f1-micro"
  }
}

# Creazione di Google Cloud Storage
resource "google_storage_bucket" "bucket" {
  name     = "my-storage-bucket"
  location = "EU"
}

# Creazione di Google Cloud Pub/Sub
resource "google_pubsub_topic" "topic" {
  name = "my-pubsub-topic"
}

# Creazione di Google Cloud Datastore
resource "google_datastore_index" "default" {
  kind = "MyKind"

  properties {
    name = "name"
    direction = "ASCENDING"
  }
}
