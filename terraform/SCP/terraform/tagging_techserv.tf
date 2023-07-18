
data "aws_iam_policy_document" "Tag_ITPTechnicalService" {
  statement {
    sid    = "Tag_ITPTechnicalService"
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

resource "aws_organizations_policy" "Tag_ITPTechnicalService" {
  name        = "Tag-ITPTechnicalService"
  description = "Allow certain EC2 instance types only."
  content     = data.aws_iam_policy_document.Tag_ITPTechnicalService.json
}

resource "aws_organizations_policy_attachment" "Tag_ITPTechnicalService_SCP" {
  policy_id = aws_organizations_policy.Tag_ITPTechnicalService.id
  target_id = "ou-gggb-0k7see5q"
}