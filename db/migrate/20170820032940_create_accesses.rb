class CreateAccesses < ActiveRecord::Migration[5.1]
  def change
    create_table :accesses do |t|
      t.string :visitor_cookie
      t.string :url

      t.timestamps
    end
  end
end
