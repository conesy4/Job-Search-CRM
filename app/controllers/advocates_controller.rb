class AdvocatesController < ApplicationController
  def index
    matching_advocates = Advocate.all

    @list_of_advocates = matching_advocates.order({ :created_at => :desc })

    render({ :template => "advocates/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_advocates = Advocate.where({ :id => the_id })

    @the_advocate = matching_advocates.at(0)

    render({ :template => "advocates/show.html.erb" })
  end

  def create
    the_advocate = Advocate.new
    the_advocate.contact_id = params.fetch("query_contact_id")
    the_advocate.job_id = params.fetch("query_job_id")

    if the_advocate.valid?
      the_advocate.save
      redirect_to("/advocates", { :notice => "Advocate created successfully." })
    else
      redirect_to("/advocates", { :notice => "Advocate failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_advocate = Advocate.where({ :id => the_id }).at(0)

    the_advocate.contact_id = params.fetch("query_contact_id")
    the_advocate.job_id = params.fetch("query_job_id")

    if the_advocate.valid?
      the_advocate.save
      redirect_to("/advocates/#{the_advocate.id}", { :notice => "Advocate updated successfully."} )
    else
      redirect_to("/advocates/#{the_advocate.id}", { :alert => "Advocate failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_advocate = Advocate.where({ :id => the_id }).at(0)

    the_advocate.destroy

    redirect_to("/advocates", { :notice => "Advocate deleted successfully."} )
  end
end
