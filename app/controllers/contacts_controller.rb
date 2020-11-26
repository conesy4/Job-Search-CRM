class ContactsController < ApplicationController
  def index
    matching_contacts = Contact.all

    @list_of_contacts = matching_contacts.order({ :created_at => :desc })

    render({ :template => "contacts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_contacts = Contact.where({ :id => the_id })

    @the_contact = matching_contacts.at(0)

    render({ :template => "contacts/show.html.erb" })
  end

  def create
    the_contact = Contact.new
    the_contact.user_id = params.fetch("query_user_id")
    the_contact.employee_id = params.fetch("query_employee_id")
    the_contact.notes = params.fetch("query_notes")
    the_contact.relationship = params.fetch("query_relationship")
    the_contact.outgoing_comms = params.fetch("query_outgoing_comms")
    the_contact.incoming_comms = params.fetch("query_incoming_comms")
    the_contact.last_outgoing_comm = params.fetch("query_last_outgoing_comm")
    the_contact.last_incoming_comm = params.fetch("query_last_incoming_comm")
    the_contact.followup_date = params.fetch("query_followup_date")
    the_contact.communications_count = params.fetch("query_communications_count")
    the_contact.advocates_count = params.fetch("query_advocates_count")

    if the_contact.valid?
      the_contact.save
      redirect_to("/contacts", { :notice => "Contact created successfully." })
    else
      redirect_to("/contacts", { :notice => "Contact failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_contact = Contact.where({ :id => the_id }).at(0)

    the_contact.user_id = params.fetch("query_user_id")
    the_contact.employee_id = params.fetch("query_employee_id")
    the_contact.notes = params.fetch("query_notes")
    the_contact.relationship = params.fetch("query_relationship")
    the_contact.outgoing_comms = params.fetch("query_outgoing_comms")
    the_contact.incoming_comms = params.fetch("query_incoming_comms")
    the_contact.last_outgoing_comm = params.fetch("query_last_outgoing_comm")
    the_contact.last_incoming_comm = params.fetch("query_last_incoming_comm")
    the_contact.followup_date = params.fetch("query_followup_date")
    the_contact.communications_count = params.fetch("query_communications_count")
    the_contact.advocates_count = params.fetch("query_advocates_count")

    if the_contact.valid?
      the_contact.save
      redirect_to("/contacts/#{the_contact.id}", { :notice => "Contact updated successfully."} )
    else
      redirect_to("/contacts/#{the_contact.id}", { :alert => "Contact failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_contact = Contact.where({ :id => the_id }).at(0)

    the_contact.destroy

    redirect_to("/contacts", { :notice => "Contact deleted successfully."} )
  end
end
