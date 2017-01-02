
model.result = false;
model.message = "";
var s = new XML(config.script);
var password = parseInt(s.key.toString(), 10);
var host = s.hostname.toString();


function getRandomNum(lbound, ubound){
    return (Math.floor(Math.random() * (ubound - lbound)) + lbound);
}


function getRandomChar(){
    var chars = s.chars.toString();
    return chars.charAt(getRandomNum(0, chars.length));
}

function getRandomId(n){
    var uniqueId = "";
    for (var i=0; i<n; i++) {
        uniqueId += getRandomChar();
    }
    return uniqueId;
}


function findTemplate(maintp, locale){
    var localizedTplName = maintp.replace('.ftl', '_'+locale+'.ftl');
    var mailtp = search.xpathSearch('/app:company_home/app:dictionary/app:email_templates/cm:registration/cm:'+localizedTplName);
    
    if (mailtp.length === 0) {
        logger.log('Template does not exist :  '+localizedTplName);
        mailtp = search.xpathSearch('/app:company_home/app:dictionary/app:email_templates/cm:registration/cm:'+maintp);
    }
    
    if (mailtp.length > 0) {
        return mailtp[0];
    } else {
    	logger.log('Template does not exist :  '+maintp);
        throw 'Missing template: <Data Dictionary/Email Templates/Registration/'+maintp+'>';
    }
}


function  sendMailInscription(email, username, password, serverLocale){
	
	
	user = people.getPerson(username);
	
    var mail = actions.create("mail");
    mail.parameters.to = email;
    mail.parameters.subject = msg.get("Registration");
    // Maps an object with values to be used in the email templates as variables: (eg. ${username})
    var map = {};
    map.email = email;
    map.username = username;
    map.password = password;
    map.firstname = user.properties.firstName;
    map.lastname = user.properties.lastName;
    mail.parameters.template_model = map;

    mail.parameters.template = findTemplate('registration_email_template.ftl', serverLocale);

    mail.execute(companyhome);

    logger.log("Inscription mail sent to: " + email);
}

function main(){

    var  username,email,firstname,lastname;
    var user;
    var serverLocale = utils.getLocale();
    password = getRandomId(password);
    username = json.get("newusername");
    email = json.get("email");
    firstname = json.get("firstname");
    lastname = json.get("lastname");
 
    user = people.getPerson(username);
 
   
      if (user) {
            status.setCode(status.STATUS_BAD_REQUEST, msg.get("error.usernamenotvalid"));
            status.redirect = true;
            return;
        } 
      else
    	  {
    	        
            var createdUser =  people.createPerson(username, firstname, lastname, email,password,true);
    
    	    if(createdUser)
    		  {
    	    	 logger.log(" User created : " +createdUser.properties.userName); 
  
   		      }
    	     else
    	     {
              status.setCode(status.STATUS_BAD_REQUEST, msg.get("error.creation"));
              status.redirect = true;
              return;
    	     }
    	  
    	  }
      

      
  
      try {
 
        sendMailInscription(email, username, password, serverLocale);
        
    } catch (e) {
        status.setCode(status.STATUS_INTERNAL_SERVER_ERROR, msg.get("error.mail", [e]));
        status.redirect = true;
        return;
    }
 
}

main();
