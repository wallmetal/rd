require 'rails_helper'
require 'spec_helper'
require 'api_controller'
require 'contact'
require 'contact_identification'
require 'access'

describe ApiController do
  before(:each) do
    @api_controller = ApiController.new
  end
  describe 'insert_access' do
    it "should create an access" do
      @accesses = Access.all
      expect(@accesses.length).to eq(0)
      params = {:url => 'www.teste.com.br/home', :visitor_cookie => '63462346344'}
      @api_controller.params = params
      @api_controller.insert_access
      @accesses = Access.all
      expect(@accesses.length).to eq(1)
      expect(@accesses[0].url).to eq('www.teste.com.br/home')
      expect(@accesses[0].visitor_cookie).to eq('63462346344')
    end
    it "should not create an access if url is not present" do
      @accesses = Access.all
      expect(@accesses.length).to eq(0)
      params = {:url => '', :visitor_cookie => '63462346344'}
      @api_controller.params = params
      @api_controller.insert_access
      @accesses = Access.all
      expect(@accesses.length).to eq(0)
    end
    it "should not create an access if visitor_cookie is not present" do
      @accesses = Access.all
      expect(@accesses.length).to eq(0)
      params = {:url => 'www.teste.com.br/home', :visitor_cookie => ''}
      @api_controller.params = params
      @api_controller.insert_access
      @accesses = Access.all
      expect(@accesses.length).to eq(0)
    end
  end
  describe 'insert_contact' do
    it "should create an contact" do
      @contacts = Contact.all
      expect(@contacts.length).to eq(0)
      params = {:email => 'asd@mail.com', :visitor_cookie => '63462346344'}
      @api_controller.params = params
      @api_controller.insert_contact
      @contacts = Contact.all
      expect(@contacts.length).to eq(1)
      expect(@contacts[0].email).to eq('asd@mail.com')
      expect(@contacts[0].contact_identifications.length).to eq(1)
      expect(@contacts[0].contact_identifications[0].visitor_cookie).to eq('63462346344')
    end
    it "should not create an contact if email is not present" do
      @contacts = Contact.all
      expect(@contacts.length).to eq(0)
      params = {:email => '', :visitor_cookie => '63462346344'}
      @api_controller.params = params
      @api_controller.insert_contact
      @contacts = Contact.all
      expect(@contacts.length).to eq(0)
    end
    it "should not create an contact if visitor_cookie is not present" do
      @contacts = Contact.all
      expect(@contacts.length).to eq(0)
      params = {:email => 'asd@mail.com', :visitor_cookie => ''}
      @api_controller.params = params
      @api_controller.insert_contact
      @contacts = Contact.all
      expect(@contacts.length).to eq(0)
    end
  end
end 
