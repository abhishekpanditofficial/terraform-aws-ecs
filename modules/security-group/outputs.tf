output "security_group_arn" {
    value= aws_security_group.group.arn
}
output "security_group_vpc_id" {
    value= aws_security_group.group.vpc_id
}
output "security_group_id" {
    value= aws_security_group.group.id
}

output "security_group_ecs_arn" {
    value= aws_security_group.ecs_tasks.arn
}
output "security_group_vpc_ecs_id" {
    value= aws_security_group.ecs_tasks.vpc_id
}
output "security_group_ecs_id" {
    value= aws_security_group.ecs_tasks.id
}