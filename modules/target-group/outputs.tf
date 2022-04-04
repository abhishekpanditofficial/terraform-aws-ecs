output "target_group_arn" {
    value= aws_lb_target_group.group.arn
}
output "target_group_name" {
    value= aws_lb_target_group.group.name
}
output "target_group_vpc" {
    value= aws_lb_target_group.group.vpc_id
}
output "target_group_id" {
    value= aws_lb_target_group.group.id
}