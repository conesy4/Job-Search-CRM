class FirmsController < ApplicationController
  def index
    matching_firms = Firm.all

    @list_of_firms = matching_firms.order({ :created_at => :desc })

    render({ :template => "firms/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_firms = Firm.where({ :id => the_id })

    @the_firm = matching_firms.at(0)

    render({ :template => "firms/show.html.erb" })
  end

  def create
    the_firm = Firm.new
    the_firm.industry = params.fetch("query_industry")
    the_firm.location = params.fetch("query_location")
    the_firm.name = params.fetch("query_name")
    the_firm.notes = params.fetch("query_notes")
    the_firm.jobs_count = params.fetch("query_jobs_count")
    the_firm.bookmarks_count = params.fetch("query_bookmarks_count")
    the_firm.employees_count = params.fetch("query_employees_count")

    if the_firm.valid?
      the_firm.save
      redirect_to("/firms", { :notice => "Firm created successfully." })
    else
      redirect_to("/firms", { :notice => "Firm failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_firm = Firm.where({ :id => the_id }).at(0)

    the_firm.industry = params.fetch("query_industry")
    the_firm.location = params.fetch("query_location")
    the_firm.name = params.fetch("query_name")
    the_firm.notes = params.fetch("query_notes")
    the_firm.jobs_count = params.fetch("query_jobs_count")
    the_firm.bookmarks_count = params.fetch("query_bookmarks_count")
    the_firm.employees_count = params.fetch("query_employees_count")

    if the_firm.valid?
      the_firm.save
      redirect_to("/firms/#{the_firm.id}", { :notice => "Firm updated successfully."} )
    else
      redirect_to("/firms/#{the_firm.id}", { :alert => "Firm failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_firm = Firm.where({ :id => the_id }).at(0)

    the_firm.destroy

    redirect_to("/firms", { :notice => "Firm deleted successfully."} )
  end
end
