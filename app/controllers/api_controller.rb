class ApiController < ActionController::Base
  def insert_access
    if params[:visitor_cookie].present? and params[:url].present?
      Access.create(:visitor_cookie => params[:visitor_cookie], :url => params[:url])
    end
  end
  
  def insert_contact
    if params[:email].present? and params[:visitor_cookie].present?
      Contact.create_contact(params[:email], params[:visitor_cookie])
    end
  end
  
end
