class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :person_name
      t.string :person_mail
      t.string :description

      t.timestamps
    end
  end
end
