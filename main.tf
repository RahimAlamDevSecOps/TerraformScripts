variable "value" {
  type = string
  default = "Hello World"
}

variable "string_list" {
  type = list(string)
  default = [ "serv1", "serv2", "serv3", "serv1" ]
}

output "upper_example" {
  value = upper(var.value)
}

output "startswith_example" {
  value = startswith(var.value, "Hello")
}

output "min_example" {
  value = min(1,2,3,4,5)
}

output "abs_example" {
  value = abs(-15.123)
}

output "length_example" {
  value = length(var.string_list)
}

output "join_example" {
  value = join(":", var.string_list)
}

output "contains_example" {
  value = contains(var.string_list, "serv1")
}

output "toset_example" {
  value = toset(var.string_list)
}