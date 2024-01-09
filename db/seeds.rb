if Rails.env.development?
  Message.create(person_name: 'Philipe', person_mail: 'philipe@teste.com', description: 'seeds message')
end
