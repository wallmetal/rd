class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end
  
  def show
    @contact = Contact.find_by_id(params[:id])
    if @contact
      @accesses = Access.where(visitor_cookie: @contact.contact_identifications.map(&:visitor_cookie))
    end
  end
end
  
