class CreateCollaborators < ActiveRecord::Migration[5.1]
  def change
    create_table :collaborators do |t|
     t.references :user, index: true 
     t.references :wiki, index: true
     t.string :email
     t.timestamps null: false
     
     end
  end
end
