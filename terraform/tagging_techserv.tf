
data "aws_iam_policy_document" "TagITPTechnicalService" {
  statement {
    sid    = "TagITPTechnicalService"
    effect = "Allow"

    actions = [
      "ec2:CreateInstances"
    ]

    resources = [
      "arn:aws:ec2:*:*:instance/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:ResourceTag/ITPTechnicalService"
       values = [
        "ISS",
        "Storage and Virtualization",
        "Identity Infrastructure",
        "Software A",
        "Software B",
        "Service Centre",
        "Hybrid Cloud",
        "Anayltics",
        "Workplace Technology",
        "Server Administration",
        "Application Hosting Linux",
        "Application Hosting Windows"
      ]
    }
  }
}

resource "aws_organizations_policy" "TagITPTechnicalService" {
  name        = "TagITPTechnicalService"
  description = "Allow certain EC2 instance types only."
  content     = data.aws_iam_policy_document.TagITPTechnicalService.json
}

resource "aws_organizations_policy_attachment" "TagITPTechnicalServiceSCP" {
  policy_id = aws_organizations_policy.TagITPTechnicalService.id
  target_id = "ou-gggb-0k7see5q"
}