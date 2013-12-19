class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.date :scheduled_on
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
