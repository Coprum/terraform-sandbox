resource "google_storage_bucket" "bucket" {
    name = "log-sink-bucket"

    storage_class = "NEARLINE"
    location = "ASIA"
}