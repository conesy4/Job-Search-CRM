class HomeController < ApplicationController
  def home
    matching_bookmarks = Bookmark.where({ :user_id => @current_user})
    
    @list_of_bookmarks = matching_bookmarks.order({ :contacts_count => :desc })

    matching_contacts = Contact.where({ :user_id => @current_user})

    @list_of_contacts = matching_contacts.where("followup_date >= ?", Date.today).order({ :followup_date => :asc })

    matching_jobs = Job.where({ :user_id => @current_user})

    matching_jobs_upcoming = matching_jobs.where("application_deadline >= ?", Date.today)

    @list_of_jobs = matching_jobs_upcoming.where({ :application_date => nil}).order({ :application_deadline => :asc })

    @list_of_jobs_applied = matching_jobs.where.not({ :application_date => nil}).order({ :application_date => :desc })

    matching_communications = Communication.where({ :user_id => @current_user})

    @list_of_communications = matching_communications.order({ :created_at => :desc })

    matching_firms = Firm.all

    @list_of_firms = matching_firms.order({ :name => :asc })

    render({ :template => "home.html.erb" }) 
  end
end