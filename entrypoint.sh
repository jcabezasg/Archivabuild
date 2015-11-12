!# /bin/bash

# Script to open Archiva and create admin user 
# Eugenio Fidel González & Javier Cabezas Gívica


# creating security.properties file
touch security.properties
# Write security.policy.password.rule.numericalcount.enabled=false on this file
# to allow passwords without digital caracters in Archiva
echo "security.policy.password.rule.numericalcount.enabled=false" >> security.properties

# After that we need to go to the bin directory, where the archiva file is
cd ..
cd bin
# We're now in archiva bin folder 
echo The script is initiating
./archiva console &

# The following sleep instructions are addressed to give Archiva enough time to finish its start rutines

sleep 60

# Curl command to add a new user in Archiva via REST service

curl -H "Authorization: Basic YWRtaW46YWRtaW4=" -H "Content-Type: application/json" -X POST -d '{
        "username": "'"$USERNAME"'",
        "fullName": "administrator",
        "email": "administrator@email.com",
        "validated": false,
        "locked": false,
        "password": "'"$PASSWORD"'",
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

