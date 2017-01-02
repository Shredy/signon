# Features
This addon provides a customised login page for Alfresco Share,
including a registration form that can be used to create account & sign on to Alfresco.
Once a user is registered, he receive an email containing the Username & password for login.
The created user is not a member of any site or any particular groups of users. 


# Essentials
- This addon contains two projects (signon-repo & signon-share)
- Alfresco  Community 4.x & 5.x
- Alfresco Maven SDK 2.0.0



# Quickstart
- Locate the AMP files inside the path:
- signon/signon-repo/target/signon-repo.amp   -> alfresco.war
- signon/signon-share/target/signon-share.amp -> share.war

Stop Alfresco
- Copy the [signon-repo.amp](https://github.com/Shredy/signon/raw/master/signon-repo/target/signon-repo-1.0.amp) inside your alfresco `amps` folder
- Copy the [signon-share.amp](https://github.com/Shredy/signon/raw/master/signon-share/target/signon-share-1.0.amp) inside your alfresco `amps_share` folder
- Run `bin/apply_amps.sh` in order to install the extensions
- Start Alfresco

