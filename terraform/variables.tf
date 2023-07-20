#-----security_controls_scp/modules/guardduty/variables.tf----#
variable "target_id" {
  description = "Organizational Unit ID, or AWS Account ID to apply SCPs."
  type        = string
  default     = "ou-gggb-0k7see5q"
}