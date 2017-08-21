require 'rails_helper'
require 'spec_helper'
require 'contact'
require 'contact_identification'

describe Contact do
  it "should save a contact and a contact_identification" do
    @contacts = Contact.all
    expect(@contacts.length).to eq(0)
    @contact_identifications = ContactIdentification.all
    expect(@contact_identifications.length).to eq(0)
    email = 'asd@mail.com'
    visitor_cookie = '1235983476565'
    Contact.create_contact(email, visitor_cookie)
    @contacts = Contact.all
    expect(@contacts.length).to eq(1)
    @contact = @contacts.first
    @contact_identifications = ContactIdentification.all
    expect(@contact_identifications.length).to eq(1)
    @contact_identification = @contact_identifications.first;
    expect(@contact_identification.contact_id).to eq(@contact.id)
    expect(@contact_identification.visitor_cookie).to eq('1235983476565')
    expect(@contact.email).to eq('asd@mail.com')
    expect(@contact.contact_identifications.length).to eq(1)
    expect(@contact.contact_identifications.first.visitor_cookie).to eq('1235983476565')
  end
  it "should save a new contact and a new contact_identification" do
    @contacts = Contact.all
    expect(@contacts.length).to eq(0)
    @contact_identifications = ContactIdentification.all
    expect(@contact_identifications.length).to eq(0)
    email = 'asd@mail.com'
    visitor_cookie = '1235983476565'
    Contact.create_contact(email, visitor_cookie)
    email_new = 'fef@mail.com'
    visitor_cookie_new = '23848949889'
    Contact.create_contact(email_new, visitor_cookie_new)
    @contacts = Contact.all
    expect(@contacts.length).to eq(2)
    @contact_identifications = ContactIdentification.all
    expect(@contact_identifications.length).to eq(2)
    expect(@contact_identifications[0].contact_id).to eq(@contacts[0].id)
    expect(@contact_identifications[0].visitor_cookie).to eq('1235983476565')
    expect(@contact_identifications[1].contact_id).to eq(@contacts[1].id)
    expect(@contact_identifications[1].visitor_cookie).to eq('23848949889')
    expect(@contacts[0].email).to eq('asd@mail.com')
    expect(@contacts[0].contact_identifications.length).to eq(1)
    expect(@contacts[0].contact_identifications.first.visitor_cookie).to eq('1235983476565')
    expect(@contacts[1].email).to eq('fef@mail.com')
    expect(@contacts[1].contact_identifications.length).to eq(1)
    expect(@contacts[1].contact_identifications.first.visitor_cookie).to eq('23848949889')
  end

  it "should save a new contact_identification but not a new contact" do
    @contacts = Contact.all
    expect(@contacts.length).to eq(0)
    @contact_identifications = ContactIdentification.all
    expect(@contact_identifications.length).to eq(0)
    email = 'asd@mail.com'
    visitor_cookie = '1235983476565'
    visitor_cookie_new = '23848949889'
    Contact.create_contact(email, visitor_cookie)

    Contact.create_contact(email, visitor_cookie_new)
    @contacts = Contact.all
    expect(@contacts.length).to eq(1)
    @contact = @contacts.first
    @contact_identifications = ContactIdentification.all
    expect(@contact_identifications.length).to eq(2)
    expect(@contact_identifications[0].contact_id).to eq(@contact.id)
    expect(@contact_identifications[1].contact_id).to eq(@contact.id)
    expect(@contact_identifications[0].visitor_cookie).to eq('1235983476565')
    expect(@contact_identifications[1].visitor_cookie).to eq('23848949889')
    expect(@contact.email).to eq('asd@mail.com')
    expect(@contact.contact_identifications.length).to eq(2)
    expect(@contact.contact_identifications.first.visitor_cookie).to eq('1235983476565')
    expect(@contact.contact_identifications[1].visitor_cookie).to eq('23848949889')
  end

  it "should not save a new contact_identification neither a new contact" do
    @contacts = Contact.all
    expect(@contacts.length).to eq(0)
    @contact_identifications = ContactIdentification.all
    expect(@contact_identifications.length).to eq(0)
    email = 'asd@mail.com'
    visitor_cookie = '1235983476565'
    Contact.create_contact(email, visitor_cookie)

    Contact.create_contact(email, visitor_cookie)
    @contacts = Contact.all
    expect(@contacts.length).to eq(1)
    @contact = @contacts.first
    @contact_identifications = ContactIdentification.all
    expect(@contact_identifications.length).to eq(1)
    @contact_identification = @contact_identifications.first;
    expect(@contact_identification.contact_id).to eq(@contact.id)
    expect(@contact_identification.visitor_cookie).to eq('1235983476565')
    expect(@contact.email).to eq('asd@mail.com')
    expect(@contact.contact_identifications.length).to eq(1)
    expect(@contact.contact_identifications.first.visitor_cookie).to eq('1235983476565')
  end
end