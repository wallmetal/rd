class CreateContactIdentifications < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_identifications do |t|
      t.string :visitor_cookie
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
