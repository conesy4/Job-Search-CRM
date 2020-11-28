class BookmarksController < ApplicationController
  def index
    matching_bookmarks = Bookmark.where({ :user_id => @current_user})
    
    @list_of_bookmarks = matching_bookmarks.order({ :name => :asc })

    matching_firms = Firm.all

    @list_of_firms = matching_firms.order({ :name => :asc })

    render({ :template => "bookmarks/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bookmarks = Bookmark.where({ :id => the_id })

    @the_bookmark = matching_bookmarks.at(0)

#    matching_contacts = Contacts.where({ :firm_id => @the_bookmark.firm_id })

#    render({ :template => "bookmarks/show.html.erb" })
  end

  def create
    the_bookmark = Bookmark.new
    the_bookmark.firm_id = params.fetch("query_firm_id")
    the_bookmark.user_id = params.fetch("query_user_id")
    the_bookmark.notes = params.fetch("query_notes")

    if the_bookmark.valid?
      the_bookmark.save
      redirect_to("/bookmarks", { :notice => "Bookmark created successfully." })
    else
      redirect_to("/bookmarks", { :notice => "Bookmark failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_bookmark = Bookmark.where({ :id => the_id }).at(0)

    the_bookmark.firm_id = params.fetch("query_firm_id")
    the_bookmark.user_id = params.fetch("query_user_id")
    the_bookmark.notes = params.fetch("query_notes")

    if the_bookmark.valid?
      the_bookmark.save
      redirect_to("/bookmarks/#{the_bookmark.id}", { :notice => "Bookmark updated successfully."} )
    else
      redirect_to("/bookmarks/#{the_bookmark.id}", { :alert => "Bookmark failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bookmark = Bookmark.where({ :id => the_id }).at(0)

    the_bookmark.destroy

    redirect_to("/bookmarks", { :notice => "Bookmark deleted successfully."} )
  end
end
