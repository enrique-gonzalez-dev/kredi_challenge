class CreateViews < ActiveRecord::Migration[6.1]
  def change
    create_table :views do |t|
      t.string :ip_address
      t.string :operative_system
      t.string :browser

      t.belongs_to :link

      t.timestamps
    end
  end
end
