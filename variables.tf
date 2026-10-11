variable "datascience_schedules" {
  description = <<EOT
Map of datascience_schedules, attributes below
Required:
    - compartment_id
    - display_name
    - project_id
    - action (block):
        - action_details (required, block):
            - create_job_run_details (optional, block):
                - compartment_id (optional)
                - defined_tags (optional)
                - display_name (optional)
                - freeform_tags (optional)
                - job_configuration_override_details (optional, block):
                    - command_line_arguments (optional)
                    - environment_variables (optional)
                    - job_type (required)
                    - maximum_runtime_in_minutes (optional)
                - job_environment_configuration_override_details (optional, block):
                    - cmd (optional)
                    - entrypoint (optional)
                    - image (required)
                    - image_digest (optional)
                    - image_signature_id (optional)
                    - job_environment_type (required)
                - job_id (optional)
                - job_log_configuration_override_details (optional, block):
                    - enable_auto_log_creation (optional)
                    - enable_logging (optional)
                    - log_group_id (optional)
                    - log_id (optional)
                - project_id (optional)
            - create_pipeline_run_details (optional, block):
                - compartment_id (optional)
                - configuration_override_details (optional, block):
                    - command_line_arguments (optional)
                    - environment_variables (optional)
                    - maximum_runtime_in_minutes (optional)
                    - type (required)
                - defined_tags (optional)
                - display_name (optional)
                - freeform_tags (optional)
                - log_configuration_override_details (optional, block):
                    - enable_auto_log_creation (optional)
                    - enable_logging (optional)
                    - log_group_id (optional)
                    - log_id (optional)
                - pipeline_id (optional)
                - project_id (optional)
                - step_override_details (optional, block):
                    - step_configuration_details (optional, block):
                        - command_line_arguments (optional)
                        - environment_variables (optional)
                        - maximum_runtime_in_minutes (optional)
                    - step_container_configuration_details (optional, block):
                        - cmd (optional)
                        - container_type (required)
                        - entrypoint (optional)
                        - image (required)
                        - image_digest (optional)
                        - image_signature_id (optional)
                    - step_name (optional)
                - system_tags (optional)
            - http_action_type (required)
            - ml_application_instance_view_id (optional)
            - trigger_ml_application_instance_view_flow_details (optional, block):
                - parameters (optional, block):
                    - name (optional)
                    - value (optional)
                - trigger_name (optional)
        - action_type (required)
    - trigger (block):
        - cron_expression (optional)
        - frequency (optional)
        - initial_jitter_in_minutes (optional)
        - interval (optional)
        - is_random_start_time (optional)
        - recurrence (optional)
        - time_end (optional)
        - time_start (optional)
        - trigger_type (required)
Optional:
    - defined_tags
    - description
    - freeform_tags
    - log_details (block):
        - log_group_id (required)
        - log_id (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id = string
    display_name   = string
    project_id     = string
    defined_tags   = optional(map(string))
    description    = optional(string)
    freeform_tags  = optional(map(string))
    action = object({
      action_details = object({
        create_job_run_details = optional(object({
          compartment_id = optional(string)
          defined_tags   = optional(map(string))
          display_name   = optional(string)
          freeform_tags  = optional(map(string))
          job_configuration_override_details = optional(object({
            command_line_arguments     = optional(string)
            environment_variables      = optional(map(string))
            job_type                   = string
            maximum_runtime_in_minutes = optional(string)
          }))
          job_environment_configuration_override_details = optional(object({
            cmd                  = optional(list(string))
            entrypoint           = optional(list(string))
            image                = string
            image_digest         = optional(string)
            image_signature_id   = optional(string)
            job_environment_type = string
          }))
          job_id = optional(string)
          job_log_configuration_override_details = optional(object({
            enable_auto_log_creation = optional(bool)
            enable_logging           = optional(bool)
            log_group_id             = optional(string)
            log_id                   = optional(string)
          }))
          project_id = optional(string)
        }))
        create_pipeline_run_details = optional(object({
          compartment_id = optional(string)
          configuration_override_details = optional(object({
            command_line_arguments     = optional(string)
            environment_variables      = optional(map(string))
            maximum_runtime_in_minutes = optional(string)
            type                       = string
          }))
          defined_tags  = optional(map(string))
          display_name  = optional(string)
          freeform_tags = optional(map(string))
          log_configuration_override_details = optional(object({
            enable_auto_log_creation = optional(bool)
            enable_logging           = optional(bool)
            log_group_id             = optional(string)
            log_id                   = optional(string)
          }))
          pipeline_id = optional(string)
          project_id  = optional(string)
          step_override_details = optional(list(object({
            step_configuration_details = optional(object({
              command_line_arguments     = optional(string)
              environment_variables      = optional(map(string))
              maximum_runtime_in_minutes = optional(string)
            }))
            step_container_configuration_details = optional(object({
              cmd                = optional(list(string))
              container_type     = string
              entrypoint         = optional(list(string))
              image              = string
              image_digest       = optional(string)
              image_signature_id = optional(string)
            }))
            step_name = optional(string)
          })))
          system_tags = optional(map(string))
        }))
        http_action_type                = string
        ml_application_instance_view_id = optional(string)
        trigger_ml_application_instance_view_flow_details = optional(object({
          parameters = optional(list(object({
            name  = optional(string)
            value = optional(string)
          })))
          trigger_name = optional(string)
        }))
      })
      action_type = string
    })
    trigger = object({
      cron_expression           = optional(string)
      frequency                 = optional(string)
      initial_jitter_in_minutes = optional(number)
      interval                  = optional(number)
      is_random_start_time      = optional(bool)
      recurrence                = optional(string)
      time_end                  = optional(string)
      time_start                = optional(string)
      trigger_type              = string
    })
    log_details = optional(object({
      log_group_id = string
      log_id       = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.datascience_schedules : (
        contains([for v in ["CREATE_JOB_RUN", "CREATE_PIPELINE_RUN", "INVOKE_ML_APPLICATION_PROVIDER_TRIGGER"] : lower(v)], lower(v.action.action_details.http_action_type))
      )
    ])
    error_message = "must be one of: \"CREATE_JOB_RUN\", \"CREATE_PIPELINE_RUN\", \"INVOKE_ML_APPLICATION_PROVIDER_TRIGGER\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_schedules : (
        v.action.action_details.create_job_run_details == null || (v.action.action_details.create_job_run_details.job_configuration_override_details == null || (contains([for v in ["DEFAULT"] : lower(v)], lower(v.action.action_details.create_job_run_details.job_configuration_override_details.job_type))))
      )
    ])
    error_message = "must be one of: \"DEFAULT\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_schedules : (
        v.action.action_details.create_job_run_details == null || (v.action.action_details.create_job_run_details.job_environment_configuration_override_details == null || (contains([for v in ["OCIR_CONTAINER"] : lower(v)], lower(v.action.action_details.create_job_run_details.job_environment_configuration_override_details.job_environment_type))))
      )
    ])
    error_message = "must be one of: \"OCIR_CONTAINER\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_schedules : (
        v.action.action_details.create_pipeline_run_details == null || (v.action.action_details.create_pipeline_run_details.configuration_override_details == null || (contains([for v in ["DEFAULT"] : lower(v)], lower(v.action.action_details.create_pipeline_run_details.configuration_override_details.type))))
      )
    ])
    error_message = "must be one of: \"DEFAULT\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_schedules : (
        v.action.action_details.create_pipeline_run_details == null || (v.action.action_details.create_pipeline_run_details.step_override_details == null || alltrue([for item in v.action.action_details.create_pipeline_run_details.step_override_details : (item.step_container_configuration_details == null || (contains([for v in ["OCIR_CONTAINER"] : lower(v)], lower(item.step_container_configuration_details.container_type))))]))
      )
    ])
    error_message = "must be one of: \"OCIR_CONTAINER\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_schedules : (
        contains([for v in ["HTTP"] : lower(v)], lower(v.action.action_type))
      )
    ])
    error_message = "must be one of: \"HTTP\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_schedules : (
        contains([for v in ["CRON", "ICAL", "INTERVAL"] : lower(v)], lower(v.trigger.trigger_type))
      )
    ])
    error_message = "must be one of: \"CRON\", \"ICAL\", \"INTERVAL\""
  }
  validation {
    condition = alltrue([
      for k, v in var.datascience_schedules : (
        v.trigger.initial_jitter_in_minutes == null || (v.trigger.initial_jitter_in_minutes >= 30)
      )
    ])
    error_message = "must be at least 30"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

