!# /bin/bash

# Script to open Archiva and create admin user 
# Eugenio Fidel González & Javier Cabezas Gívica

echo The script is initiating
echo $USERNAME
echo $PASSWORD
./archiva console &

# The following sleep instructions are addressed to give Archiva enough time to finish its start rutines

sleep 10
sleep 10
sleep 10
sleep 10
sleep 10
sleep 10

# Curl command to add a new user in Archiva via REST service

curl -H "Authorization: Basic YWRtaW46aG95dWVsYXMx>" -H "Content-Type: application/json" -X POST -d '{
        "username": "$USERNAME",
        "fullName": "administrator",
        "email": "administrator@email.com",
        "validated": false,
        "locked": false,
        "password": "$PASSWORD",
        "passwordChangeRequired": true,
        "permanent": true,
        "confirmPassword": null,
        "timestampAccountCreation": "Tue, 3 Nov 2015 16:54:45 +0000 - 19 minutes ago",
        "timestampLastLogin": null,
        "timestampLastPasswordChange": "Tue, 3 Nov 2015 16:54:45 +0000 - 19 minutes ago",
        "previousPassword": null,
        "assignedRoles": null,
        "readOnly": false,
        "userManagerId": "ttt"
    }' http://localhost:8080/restServices/redbackServices/userService/createAdminUser

# User creation is informed

echo User created successfully

# End of the script

exit
