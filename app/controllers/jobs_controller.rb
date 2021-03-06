class JobsController < ApplicationController
  def index

    matching_bookmarks = Bookmark.where({ :user_id => @current_user})

    @list_of_bookmarks = matching_bookmarks.order({ :name => :asc })

    matching_firms = Firm.all

    @list_of_firms = matching_firms.order({ :name => :asc })

    matching_jobs = Job.where({ :user_id => @current_user})

    matching_jobs_upcoming = matching_jobs.where("application_deadline >= ?", Date.today)    

    matching_jobs_old = matching_jobs.where("application_deadline < ?", Date.today)   

    @list_of_jobs = matching_jobs_upcoming.where({ :application_date => nil}).order({ :application_deadline => :asc })

    @list_of_jobs_applied = matching_jobs.where.not({ :application_date => nil}).order({ :application_date => :desc })

    @list_of_jobs_old = matching_jobs_old.where({ :application_date => nil}).order({ :application_deadline => :desc })

    render({ :template => "jobs/index.html.erb" })


    
  end

  def show
    the_id = params.fetch("path_id")

    matching_jobs = Job.where({ :id => the_id })

    @the_job = matching_jobs.at(0)

    render({ :template => "jobs/show.html.erb" })
  end

  def create
    the_job = Job.new
    the_job.bookmark_id = params.fetch("query_bookmark_id")

    if params.fetch("query_firm_id") == "x"
      firm_id = Bookmark.where({ :id => params.fetch("query_bookmark_id"), :user_id => @current_user.id }).first.firm_id
    else
      firm_id = params.fetch("query_firm_id")
    end
 
    the_job.firm_id = firm_id
    the_job.role = params.fetch("query_role")
    the_job.location = params.fetch("query_location")
    the_job.website = params.fetch("query_website")
    the_job.notes = params.fetch("query_notes")
    the_job.application_deadline = params.fetch("query_application_deadline")
    #the_job.applied = params.fetch("query_applied", false)
    #the_job.application_date = params.fetch("query_application_date")
    #the_job.application_status = params.fetch("query_application_status")
    #the_job.application_mode = params.fetch("query_application_mode")
    #the_job.application_outcome = params.fetch("query_application_outcome")
    #the_job.application_next_steps = params.fetch("query_application_next_steps")
    the_job.user_id = params.fetch("query_user_id")
    #the_job.communications_count = params.fetch("query_communications_count")
    #the_job.advocates_count = params.fetch("query_advocates_count")

    if the_job.valid?
      the_job.save
      redirect_to("/jobs/#{the_job.id}", { :notice => "Job created successfully." })
    else
      redirect_to("/jobs", { :notice => "Job failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_job = Job.where({ :id => the_id }).at(0)

    #the_job.firm_id = params.fetch("query_firm_id")
    the_job.role = params.fetch("query_role")
    the_job.location = params.fetch("query_location")
    the_job.website = params.fetch("query_website")
    the_job.notes = params.fetch("query_notes")
    the_job.application_deadline = params.fetch("query_application_deadline")
    #the_job.applied = params.fetch("query_applied", false)
    the_job.application_date = params.fetch("query_application_date")
    the_job.application_status = params.fetch("query_application_status")
    #the_job.application_mode = params.fetch("query_application_mode")
    #the_job.application_outcome = params.fetch("query_application_outcome")
    the_job.application_next_steps = params.fetch("query_application_next_steps")
    #the_job.user_id = params.fetch("query_user_id")
    #the_job.communications_count = params.fetch("query_communications_count")
    #the_job.advocates_count = params.fetch("query_advocates_count")

    if the_job.valid?
      the_job.save
      redirect_to("/jobs/#{the_job.id}", { :notice => "Job updated successfully."} )
    else
      redirect_to("/jobs/#{the_job.id}", { :alert => "Job failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_job = Job.where({ :id => the_id }).at(0)

    the_job.destroy

    redirect_to("/jobs", { :notice => "Job deleted successfully."} )
  end
end
