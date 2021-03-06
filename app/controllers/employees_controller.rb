class EmployeesController < ApplicationController
  def index
    matching_employees = Employee.all

    @list_of_employees = matching_employees.order({ :firm_id => :asc, :last_name => :asc})

    matching_firms = Firm.all

    @list_of_firms = matching_firms.order({ :name => :asc })

    render({ :template => "employees/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_employees = Employee.where({ :id => the_id })

    @the_employee = matching_employees.at(0)

    render({ :template => "employees/show.html.erb" })
  end

  def create
    the_employee = Employee.new
    the_employee.firm_id = params.fetch("query_firm_id")
    the_employee.role = params.fetch("query_role")
    the_employee.first_name = params.fetch("query_first_name")
    the_employee.last_name = params.fetch("query_last_name")
    the_employee.notes = params.fetch("query_notes")
    the_employee.alumni = params.fetch("query_alumni", false)
    the_employee.linkedin = params.fetch("query_linkedin")
    the_employee.email = params.fetch("query_email")
    the_employee.created_by = @current_user.id
    #the_employee.connections_count = params.fetch("query_connections_count")

    if the_employee.valid?
      the_employee.save
      redirect_to("/employees/#{the_employee.id}", { :notice => "Employee created successfully." })
    else
      redirect_to("/employees", { :notice => "Employee failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_employee = Employee.where({ :id => the_id }).at(0)

    the_employee.firm_id = params.fetch("query_firm_id")
    the_employee.role = params.fetch("query_role")
    the_employee.first_name = params.fetch("query_first_name")
    the_employee.last_name = params.fetch("query_last_name")
    the_employee.notes = params.fetch("query_notes")
    the_employee.alumni = params.fetch("query_alumni", false)
    the_employee.linkedin = params.fetch("query_linkedin")
    the_employee.email = params.fetch("query_email")
    the_employee.connections_count = params.fetch("query_connections_count")

    if the_employee.valid?
      the_employee.save
      redirect_to("/employees/#{the_employee.id}", { :notice => "Employee updated successfully."} )
    else
      redirect_to("/employees/#{the_employee.id}", { :alert => "Employee failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_employee = Employee.where({ :id => the_id }).at(0)

    the_employee.destroy

    redirect_to("/employees", { :notice => "Employee deleted successfully."} )
  end
end
