class CommunicationsController < ApplicationController
  def index
    matching_communications = Communication.all

    @list_of_communications = matching_communications.order({ :created_at => :desc })

    render({ :template => "communications/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_communications = Communication.where({ :id => the_id })

    @the_communication = matching_communications.at(0)

    render({ :template => "communications/show.html.erb" })
  end

  def create
    the_communication = Communication.new
    the_communication.contact_id = params.fetch("query_contact_id")
    the_communication.job_id = params.fetch("query_job_id")
    the_communication.date = params.fetch("query_date")
    the_communication.comm_type = params.fetch("query_comm_type")
    the_communication.outgoing = params.fetch("query_outgoing", false)
    the_communication.incoming = params.fetch("query_incoming", false)
    the_communication.notes = params.fetch("query_notes")
    the_communication.followup_date = params.fetch("query_followup_date")
    the_communication.user_id = params.fetch("query_user_id")

    if the_communication.valid?
      the_communication.save
      redirect_to("/communications", { :notice => "Communication created successfully." })
    else
      redirect_to("/communications", { :notice => "Communication failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_communication = Communication.where({ :id => the_id }).at(0)

    the_communication.contact_id = params.fetch("query_contact_id")
    the_communication.job_id = params.fetch("query_job_id")
    the_communication.date = params.fetch("query_date")
    the_communication.comm_type = params.fetch("query_comm_type")
    the_communication.outgoing = params.fetch("query_outgoing", false)
    the_communication.incoming = params.fetch("query_incoming", false)
    the_communication.notes = params.fetch("query_notes")
    the_communication.followup_date = params.fetch("query_followup_date")
    the_communication.user_id = params.fetch("query_user_id")

    if the_communication.valid?
      the_communication.save
      redirect_to("/communications/#{the_communication.id}", { :notice => "Communication updated successfully."} )
    else
      redirect_to("/communications/#{the_communication.id}", { :alert => "Communication failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_communication = Communication.where({ :id => the_id }).at(0)

    the_communication.destroy

    redirect_to("/communications", { :notice => "Communication deleted successfully."} )
  end
end
