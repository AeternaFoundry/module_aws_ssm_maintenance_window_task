output "ssm_maintenance_window_tasks_id" {
  description = "Map of id values across all ssm_maintenance_window_tasks, keyed the same as var.ssm_maintenance_window_tasks"
  value       = { for k, v in aws_ssm_maintenance_window_task.ssm_maintenance_window_tasks : k => v.id if v.id != null && length(v.id) > 0 }
}
output "ssm_maintenance_window_tasks_arn" {
  description = "Map of arn values across all ssm_maintenance_window_tasks, keyed the same as var.ssm_maintenance_window_tasks"
  value       = { for k, v in aws_ssm_maintenance_window_task.ssm_maintenance_window_tasks : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "ssm_maintenance_window_tasks_cutoff_behavior" {
  description = "Map of cutoff_behavior values across all ssm_maintenance_window_tasks, keyed the same as var.ssm_maintenance_window_tasks"
  value       = { for k, v in aws_ssm_maintenance_window_task.ssm_maintenance_window_tasks : k => v.cutoff_behavior if v.cutoff_behavior != null && length(v.cutoff_behavior) > 0 }
}
output "ssm_maintenance_window_tasks_description" {
  description = "Map of description values across all ssm_maintenance_window_tasks, keyed the same as var.ssm_maintenance_window_tasks"
  value       = { for k, v in aws_ssm_maintenance_window_task.ssm_maintenance_window_tasks : k => v.description if v.description != null && length(v.description) > 0 }
}
output "ssm_maintenance_window_tasks_max_concurrency" {
  description = "Map of max_concurrency values across all ssm_maintenance_window_tasks, keyed the same as var.ssm_maintenance_window_tasks"
  value       = { for k, v in aws_ssm_maintenance_window_task.ssm_maintenance_window_tasks : k => v.max_concurrency if v.max_concurrency != null && length(v.max_concurrency) > 0 }
}
output "ssm_maintenance_window_tasks_max_errors" {
  description = "Map of max_errors values across all ssm_maintenance_window_tasks, keyed the same as var.ssm_maintenance_window_tasks"
  value       = { for k, v in aws_ssm_maintenance_window_task.ssm_maintenance_window_tasks : k => v.max_errors if v.max_errors != null && length(v.max_errors) > 0 }
}
output "ssm_maintenance_window_tasks_name" {
  description = "Map of name values across all ssm_maintenance_window_tasks, keyed the same as var.ssm_maintenance_window_tasks"
  value       = { for k, v in aws_ssm_maintenance_window_task.ssm_maintenance_window_tasks : k => v.name if v.name != null && length(v.name) > 0 }
}
output "ssm_maintenance_window_tasks_priority" {
  description = "Map of priority values across all ssm_maintenance_window_tasks, keyed the same as var.ssm_maintenance_window_tasks"
  value       = { for k, v in aws_ssm_maintenance_window_task.ssm_maintenance_window_tasks : k => v.priority if v.priority != null }
}
output "ssm_maintenance_window_tasks_region" {
  description = "Map of region values across all ssm_maintenance_window_tasks, keyed the same as var.ssm_maintenance_window_tasks"
  value       = { for k, v in aws_ssm_maintenance_window_task.ssm_maintenance_window_tasks : k => v.region if v.region != null && length(v.region) > 0 }
}
output "ssm_maintenance_window_tasks_service_role_arn" {
  description = "Map of service_role_arn values across all ssm_maintenance_window_tasks, keyed the same as var.ssm_maintenance_window_tasks"
  value       = { for k, v in aws_ssm_maintenance_window_task.ssm_maintenance_window_tasks : k => v.service_role_arn if v.service_role_arn != null && length(v.service_role_arn) > 0 }
}
output "ssm_maintenance_window_tasks_targets" {
  description = "Map of targets values across all ssm_maintenance_window_tasks, keyed the same as var.ssm_maintenance_window_tasks"
  value       = { for k, v in aws_ssm_maintenance_window_task.ssm_maintenance_window_tasks : k => v.targets if v.targets != null && length(v.targets) > 0 }
}
output "ssm_maintenance_window_tasks_task_arn" {
  description = "Map of task_arn values across all ssm_maintenance_window_tasks, keyed the same as var.ssm_maintenance_window_tasks"
  value       = { for k, v in aws_ssm_maintenance_window_task.ssm_maintenance_window_tasks : k => v.task_arn if v.task_arn != null && length(v.task_arn) > 0 }
}
output "ssm_maintenance_window_tasks_task_invocation_parameters" {
  description = "Map of task_invocation_parameters values across all ssm_maintenance_window_tasks, keyed the same as var.ssm_maintenance_window_tasks"
  value       = { for k, v in aws_ssm_maintenance_window_task.ssm_maintenance_window_tasks : k => one(v.task_invocation_parameters) if v.task_invocation_parameters != null && length(v.task_invocation_parameters) > 0 }
  sensitive   = true
}
output "ssm_maintenance_window_tasks_task_type" {
  description = "Map of task_type values across all ssm_maintenance_window_tasks, keyed the same as var.ssm_maintenance_window_tasks"
  value       = { for k, v in aws_ssm_maintenance_window_task.ssm_maintenance_window_tasks : k => v.task_type if v.task_type != null && length(v.task_type) > 0 }
}
output "ssm_maintenance_window_tasks_window_id" {
  description = "Map of window_id values across all ssm_maintenance_window_tasks, keyed the same as var.ssm_maintenance_window_tasks"
  value       = { for k, v in aws_ssm_maintenance_window_task.ssm_maintenance_window_tasks : k => v.window_id if v.window_id != null && length(v.window_id) > 0 }
}
output "ssm_maintenance_window_tasks_window_task_id" {
  description = "Map of window_task_id values across all ssm_maintenance_window_tasks, keyed the same as var.ssm_maintenance_window_tasks"
  value       = { for k, v in aws_ssm_maintenance_window_task.ssm_maintenance_window_tasks : k => v.window_task_id if v.window_task_id != null && length(v.window_task_id) > 0 }
}

