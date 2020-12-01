class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  
  # Uncomment this if you want to force users to sign in before any other actions
  before_action(:force_user_sign_in)
  
  def load_current_user
    the_id = session[:user_id]
    @current_user = User.where({ :id => the_id }).first
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/login", { :notice => "You have to sign in first." })
    end
  end

  def home
    matching_bookmarks = Bookmark.where({ :user_id => @current_user})
    
    @list_of_bookmarks = matching_bookmarks.order({ :contacts_count => :desc })

    matching_contacts = Contact.where({ :user_id => @current_user})

    @list_of_contacts = matching_contacts.where("followup_date >= ?", Date.today).order({ :followup_date => :asc })

    matching_jobs = Job.where({ :user_id => @current_user}).where("application_deadline >= ?", Date.today)

    @list_of_jobs = matching_jobs.where({ :application_date => nil}).order({ :application_deadline => :desc })

    @list_of_jobs_applied = matching_jobs.where.not({ :application_date => nil}).order({ :application_date => :desc })

    matching_communications = Communication.where({ :user_id => @current_user})

    @list_of_communications = matching_communications.order({ :created_at => :desc })

    matching_firms = Firm.all

    @list_of_firms = matching_firms.order({ :name => :asc })

    render({ :template => "home.html.erb" }) 
    

  end

end
