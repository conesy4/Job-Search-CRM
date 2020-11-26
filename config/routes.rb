Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "home" })

  # Routes for the Employee resource:

  # CREATE
  post("/insert_employee", { :controller => "employees", :action => "create" })
          
  # READ
  get("/employees", { :controller => "employees", :action => "index" })
  
  get("/employees/:path_id", { :controller => "employees", :action => "show" })
  
  # UPDATE
  
  post("/modify_employee/:path_id", { :controller => "employees", :action => "update" })
  
  # DELETE
  get("/delete_employee/:path_id", { :controller => "employees", :action => "destroy" })

  #------------------------------

  # Routes for the Contact resource:

  # CREATE
  post("/insert_contact", { :controller => "contacts", :action => "create" })
          
  # READ
  get("/contacts", { :controller => "contacts", :action => "index" })
  
  get("/contacts/:path_id", { :controller => "contacts", :action => "show" })
  
  # UPDATE
  
  post("/modify_contact/:path_id", { :controller => "contacts", :action => "update" })
  
  # DELETE
  get("/delete_contact/:path_id", { :controller => "contacts", :action => "destroy" })

  #------------------------------

  # Routes for the Bookmark resource:

  # CREATE
  post("/insert_bookmark", { :controller => "bookmarks", :action => "create" })
          
  # READ
  get("/bookmarks", { :controller => "bookmarks", :action => "index" })
  
  get("/bookmarks/:path_id", { :controller => "bookmarks", :action => "show" })
  
  # UPDATE
  
  post("/modify_bookmark/:path_id", { :controller => "bookmarks", :action => "update" })
  
  # DELETE
  get("/delete_bookmark/:path_id", { :controller => "bookmarks", :action => "destroy" })

  #------------------------------

  # Routes for the Advocate resource:

  # CREATE
  post("/insert_advocate", { :controller => "advocates", :action => "create" })
          
  # READ
  get("/advocates", { :controller => "advocates", :action => "index" })
  
  get("/advocates/:path_id", { :controller => "advocates", :action => "show" })
  
  # UPDATE
  
  post("/modify_advocate/:path_id", { :controller => "advocates", :action => "update" })
  
  # DELETE
  get("/delete_advocate/:path_id", { :controller => "advocates", :action => "destroy" })

  #------------------------------

  # Routes for the Communication resource:

  # CREATE
  post("/insert_communication", { :controller => "communications", :action => "create" })
          
  # READ
  get("/communications", { :controller => "communications", :action => "index" })
  
  get("/communications/:path_id", { :controller => "communications", :action => "show" })
  
  # UPDATE
  
  post("/modify_communication/:path_id", { :controller => "communications", :action => "update" })
  
  # DELETE
  get("/delete_communication/:path_id", { :controller => "communications", :action => "destroy" })

  #------------------------------

  # Routes for the Job resource:

  # CREATE
  post("/insert_job", { :controller => "jobs", :action => "create" })
          
  # READ
  get("/jobs", { :controller => "jobs", :action => "index" })
  
  get("/jobs/:path_id", { :controller => "jobs", :action => "show" })
  
  # UPDATE
  
  post("/modify_job/:path_id", { :controller => "jobs", :action => "update" })
  
  # DELETE
  get("/delete_job/:path_id", { :controller => "jobs", :action => "destroy" })

  #------------------------------

  # Routes for the Firm resource:

  # CREATE
  post("/insert_firm", { :controller => "firms", :action => "create" })
          
  # READ
  get("/firms", { :controller => "firms", :action => "index" })
  
  get("/firms/:path_id", { :controller => "firms", :action => "show" })
  
  # UPDATE
  
  post("/modify_firm/:path_id", { :controller => "firms", :action => "update" })
  
  # DELETE
  get("/delete_firm/:path_id", { :controller => "firms", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/login", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/logout", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
