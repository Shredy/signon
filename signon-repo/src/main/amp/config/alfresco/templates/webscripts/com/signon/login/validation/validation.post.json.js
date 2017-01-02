
model.result = false;
model.message = "";


function main(){

    var   username;
    var user;
    var serverLocale = utils.getLocale();
 
     
    username = json.get("newusername");
    user = people.getPerson(username);

    
    logger.log(" user : "+user);    
    
      if (user) {
            status.setCode(status.STATUS_BAD_REQUEST, msg.get("error.usernamenotvalid"));
            status.redirect = true;
            return;
        } 
 
}

main();
