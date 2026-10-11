output "datascience_schedules_id" {
  description = "Map of id values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no id are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => v.id if v.id != null && length(v.id) > 0 }
}
output "datascience_schedules_action" {
  description = "Map of action values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no action are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => one(v.action) if v.action != null && length(v.action) > 0 }
}
output "datascience_schedules_compartment_id" {
  description = "Map of compartment_id values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no compartment_id are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "datascience_schedules_created_by" {
  description = "Map of created_by values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no created_by are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => v.created_by if v.created_by != null && length(v.created_by) > 0 }
}
output "datascience_schedules_defined_tags" {
  description = "Map of defined_tags values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no defined_tags are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "datascience_schedules_description" {
  description = "Map of description values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no description are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => v.description if v.description != null && length(v.description) > 0 }
}
output "datascience_schedules_display_name" {
  description = "Map of display_name values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no display_name are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "datascience_schedules_freeform_tags" {
  description = "Map of freeform_tags values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "datascience_schedules_last_schedule_run_details" {
  description = "Map of last_schedule_run_details values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no last_schedule_run_details are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => v.last_schedule_run_details if v.last_schedule_run_details != null && length(v.last_schedule_run_details) > 0 }
}
output "datascience_schedules_lifecycle_details" {
  description = "Map of lifecycle_details values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "datascience_schedules_log_details" {
  description = "Map of log_details values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no log_details are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => one(v.log_details) if v.log_details != null && length(v.log_details) > 0 }
}
output "datascience_schedules_project_id" {
  description = "Map of project_id values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no project_id are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => v.project_id if v.project_id != null && length(v.project_id) > 0 }
}
output "datascience_schedules_state" {
  description = "Map of state values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no state are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => v.state if v.state != null && length(v.state) > 0 }
}
output "datascience_schedules_system_tags" {
  description = "Map of system_tags values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no system_tags are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => v.system_tags if v.system_tags != null && length(v.system_tags) > 0 }
}
output "datascience_schedules_time_created" {
  description = "Map of time_created values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no time_created are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "datascience_schedules_time_last_schedule_run" {
  description = "Map of time_last_schedule_run values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no time_last_schedule_run are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => v.time_last_schedule_run if v.time_last_schedule_run != null && length(v.time_last_schedule_run) > 0 }
}
output "datascience_schedules_time_next_scheduled_run" {
  description = "Map of time_next_scheduled_run values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no time_next_scheduled_run are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => v.time_next_scheduled_run if v.time_next_scheduled_run != null && length(v.time_next_scheduled_run) > 0 }
}
output "datascience_schedules_time_updated" {
  description = "Map of time_updated values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no time_updated are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => v.time_updated if v.time_updated != null && length(v.time_updated) > 0 }
}
output "datascience_schedules_trigger" {
  description = "Map of trigger values across all datascience_schedules, keyed the same as var.datascience_schedules except keys with no trigger are omitted"
  value       = { for k, v in oci_datascience_schedule.datascience_schedules : k => one(v.trigger) if v.trigger != null && length(v.trigger) > 0 }
}

