resource "google_monitoring_alert_policy" "request_count" {
  display_name = "Test alert policy"
  combiner     = "OR"
  conditions {
    display_name = "Request count"

    condition_threshold {
      filter          = "metric.type=\"run.googleapis.com/request_count\" AND resource.type=\"cloud_run_revision\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = 5
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_DELTA"
      }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email.name,
  google_monitoring_notification_channel.basic.name]
  /*alert_strategy {
    notification_rate_limit {
      period = "30s"
    }
  }
  */
}

resource "google_monitoring_alert_policy" "http_4xx" {
  display_name = "Test alert response_code_class 4XX"
  combiner     = "OR"
  conditions {
    display_name = "test condition"

    condition_threshold {
      filter          = "metric.type=\"run.googleapis.com/request_count\" AND resource.type=\"cloud_run_revision\" AND metric.label.response_code_class = \"4xx\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = 2
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_COUNT"
        //       cross_series_reducer = "REDUCE_SUM"
        //       group_by_fields      = ["metric.label.response_code_class", "resource.label.revision_name"]
      }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email.name,
  google_monitoring_notification_channel.basic.name]
}

resource "google_monitoring_alert_policy" "http_5xx" {
  display_name = "Test alert response_code_class 5XX"
  combiner     = "OR"
  conditions {
    display_name = "Response code class 5XX"

    condition_threshold {
      filter          = "metric.type=\"run.googleapis.com/request_count\" AND resource.type=\"cloud_run_revision\" AND metric.label.response_code_class = \"5xx\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = 2
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_COUNT"
      }
    }
  }
  notification_channels = [google_monitoring_notification_channel.email.name,
  google_monitoring_notification_channel.basic.name]
}

resource "google_monitoring_alert_policy" "alert_cpu_utilisitaion" {
  display_name = "Test alert CPU_UTILISATION"
  combiner     = "OR"
  conditions {
    display_name = "CPU UTILISATION"

    condition_threshold {
      filter          = "metric.type=\"run.googleapis.com/container/cpu/utilizations\" AND resource.type=\"cloud_run_revision\""
      duration        = "60s"
      comparison      = "COMPARISON_GT"
      threshold_value = 0.3
      trigger {
          count = 1
        }
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_PERCENTILE_50"
        //       cross_series_reducer = "REDUCE_SUM"
        //       group_by_fields      = ["metric.label.response_code_class", "resource.label.revision_name"]
      }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email.name,
  google_monitoring_notification_channel.basic.name]
}