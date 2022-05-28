#!/bin/bash 
password=$1 # Insert the first argument to password varible.

# Set color as varibles.
Green='\033[0;32m' 
Red='\033[0;31m' 
default='\033[0;0m'

# Create flag -f that read password from file.
while getopts 'f:' OPTION; do
        case "$OPTION" in
                f)
                password=$(<$OPTARG)
                ;;
        esac
done                

# Check of the password isnt less than 10.
if [[ ${#password} -lt 10 ]];
then
        echo -e "${Red}Password must be minimum of 10 characters ${default}"
        exit 1
fi

# Check if the password inculdes alphabet and number.
if ! [[ ($password =~ [[:alpha:]]) && ($password =~ [[:digit:]]) ]];
then  
        echo -e "${Red}Password must contain both alphabet and number ${default}"
        exit 1
fi

# Check if the password includes both the small and capital case letters.
if ! [[ ($password =~ [[:lower:]]) && ($password =~ [[:upper:]]) ]];
then
        echo -e "${Red}Passowrd must include both the small and capital case letters ${default}"
        exit 1
fi

# In case the password passed all the tests, it will print the password marked with green color.
echo -e "${Green}${password}${default}"

exit 0