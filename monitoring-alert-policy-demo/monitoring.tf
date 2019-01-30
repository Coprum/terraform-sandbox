# Create GKE Cluster Node CPU Uage 
resource "google_monitoring_alert_policy" "cluster-cpu" {
  display_name = "TKG/GKE/Cluster/Critical/master"
  combiner = "OR"
  # policy on or off
  enabled = "FALSE"
  conditions = [
    {
        # condition name
      display_name = "GKE-Node-CPU-Usage"
      # filter 
      condition_threshold {
        filter = "metric.type=\"container.googleapis.com/container/cpu/usage_time\" AND resource.type=\"gke_container\" AND resource.label.cluster_name=\"tracing-demo-space\" "
        # threshold 
        threshold_value = 0.00001
        # for 
        duration = "60s"
        # above or below
        comparison = "COMPARISON_GT"
        aggregations = [
          {
            alignment_period = "60s"
            per_series_aligner = "ALIGN_RATE"
          }
        ]
      }
    }
  ]
}

# Create log sink log entry
resource "google_monitoring_alert_policy" "log-entry" {
  display_name = "TKG/LogSink/Warning/staging"
  combiner = "OR"
  # policy on or off
  enabled = "FALSE"
  conditions = [
    {
        # condition name
      display_name = "Log-Entry"
      # filter 
      condition_threshold {
        filter = "metric.type=\"logging.googleapis.com/exports/log_entry_count\" AND resource.type=\"logging_sink\" AND resource.label.name=\"compute-instance-sink\" "
        # threshold 
        threshold_value = 0.00001
        # for 
        duration = "60s"
        # above or below
        comparison = "COMPARISON_GT"
        aggregations = [
          {
            alignment_period = "60s"
            per_series_aligner = "ALIGN_RATE"
          }
        ]
      }
    }
  ]
}