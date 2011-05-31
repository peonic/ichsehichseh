class User < ActiveRecord::Base  
  has_many :story
  #has_one :user_information
  
  acts_as_authentic 
 
 
  # validation user data
  validates_presence_of :name, :message => "Bitte geben Sie einen Namen an."
  validates_presence_of :street, :message => "Bitte geben Sie einen Strassenamen an."
  validates_presence_of :city, :message => "Bitte geben Sie einen Ortsname an."
  validates_presence_of :zip, :message => "Bitte geben Sie eine PLZ an."
  validates_presence_of :telephone, :message =>  "Bitte geben Sie eine Telefonnummer an."
  validates_presence_of :birthday, :message => "Bitte geben Sie ein Geburtsdatum ein."
  
  validates_length_of :name, :maximum => 100, :message => "Namen: maximale L&auml;nge von 42 Zeichen!"
  validates_length_of :street, :maximum => 42, :message => "Strasse: maximale L&auml;nge von 42 Zeichen!"
  validates_length_of :city, :maximum => 42, :message => "Ort: maximale L&auml;nge von 42 Zeichen!"
  validates_length_of :zip, :maximum => 5, :message => "PLZ nicht laenger als 4 Stellen"
  validates_length_of :zip, :minimum => 4, :message => "PLZ nicht 4-stellig"

  
  validates_format_of :zip, :with => /^([0-9]+)/i, :message => "Zip ung&uuml;ltig: erlaubt 4 Stellen, Zeichen von 0-9!"
  validates_format_of :telephone, :with => /^([0-9]+)/i, :message => "Telefonnummer ung&uuml;ltig: erlaubt 20 Stellen, Zeichen von 0-9!"    
  
  # validation login
  validates_presence_of :email, :message =>  "Bitte geben Sie eine Email Adresse an."
  validates_length_of :password, :minimum => 4, :message => "Passwort laenger als 4 Stellen"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, :message => "Email Adresse nicht korrekt"

end
