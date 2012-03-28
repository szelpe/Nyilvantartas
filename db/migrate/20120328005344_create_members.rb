class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :nick
      t.string :email
      t.text :positions
      t.boolean :is_senior
      t.text :introduction
      t.string :image_link

      t.timestamps
    end
  end
end
