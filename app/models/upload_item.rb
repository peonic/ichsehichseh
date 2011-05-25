class UploadItem < ActiveRecord::Base
  belongs_to :participant
  
  has_attachment :content_type =>  ['application/pdf', :image],
    :storage => :file_system, 
    :path_prefix => 'public/uploads',
    :max_size => 10240.kilobytes,
    :processor => 'Rmagick'
  
  # validation
  validates_presence_of :uploaded_data, :message => "keine Datei ausgewählt"
  validates_presence_of :titel, :message => "Bitte geben Sie einen Titel an."
  validates_acceptance_of :upload_rules, 
                          :on => :create, :accept => true,
                          :message => "Bitte akzeptieren Sie die Regeln f&uuml;r das Hochladen der Dataien."
  #validates_associated    :participant
  
  validates_as_attachment
end
