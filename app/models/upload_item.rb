class UploadItem < ActiveRecord::Base
  belongs_to :participant
  
   # validation
  validates_presence_of :upload_data, :message => "keine Datei ausgewählt"
  validates_presence_of :titel, :message => "Bitte geben Sie einen Titel an."
  validates_acceptance_of :upload_rules, 
                          :on => :create, :accept => true,
                          :message => "Bitte akzeptieren Sie die Regeln f&uuml;r das Hochladen der Dataien."
  validates_associated    :participant
end
