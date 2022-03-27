output "ecs_arn" {
  value = aws_ecs_cluster.cluster.arn
}
output "ecs_id" {
  value = aws_ecs_cluster.cluster.id
}
output "ecs_cluster_name" {
  value = aws_ecs_cluster.cluster.name
}
output "cloudwatch_arn" {
  value = aws_cloudwatch_log_group.log.arn
}
output "cloudwatch_id" {
  value = aws_cloudwatch_log_group.log.id
}
