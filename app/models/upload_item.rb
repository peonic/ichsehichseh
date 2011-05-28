class UploadItem < ActiveRecord::Base
  belongs_to :participant
  
  #  paperclip
  has_attached_file :upload
  
  validates_attachment_content_type :upload, :content_type => ['image/jpeg', 'image/png']
  validates_attachment_presence :upload, :message => "keine datei"
  
  # validation
  validates_presence_of :titel, :message => "Bitte geben Sie einen Titel an."
  validates_acceptance_of :upload_rules, 
                          :on => :create, :accept => true,
                          :message => "Bitte akzeptieren Sie die Regeln f&uuml;r das Hochladen der Dataien."
  #validates_associated    :participant
  
end
