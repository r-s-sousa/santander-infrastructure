resource "aws_iam_role" "rds_monitoring" {
  name = "${var.db_identifier}-rds-monitoring-role"
  tags = var.tags

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "monitoring.rds.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
} 

resource "aws_iam_role_policy_attachment" "rds_monitoring_policy" {
  role       = aws_iam_role.rds_monitoring.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}