<!-- Identity & Access Management (IAM) -->

Securely manage access to services and resources.

<!-- Terms -->

* Root Account - Created by default, should not be used or shared.

* Users - People within organization, can be grouped, does not have to belong to a group, can belong to multiple groups.

* Group - Only contain users, not other groups.

* Role - Permissions granted to AWS services to perform actions on behalf of users.

* Principal - Root user, user, role.

* Policies - JSON documents that outlines permissions for users or groups.

* Least privilidge principle - Do not give more permissions than a user needs.

# Tools

* IAM Credentials Report - Account level, a report that lists all account's users and the status of their credentials.

* IAM Access Advisor - User level, shows the service permissions granted to a user and when those services were last accessed.

<!-- Operation -->

# Permission Policies

* Identity Based - Attached to an identity (actions, resources, conditions).

* Resource Based - Attached to a resource (like S3 bucket).

## Identity Based Policy

```json
{
	"Version": "2012-10-17", // Always include this version
	"Id": "", // Id of policy (optional)
	"Statement": [
		{
			"Sid": "1", // Id of statement (optional)
			"Effect": "Allow", // Either "Allow" or "Deny"

			// Account/User/Role to which this policy applies to
			"Principal": {
				"AWS": [
					"arn:aws:iam:1234567890:root"
				]
			},

			// List of actions this policy allows or denies
			"Action": [
				"s3:GetObject",
				"s3:PutObject"
			],

			// List of resources to which this policy applies to
			"Resource": [
				"arn:aws:s3:::mybucket/*"
			]
		}
	]
}
```

# AWS Security Token Service (STS)

Request temporary, limited-privilidge credentials for users.

# Policy Inheritance

* Policy Inheritance - The interaction of policies at differing levels of an organization, moving from the top-level root of the organization, down through the organizational unit (OU) hierarchy to individual accounts.

* Parent Policies - Policies that are attached higher in the organizational tree than policies that are attached to entities lower in the tree.

* Child Policies - Policies that are attached at a lower level in the organization tree than the parent policy.

* Effective Policies - The final, single policy document that specifies the rules that apply to an account. The effective policy is the aggregation of any policies the account inherits, plus any policy that is directly attached to the account.

* Inheritance Operators - Operators that control how inherited policies merge into a single effective policy.

## Management Policies

You can attach management policies to organization entities (organization root, organizational unit (OU), or account) in your organization.
Management policies can be attached to multiple levels in the organization.
Accounts can inherit multiple policies.

* Attach to organizational root - All OUs and accounts in the organization inherit that policy.

* Attach to a specific OU - Accounts that are directly under that OU or any child OU inherit the policy.

* Attach to a specific account - Affects only that account.

<!-- Performance -->

<!-- Pricing -->

<!-- Security -->

# Multi Factor Authentication (MFA)

# Password Policy

<!-- Test -->

# Guidelines & Best Practices

* Don’t use the root account except for AWS account setup
* One physical user = One AWS user
* Assign users to groups and assign permissions to groups
* Create a strong password policy
* Use and enforce the use of Multi Factor Authentication (MFA)
* Create and use Roles for giving permissions to AWS services
* Use Access Keys for Programmatic Access (CLI / SDK)
* Audit permissions of your account using IAM Credentials Report & IAM Access Advisor
* Never share IAM users & Access Keys

# Shared Responsibility Model

## AWS

* Infrastructure (global network security)
* Configuration and vulnerability analysis
* Compliance validation

## User

* Users, Groups, Roles, Policies management and monitoring
* Enable MFA on all accounts
* Rotate all your keys often
* Use IAM tools to apply appropriate permissions
* Analyze access patterns & review permissions
