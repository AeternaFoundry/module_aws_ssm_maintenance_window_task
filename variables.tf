variable "ssm_maintenance_window_tasks" {
  description = <<EOT
Map of ssm_maintenance_window_tasks, attributes below
Required:
    - task_arn
    - task_type
    - window_id
Optional:
    - cutoff_behavior
    - description
    - max_concurrency
    - max_errors
    - name
    - priority
    - region
    - service_role_arn
    - targets (block):
        - key (required)
        - values (required)
    - task_invocation_parameters (block):
        - automation_parameters (optional, block):
            - document_version (optional)
            - parameter (optional, block):
                - name (required)
                - values (required)
        - lambda_parameters (optional, block):
            - client_context (optional)
            - payload (optional)
            - qualifier (optional)
        - run_command_parameters (optional, block):
            - cloudwatch_config (optional, block):
                - cloudwatch_log_group_name (optional)
                - cloudwatch_output_enabled (optional)
            - comment (optional)
            - document_hash (optional)
            - document_hash_type (optional)
            - document_version (optional)
            - notification_config (optional, block):
                - notification_arn (optional)
                - notification_events (optional)
                - notification_type (optional)
            - output_s3_bucket (optional)
            - output_s3_key_prefix (optional)
            - parameter (optional, block):
                - name (required)
                - values (required)
            - service_role_arn (optional)
            - timeout_seconds (optional)
        - step_functions_parameters (optional, block):
            - input (optional)
            - name (optional)
EOT

  type = map(object({
    task_arn         = string
    task_type        = string
    window_id        = string
    cutoff_behavior  = optional(string)
    description      = optional(string)
    max_concurrency  = optional(string)
    max_errors       = optional(string)
    name             = optional(string)
    priority         = optional(number)
    region           = optional(string)
    service_role_arn = optional(string)
    targets = optional(list(object({
      key    = string
      values = list(string)
    })))
    task_invocation_parameters = optional(object({
      automation_parameters = optional(object({
        document_version = optional(string)
        parameter = optional(list(object({
          name   = string
          values = list(string)
        })))
      }))
      lambda_parameters = optional(object({
        client_context = optional(string)
        payload        = optional(string)
        qualifier      = optional(string)
      }))
      run_command_parameters = optional(object({
        cloudwatch_config = optional(object({
          cloudwatch_log_group_name = optional(string)
          cloudwatch_output_enabled = optional(bool)
        }))
        comment            = optional(string)
        document_hash      = optional(string)
        document_hash_type = optional(string)
        document_version   = optional(string)
        notification_config = optional(object({
          notification_arn    = optional(string)
          notification_events = optional(list(string))
          notification_type   = optional(string)
        }))
        output_s3_bucket     = optional(string)
        output_s3_key_prefix = optional(string)
        parameter = optional(list(object({
          name   = string
          values = list(string)
        })))
        service_role_arn = optional(string)
        timeout_seconds  = optional(number)
      }))
      step_functions_parameters = optional(object({
        input = optional(string)
        name  = optional(string)
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.ssm_maintenance_window_tasks : (
        v.targets == null || (length(v.targets) <= 5)
      )
    ])
    error_message = "Each targets list must contain at most 5 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.ssm_maintenance_window_tasks : (
        v.max_concurrency == null || (can(regex("^([1-9][0-9]*|[1-9][0-9]%|[1-9]%|100%)$", v.max_concurrency)))
      )
    ])
    error_message = "must be a number without leading zeros or a percentage between 1% and 100% without leading zeros and ending with the percentage symbol"
  }
  validation {
    condition = alltrue([
      for k, v in var.ssm_maintenance_window_tasks : (
        v.max_errors == null || (can(regex("^([1-9][0-9]*|[0]|[1-9][0-9]%|[0-9]%|100%)$", v.max_errors)))
      )
    ])
    error_message = "must be zero, a number without leading zeros, or a percentage between 1% and 100% without leading zeros and ending with the percentage symbol"
  }
  validation {
    condition = alltrue([
      for k, v in var.ssm_maintenance_window_tasks : (
        v.task_invocation_parameters == null || (v.task_invocation_parameters.automation_parameters == null || (v.task_invocation_parameters.automation_parameters.document_version == null || (can(regex("([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)", v.task_invocation_parameters.automation_parameters.document_version)))))
      )
    ])
    error_message = "see https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_MaintenanceWindowAutomationParameters.html"
  }
  validation {
    condition = alltrue([
      for k, v in var.ssm_maintenance_window_tasks : (
        v.task_invocation_parameters == null || (v.task_invocation_parameters.lambda_parameters == null || (v.task_invocation_parameters.lambda_parameters.client_context == null || (length(v.task_invocation_parameters.lambda_parameters.client_context) >= 1 && length(v.task_invocation_parameters.lambda_parameters.client_context) <= 8000)))
      )
    ])
    error_message = "must be between 1 and 8000 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.ssm_maintenance_window_tasks : (
        v.task_invocation_parameters == null || (v.task_invocation_parameters.lambda_parameters == null || (v.task_invocation_parameters.lambda_parameters.payload == null || (length(v.task_invocation_parameters.lambda_parameters.payload) >= 0 && length(v.task_invocation_parameters.lambda_parameters.payload) <= 4096)))
      )
    ])
    error_message = "must be between 0 and 4096 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.ssm_maintenance_window_tasks : (
        v.task_invocation_parameters == null || (v.task_invocation_parameters.lambda_parameters == null || (v.task_invocation_parameters.lambda_parameters.qualifier == null || (length(v.task_invocation_parameters.lambda_parameters.qualifier) >= 1 && length(v.task_invocation_parameters.lambda_parameters.qualifier) <= 128)))
      )
    ])
    error_message = "must be between 1 and 128 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.ssm_maintenance_window_tasks : (
        v.task_invocation_parameters == null || (v.task_invocation_parameters.run_command_parameters == null || (v.task_invocation_parameters.run_command_parameters.document_hash == null || (length(v.task_invocation_parameters.run_command_parameters.document_hash) >= 0 && length(v.task_invocation_parameters.run_command_parameters.document_hash) <= 256)))
      )
    ])
    error_message = "must be between 0 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.ssm_maintenance_window_tasks : (
        v.task_invocation_parameters == null || (v.task_invocation_parameters.run_command_parameters == null || (v.task_invocation_parameters.run_command_parameters.document_version == null || (can(regex("([$]LATEST|[$]DEFAULT|^[1-9][0-9]*$)", v.task_invocation_parameters.run_command_parameters.document_version)))))
      )
    ])
    error_message = "must be $DEFAULT, $LATEST, or a version number"
  }
  validation {
    condition = alltrue([
      for k, v in var.ssm_maintenance_window_tasks : (
        v.task_invocation_parameters == null || (v.task_invocation_parameters.run_command_parameters == null || (v.task_invocation_parameters.run_command_parameters.timeout_seconds == null || (v.task_invocation_parameters.run_command_parameters.timeout_seconds >= 30 && v.task_invocation_parameters.run_command_parameters.timeout_seconds <= 2592000)))
      )
    ])
    error_message = "must be between 30 and 2592000"
  }
  validation {
    condition = alltrue([
      for k, v in var.ssm_maintenance_window_tasks : (
        v.task_invocation_parameters == null || (v.task_invocation_parameters.step_functions_parameters == null || (v.task_invocation_parameters.step_functions_parameters.input == null || (length(v.task_invocation_parameters.step_functions_parameters.input) >= 0 && length(v.task_invocation_parameters.step_functions_parameters.input) <= 4096)))
      )
    ])
    error_message = "must be between 0 and 4096 characters"
  }
  # Note: 13 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

