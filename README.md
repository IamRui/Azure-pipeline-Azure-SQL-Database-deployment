# Azure-pipeline-Azure-SQL-Database-deployment
Intermediate solution for azure-pipelines-tasks issue 12101 Allow multiple sql files with pattern matching for SQL Server Database Deploy
https://github.com/microsoft/azure-pipelines-tasks/issues/12101

## Issue
When using pattern matching to find the SQL file to deploy in azure release pipeline/`Azure SQL Database deployment` task, an error is raised when there is more than 1 one: `Found more than one file to deploy with search pattern **/*.sql`

## Solution
Add a powershell task in the build pipeline to append all possible sql scripts into one before pushing the artifact. This powershell adds `GO` statement after each individual sql script in the combining process. You can find the powershell file in this repository.

reference:
https://sqlserverpowershell.com/2011/10/20/powershell-script-to-check-for-low-drive-space-2/
