class JobsController < ApplicationController
  def index
    matching_jobs = Job.all

    @list_of_jobs = matching_jobs.order({ :created_at => :desc })

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
    the_job.firm_id = params.fetch("query_firm_id")
    the_job.role = params.fetch("query_role")
    the_job.location = params.fetch("query_location")
    the_job.notes = params.fetch("query_notes")
    the_job.application_deadline = params.fetch("query_application_deadline")
    the_job.applied = params.fetch("query_applied", false)
    the_job.application_date = params.fetch("query_application_date")
    the_job.application_status = params.fetch("query_application_status")
    the_job.application_mode = params.fetch("query_application_mode")
    the_job.application_outcome = params.fetch("query_application_outcome")
    the_job.application_next_steps = params.fetch("query_application_next_steps")
    the_job.user_id = params.fetch("query_user_id")
    the_job.communications_count = params.fetch("query_communications_count")
    the_job.advocates_count = params.fetch("query_advocates_count")

    if the_job.valid?
      the_job.save
      redirect_to("/jobs", { :notice => "Job created successfully." })
    else
      redirect_to("/jobs", { :notice => "Job failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_job = Job.where({ :id => the_id }).at(0)

    the_job.firm_id = params.fetch("query_firm_id")
    the_job.role = params.fetch("query_role")
    the_job.location = params.fetch("query_location")
    the_job.notes = params.fetch("query_notes")
    the_job.application_deadline = params.fetch("query_application_deadline")
    the_job.applied = params.fetch("query_applied", false)
    the_job.application_date = params.fetch("query_application_date")
    the_job.application_status = params.fetch("query_application_status")
    the_job.application_mode = params.fetch("query_application_mode")
    the_job.application_outcome = params.fetch("query_application_outcome")
    the_job.application_next_steps = params.fetch("query_application_next_steps")
    the_job.user_id = params.fetch("query_user_id")
    the_job.communications_count = params.fetch("query_communications_count")
    the_job.advocates_count = params.fetch("query_advocates_count")

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
