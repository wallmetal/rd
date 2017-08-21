class Contact < ApplicationRecord
  has_many :contact_identifications
  
  def self.create_contact(email, visitor_cookie)
    @contact = self.find_or_create_by(:email => email)
    ContactIdentification.find_or_create_by(:contact_id => @contact.id, :visitor_cookie => visitor_cookie)
  end
end
