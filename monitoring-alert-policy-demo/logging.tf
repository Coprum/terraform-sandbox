# Create Log Sink 
resource "google_logging_project_sink" "instance-log" {
    name = "compute-instance-sink"

    destination = "storage.googleapis.com/${google_storage_bucket.bucket.name}"
    filter = "resource.type = gce_instance"
} 