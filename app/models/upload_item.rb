class UploadItem < ActiveRecord::Base
  belongs_to :story
  
  #  paperclip
  has_attached_file :upload, 
                    :styles => { :thumb => { :geometry => "200x200>",
                                           :format => :png }},
                    :whiny => false
  
  validates_attachment_content_type :upload, 
                                      :content_type => ['image/jpeg', 
                                        'image/png', 
                                        'image/gif', 
                                        'image/pjpeg', 
                                        'image/x-png', 
                                        'image/jpeg2000', 
                                        'application/pdf'], :message => 'Uploaded file is not an image nor pdf'
  validates_attachment_presence :upload, :message => "keine datei"
  
  # validation
  #validates_presence_of :title, :message => "Bitte geben Sie einen Titel an."
  validates_acceptance_of :upload_rules, 
                          :on => :create,
                          :message => "Bitte akzeptieren Sie die Regeln f&uuml;r das Hochladen der Dataien."
  
  #attr_accessible :upload_rules
  
  validates_presence_of :story_id, :message => "keine story angegeben!"
  #validates_associated    :participant
  
  
  #after_save :fix_preview_content_type!

  #def fix_preview_content_type!
  #  t self.upload.url(:thmub)
  #  t.content_type = 'image/png'
  #end
end
