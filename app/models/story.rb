class Story < ActiveRecord::Base
  belongs_to :user
  has_many :upload_item
  
  validates_presence_of :name, :message => "Bitte geben Sie einen Stroynamen an."
  validates_presence_of :user_id, :message => "keine user id angegeben!"

  #validates_associated :user, :message => "Kein Benutzer zugeortnet, Fehler"
end
