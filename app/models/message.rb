class Message < ApplicationRecord

  validates_presence_of :description, :person_name, :person_mail
end
