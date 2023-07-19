data "aws_organizations_policy" "tag_itp_technical_service" {
  content = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "TagITPTechnicalService",
        "Effect": "Allow",
        "Action": "ec2:CreateInstances",
        "Resource": "arn:aws:ec2:*:*:instance/*",
        "Condition": {
          "StringEquals": {
            "aws:ResourceTag/ITPTechnicalService": [
              "ISS",
              "Storage and Virtualization",
              "Identity Infrastructure",
              "Software A",
              "Software B",
              "Service Centre",
              "Hybrid Cloud",
              "Analytics",
              "Workplace Technology",
              "Server Administration",
              "Application Hosting Linux",
              "Application Hosting Windows"
            ]
          }
        }
      }
    ]
  })
}

resource "aws_organizations_policy" "tag_itp_technical_service" {
  name        = "TagITPTechnicalService"
  description = "Allow certain EC2 instance types only."
  content     = data.aws_organizations_policy.tag_itp_technical_service.content
  type        = "SERVICE_CONTROL_POLICY"
}

resource "aws_organizations_policy_attachment" "tag_itp_technical_service_scp" {
  policy_id = aws_organizations_policy.tag_itp_technical_service.id
  target_id = "ou-gggb-0k7see5q"
}
