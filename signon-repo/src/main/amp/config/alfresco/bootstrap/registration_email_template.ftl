<html>
  <head>
    <style type="text/css"><!--
    body
    {
      font-family: Arial, sans-serif;
      font-size: 14px;
      color: #4c4c4c;
    }
    
    a, a:visited
    {
      color: #0072cf;
    }
    --></style>
  </head>
  
  <body bgcolor="#dddddd">
    <table width="100%" cellpadding="20" cellspacing="0" border="0" bgcolor="#dddddd">
      <tr>
        <td width="100%" align="center">
          <table width="70%" cellpadding="0" cellspacing="0" bgcolor="white" 
              style="background-color: white; border: 1px solid #aaaaaa;">
            <tr>
              <td width="100%">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                  <tr>
                    <td style="padding: 10px 30px 0px;">
                      <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                          <td>
                            <table cellpadding="0" cellspacing="0" border="0">
                              <tr>
                                <td>
                <img src="${shareUrl}/res/signon/main/components/images/logo-email.png" width="200" height="120"/>
                                </td>
                              </tr>
                            </table>
                            <div style="font-size: 14px; margin: 12px 0px 24px 0px; padding-top: 10px; border-top: 1px solid #aaaaaa;">
                              <p>Dear ${firstname} ${lastname},</p>
                              <p>This message confirms that the following user profile was successfully created: </p>
							  <p> ${username} </p>
								
   
 				 
                              <p>You can <a href="${shareUrl}">log in </a> with the password below  :<br /> 
							  
                              <table cellpadding="0" cellspacing="0" border="0">
                              <tr>
                              <td>Login :</td>
                              <td style="padding: 0 20px; text-align: left;"><b>${username}</b></td>
                              </tr>
                              <tr>
                              <td>Password :</td>
                              <td style="padding: 0 20px; text-align: left;"><b>${password}</b></td>
                              </tr>
                              </table>
							  <br/>
 
							  
							  
                              </p>
                    
                            </div>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </body>
</html>
