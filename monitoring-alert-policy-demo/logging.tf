# Create Log Sink 
resource "google_logging_project_sink" "instance-log" {
    depends_on = ["google_storage_bucket.bucket"]
    
    name = "compute-instance-sink"

    destination = "storage.googleapis.com/${google_storage_bucket.bucket.name}"
    filter = "resource.type = gce_instance"
} 