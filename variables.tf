variable "load_balancer" {
  type        = string
  description = "The DNS name of the classic AWS Load Balancer forwarding traffic to this application; e.g. a40269bd695b945f3af4c2b35e11c3c1-1331478625.us-east-1.elb.amazonaws.com"
}

variable "name" {
  type        = string
  description = "The name of the application. Must be DNS-compliant"
}

variable "operation" {
  type        = string
  description = "Parent operation; typically dev/stage/production."
}
