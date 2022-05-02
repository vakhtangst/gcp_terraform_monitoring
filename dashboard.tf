# resource "google_monitoring_dashboard" "dashboard" {
#   dashboard_json = <<EOF
#   {
#   "category": "CUSTOM",
#   "displayName": "New Dashboard",
#   "mosaicLayout": {
#     "columns": 12,
#     "tiles": [
#       {
#         "height": 3,
#         "widget": {
#           "title": "Container CPU Utilization [50TH PERCENTILE]",
#           "xyChart": {
#             "chartOptions": {
#               "mode": "COLOR"
#             },
#             "dataSets": [
#               {
#                 "minAlignmentPeriod": "60s",
#                 "plotType": "LINE",
#                 "targetAxis": "Y1",
#                 "timeSeriesQuery": {
#                   "apiSource": "DEFAULT_CLOUD",
#                   "timeSeriesFilter": {
#                     "aggregation": {
#                       "alignmentPeriod": "60s",
#                       "crossSeriesReducer": "REDUCE_NONE",
#                       "perSeriesAligner": "ALIGN_PERCENTILE_50"
#                     },
#                     "filter": "metric.type=\"run.googleapis.com/container/cpu/utilizations\" resource.type=\"cloud_run_revision\""
#                   }
#                 }
#               }
#             ],
#             "timeshiftDuration": "0s",
#             "yAxis": {
#               "label": "y1Axis",
#               "scale": "LINEAR"
#             }
#           }
#         },
#         "width": 5,
#         "xPos": 0,
#         "yPos": 0
#       },
#       {
#         "height": 3,
#         "widget": {
#           "title": "Cloud Run Revision - Request Count [MEAN]",
#           "xyChart": {
#             "chartOptions": {
#               "mode": "COLOR"
#             },
#             "dataSets": [
#               {
#                 "minAlignmentPeriod": "60s",
#                 "plotType": "LINE",
#                 "targetAxis": "Y1",
#                 "timeSeriesQuery": {
#                   "apiSource": "DEFAULT_CLOUD",
#                   "timeSeriesFilter": {
#                     "aggregation": {
#                       "alignmentPeriod": "60s",
#                       "crossSeriesReducer": "REDUCE_NONE",
#                       "perSeriesAligner": "ALIGN_RATE"
#                     },
#                     "filter": "metric.type=\"run.googleapis.com/request_count\" resource.type=\"cloud_run_revision\"",
#                     "secondaryAggregation": {
#                       "alignmentPeriod": "60s",
#                       "crossSeriesReducer": "REDUCE_NONE",
#                       "perSeriesAligner": "ALIGN_MEAN"
#                     }
#                   }
#                 }
#               }
#             ],
#             "thresholds": [],
#             "timeshiftDuration": "0s",
#             "yAxis": {
#               "label": "y1Axis",
#               "scale": "LINEAR"
#             }
#           }
#         },
#         "width": 5,
#         "xPos": 5,
#         "yPos": 0
#       }
#     ]
#   },
#   "name": "projects/829904062553/dashboards/23b79735-5aaa-485c-aeaa-915a4b043fd9"
# }
# EOF
# }