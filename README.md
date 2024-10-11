# 🚀 Azure Landing Zone (LZ) Repo

![Awesome Azure LZ Setup](https://img.shields.io/badge/Awesome-Azure%20Landing%20Zone-blue?style=for-the-badge&logo=visualstudiocode)

Hey there! Welcome to our Azure LZ repo. We've got everything you need to get your Azure environment set up like a pro.

## What's in the Box?

- Management Group Template deployments
- Permission scripts
- LZ best practices

## Management Group Template Deployment

Heads up: We're using Tenant level deployments here. You'll need some special access for this.

### Permissions You'll Need

If you don't want to go full Owner (and who does?), grab these roles:

- `Automation Job Operator` at tenant level (scope '/')
- `Management Group Contributor` at your top management group

### Quick Permission Setup

Here's a handy script to get you sorted:

```powershell:README.md
$PrincipalID = "<Your identity's object ID>"
$TopMGID = "<Your top management group ID>"
New-AzRoleAssignment -ObjectId $PrincipalID -Scope "/" -RoleDefinitionName "Automation Job Operator"
New-AzRoleAssignment -ObjectId $PrincipalID -Scope "/providers/Microsoft.Management/managementGroups/$TopMGID" -RoleDefinitionName "Management Group Contributor"
```

## Let's Get This Party Started

1. Clone the repo
2. Sort out your permissions
3. Tweak the templates to your liking
4. Deploy your Management Group structure
5. Explore the repo for more LZ goodies

## Contribute

Got ideas? We're all ears! Send us a pull request with your awesome improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Liability

Just a heads up: We're not responsible for how you use this code. You're in the driver's seat, so make sure you know what you're doing. Use at your own risk and always test in a non-production environment first!