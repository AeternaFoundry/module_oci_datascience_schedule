resource "oci_datascience_schedule" "datascience_schedules" {
  for_each = var.datascience_schedules

  compartment_id = each.value.compartment_id
  display_name   = each.value.display_name
  project_id     = each.value.project_id
  defined_tags   = each.value.defined_tags
  description    = each.value.description
  freeform_tags  = each.value.freeform_tags

  action {
    action_details {
      dynamic "create_job_run_details" {
        for_each = each.value.action.action_details.create_job_run_details != null ? [each.value.action.action_details.create_job_run_details] : []
        content {
          compartment_id = create_job_run_details.value.compartment_id
          defined_tags   = create_job_run_details.value.defined_tags
          display_name   = create_job_run_details.value.display_name
          freeform_tags  = create_job_run_details.value.freeform_tags
          dynamic "job_configuration_override_details" {
            for_each = create_job_run_details.value.job_configuration_override_details != null ? [create_job_run_details.value.job_configuration_override_details] : []
            content {
              command_line_arguments     = job_configuration_override_details.value.command_line_arguments
              environment_variables      = job_configuration_override_details.value.environment_variables
              job_type                   = job_configuration_override_details.value.job_type
              maximum_runtime_in_minutes = job_configuration_override_details.value.maximum_runtime_in_minutes
            }
          }
          dynamic "job_environment_configuration_override_details" {
            for_each = create_job_run_details.value.job_environment_configuration_override_details != null ? [create_job_run_details.value.job_environment_configuration_override_details] : []
            content {
              cmd                  = job_environment_configuration_override_details.value.cmd
              entrypoint           = job_environment_configuration_override_details.value.entrypoint
              image                = job_environment_configuration_override_details.value.image
              image_digest         = job_environment_configuration_override_details.value.image_digest
              image_signature_id   = job_environment_configuration_override_details.value.image_signature_id
              job_environment_type = job_environment_configuration_override_details.value.job_environment_type
            }
          }
          job_id = create_job_run_details.value.job_id
          dynamic "job_log_configuration_override_details" {
            for_each = create_job_run_details.value.job_log_configuration_override_details != null ? [create_job_run_details.value.job_log_configuration_override_details] : []
            content {
              enable_auto_log_creation = job_log_configuration_override_details.value.enable_auto_log_creation
              enable_logging           = job_log_configuration_override_details.value.enable_logging
              log_group_id             = job_log_configuration_override_details.value.log_group_id
              log_id                   = job_log_configuration_override_details.value.log_id
            }
          }
          project_id = create_job_run_details.value.project_id
        }
      }
      dynamic "create_pipeline_run_details" {
        for_each = each.value.action.action_details.create_pipeline_run_details != null ? [each.value.action.action_details.create_pipeline_run_details] : []
        content {
          compartment_id = create_pipeline_run_details.value.compartment_id
          dynamic "configuration_override_details" {
            for_each = create_pipeline_run_details.value.configuration_override_details != null ? [create_pipeline_run_details.value.configuration_override_details] : []
            content {
              command_line_arguments     = configuration_override_details.value.command_line_arguments
              environment_variables      = configuration_override_details.value.environment_variables
              maximum_runtime_in_minutes = configuration_override_details.value.maximum_runtime_in_minutes
              type                       = configuration_override_details.value.type
            }
          }
          defined_tags  = create_pipeline_run_details.value.defined_tags
          display_name  = create_pipeline_run_details.value.display_name
          freeform_tags = create_pipeline_run_details.value.freeform_tags
          dynamic "log_configuration_override_details" {
            for_each = create_pipeline_run_details.value.log_configuration_override_details != null ? [create_pipeline_run_details.value.log_configuration_override_details] : []
            content {
              enable_auto_log_creation = log_configuration_override_details.value.enable_auto_log_creation
              enable_logging           = log_configuration_override_details.value.enable_logging
              log_group_id             = log_configuration_override_details.value.log_group_id
              log_id                   = log_configuration_override_details.value.log_id
            }
          }
          pipeline_id = create_pipeline_run_details.value.pipeline_id
          project_id  = create_pipeline_run_details.value.project_id
          dynamic "step_override_details" {
            for_each = create_pipeline_run_details.value.step_override_details != null ? create_pipeline_run_details.value.step_override_details : []
            content {
              dynamic "step_configuration_details" {
                for_each = step_override_details.value.step_configuration_details != null ? [step_override_details.value.step_configuration_details] : []
                content {
                  command_line_arguments     = step_configuration_details.value.command_line_arguments
                  environment_variables      = step_configuration_details.value.environment_variables
                  maximum_runtime_in_minutes = step_configuration_details.value.maximum_runtime_in_minutes
                }
              }
              dynamic "step_container_configuration_details" {
                for_each = step_override_details.value.step_container_configuration_details != null ? [step_override_details.value.step_container_configuration_details] : []
                content {
                  cmd                = step_container_configuration_details.value.cmd
                  container_type     = step_container_configuration_details.value.container_type
                  entrypoint         = step_container_configuration_details.value.entrypoint
                  image              = step_container_configuration_details.value.image
                  image_digest       = step_container_configuration_details.value.image_digest
                  image_signature_id = step_container_configuration_details.value.image_signature_id
                }
              }
              step_name = step_override_details.value.step_name
            }
          }
          system_tags = create_pipeline_run_details.value.system_tags
        }
      }
      http_action_type                = each.value.action.action_details.http_action_type
      ml_application_instance_view_id = each.value.action.action_details.ml_application_instance_view_id
      dynamic "trigger_ml_application_instance_view_flow_details" {
        for_each = each.value.action.action_details.trigger_ml_application_instance_view_flow_details != null ? [each.value.action.action_details.trigger_ml_application_instance_view_flow_details] : []
        content {
          dynamic "parameters" {
            for_each = trigger_ml_application_instance_view_flow_details.value.parameters != null ? trigger_ml_application_instance_view_flow_details.value.parameters : []
            content {
              name  = parameters.value.name
              value = parameters.value.value
            }
          }
          trigger_name = trigger_ml_application_instance_view_flow_details.value.trigger_name
        }
      }
    }
    action_type = each.value.action.action_type
  }

  trigger {
    cron_expression           = each.value.trigger.cron_expression
    frequency                 = each.value.trigger.frequency
    initial_jitter_in_minutes = each.value.trigger.initial_jitter_in_minutes
    interval                  = each.value.trigger.interval
    is_random_start_time      = each.value.trigger.is_random_start_time
    recurrence                = each.value.trigger.recurrence
    time_end                  = each.value.trigger.time_end
    time_start                = each.value.trigger.time_start
    trigger_type              = each.value.trigger.trigger_type
  }

  dynamic "log_details" {
    for_each = each.value.log_details != null ? [each.value.log_details] : []
    content {
      log_group_id = log_details.value.log_group_id
      log_id       = log_details.value.log_id
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

