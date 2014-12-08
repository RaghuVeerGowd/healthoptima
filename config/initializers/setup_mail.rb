ActionMailer::Base.smtp_settings = {  
   address: "smtp.gmail.com",
   port:    587,
   domain:  "gmail.com",
   authentication: "login",
   enable_starttls_auto: true,
   user_name: "triveniramaiah@gmail.com",
   password:  "triveni1020"
}