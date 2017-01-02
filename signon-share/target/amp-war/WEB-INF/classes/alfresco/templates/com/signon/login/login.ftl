<!DOCTYPE html>
<html class="grey lighten-2">
<head>
    <title>${msg("signOn.pageTitle")}</title>

    <link rel="icon" href="${url.context}/res/favicon.ico" type="image/png">
 
        <link rel="stylesheet" type="text/css" href="${url.context}/res/signon/main/components/guest/login.css" >
    <link rel='stylesheet' type='text/css' href="//fonts.googleapis.com/css?family=Raleway:200,600" />

</head>
<body>
 
    <main>
         

 <div class="login-page">
  <div class="form">
  
  <img src="${url.context}/res/signon/main/components/images/alfresco-logo.png" width="250"  height="70"  />
  
 <form id="form-signon" class="register-form">
 
      <input type="text" id="newusername" placeholder="${msg("signOn.username")}" required/>
      
       <input type="text" id="firstname"  placeholder="${msg("signOn.firstname")}" required />
       
        <input type="text" id="lastname" placeholder="${msg("signOn.lastname")}" required />
        
         <input type="text" id="email" placeholder="${msg("signOn.email")}" required />
         
           
            <p class="formresult" id="form-result"></p>
            <p id="error" class="error"></p>
            
         <center>      <div id="loading"  ></div>  </center>
         <br/>         
                     
      <button id="form-btn" class="disabled" type="submit" name="action">${msg("signOn.submitButtonSign")}</button>
      <p class="message">${msg("signOn.alreadysign")}<a href="#">${msg("signOn.submitButton")}</a></p>
      
                      
    </form>
    
    
    
    
    <form class="login-form" id="loginform" accept-charset="UTF-8" method="post" action="${url.context}/page/dologin">
     <input type="hidden" name="success" value="${url.url}">
      <input type="hidden" name="failure" value="/share/page/?error=true">
      <input id="username" id="username" name="username" type="text" placeholder="${msg("signOn.usernameLabel")}" required/>
      <input id="password" name="password" type="password" placeholder="${msg("signOn.passwordLabel")}" required />
        <p id="error_login" class="error"></p>
      <button type="submit" id="btn-login" name="action">${msg("signOn.submitButton")}</button>
      <p class="message">${msg("signOn.notregistred")} <a href="#">${msg("signOn.signOn")}</a></p>
    </form>
  </div>
</div>


    </main>

 
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="${url.context}/js/materialize.min.js"></script>
    <script>
    
        function getErrorMessage(xhr, error) {
        try {
            var response = JSON.parse(xhr.responseText);
            return response.message;
        } catch(e) {
            return error;
        }
    }
    
    
        $(document).ready(function(){
              
      $('.message a').click(function(){
   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
});




            function getUrlParameter(sParam) {
                var sPageURL = window.location.search.substring(1);
                var sURLVariables = sPageURL.split('&');
                for (var i = 0; i < sURLVariables.length; i++)
                {
                    var sParameterName = sURLVariables[i].split('=');
                    if (sParameterName[0] == sParam)
                    {
                        return sParameterName[1];
                    }
                }
            };

            var error = getUrlParameter('error');
            
            if (error == "true") {         
            $('#error_login').text("${msg("signOn.authErrorText")}");
            }
     
   $('#form-signon').submit(function( event ) {
 
 
            event.preventDefault();
            emptyDiv('#form-result');
            emptyDiv('#error');
            $('#loading').show();
            $('#form-btn').attr('disabled','disabled');
            $('#form-btn').removeClass('blue');
            $('#form-btn').addClass('disabled');
            
            var emailValue = $('#email').val(); 
            var newusernameValue = $('#newusername').val();
            var firstname = $('#firstname').val(); 
            var lastname = $('#lastname').val(); 
            
            
             $.ajax({
                type: "POST",
                url: "/share/proxy/alfresco-noauth/signon/login/inscription",     
                data: JSON.stringify({ newusername: newusernameValue , 
                 email : emailValue,
                 firstname : firstname,
                 lastname : lastname
                  }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(result) {
 
                     $('#loading').hide();
                    $('#form-btn').removeAttr('disabled');
                    $('#form-btn').addClass('blue');
                    $('#form-btn').removeClass('disabled');
                    $('#form-result').text("${msg("SignOn.checkEmail")}");
                    
 
                },
                error: function(xhr, status, error) {
                    $('#loading').hide();
                    $('#form-btn').removeAttr('disabled');
                    $('#form-btn').addClass('blue');
                    $('#form-btn').removeClass('disabled');
                    $('#error').text(getErrorMessage(xhr, error));
                }
            });
            
                  
        });
        
               
               function clearInput(){
               
               
             $('#newusername').val('');                      
             $('#firstname').val('');  
             $('#lastname').val('');
               
               }
               
               
 
    
                  function checkEmail(){
  
         var x = document.getElementById('email');
         
          var atpos=x.value.indexOf("@");
          var dotpos=x.value.lastIndexOf(".");
          var atpos2=x.value.lastIndexOf("@");
            
                 if (atpos<1 || dotpos<atpos+3 || dotpos+2>=x.value.length || atpos != atpos2 ) {
                 
                    $('#form-btn').attr('disabled','disabled');
                    $('#form-btn').removeClass('blue');
                    $('#form-btn').addClass('disabled');
                    $('#error').text("${msg("SignOn.EmailFormatError")}");
                    
 
                         
                       }  
                       else
                       {
                       
                        emptyDiv('#error');
                    $('#form-btn').addClass('blue');
                    $('#form-btn').removeClass('disabled');
                    $('#form-btn').removeAttr('disabled');
 
                       }
 
            }
            
            
       function checkUsername(){
       
              var usernameValue = $('#newusername').val();
              
              var y = document.getElementById('newusername');
              
              
        if (y.value.length >= 2 && y.value.length < 31 )
        
        {
        
          if(/^[a-zA-Z0-9- ]*$/.test(usernameValue) == true )
          {
          
                $.ajax({
                type: "POST",
                url: "/share/proxy/alfresco-noauth/signon/login/validate",     
                data: JSON.stringify({ newusername: usernameValue }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(result) {
                
                    emptyDiv('#error');
                    $('#form-btn').addClass('blue');
                    $('#form-btn').removeClass('disabled');
                    $('#form-btn').removeAttr('disabled');
                    
 
                    
                    
                    $('#email').removeClass('disabled');
                    $('#email').removeAttr('disabled');
                    
                    var x = document.getElementById('email');
                    
                    if(x.value.length > 0 )
                    {                
                    checkEmail();
                    }
                    
                },
                error: function(xhr, status, error) {
                    $('#form-btn').attr('disabled','disabled');
                    $('#form-btn').removeClass('blue');
                    $('#form-btn').addClass('disabled');
                    
                    
 
                    
                    $('#email').attr('disabled','disabled');
                    $('#email').addClass('disabled');
                    
                    
                    
                    $('#error').text(getErrorMessage(xhr, error));
                }
            });
            
            }
            
            else
            {
                    $('#form-btn').attr('disabled','disabled');
                    $('#form-btn').removeClass('blue');
                    $('#form-btn').addClass('disabled');
                    
                 
                    $('#email').attr('disabled','disabled');
                    $('#email').addClass('disabled');
 
                    $('#error').text("${msg("SignOn.UsernameFormatError")}");
            
            }
            
            
            
       } 
         else
       {
                    $('#form-btn').attr('disabled','disabled');
                    $('#form-btn').removeClass('blue');
                    $('#form-btn').addClass('disabled');
                    
 
                    $('#email').attr('disabled','disabled');
                    $('#email').addClass('disabled');
 
                     $('#error').text("${msg("SignOn.UsernameLengthError")}");
       
       }
       

       
        }
 
        
 
        
        
                        $('#email').keyup(function() {
                   checkEmail();
  
            return false;
        });
        
        
                                $('#newusername').keyup(function() {
                   checkUsername();
  
            return false;
        });
        
        
        
        
        
   
        
        

        function emptyDiv(divElement){
            $( divElement ).empty();
        } 
          

        });
    </script>
    
 


</body>
</html>
