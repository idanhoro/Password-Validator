# Get the first argument as string
[string]$password=$args[0]

# Check of the password isnt less than 10.
if ($password.Length -lt 10){
        Write-Host -ForegroundColor red "Password must be minimum of 10 characters"
        exit 1
}

# Check if the password inculdes alphabet and number.
if(!($password -match "[a-z]" -and $password -match '\d')){
        Write-Host -ForegroundColor red "Password must contain both alphabet and number"
        exit 1
}

# Check if the password includes both the small and capital case letters.
if(!($password -cmatch "[a-z]" -and $password -cmatch "[A-Z]" )){
        Write-Host -ForegroundColor red "Passowrd must include both the small and capital case letters"
        exit 1
}

# # In case the password passed all the tests, it will print the password marked with green color.
Write-Host -ForegroundColor green "$password"
exit 0
