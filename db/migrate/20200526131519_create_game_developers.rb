class CreateGameDevelopers < ActiveRecord::Migration[5.1]
  def change
    create_table :game_developers do |t|
      t.string :username
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
