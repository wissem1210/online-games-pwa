class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :title
      t.references :game_developer, foreign_key: true
      t.string :category
      t.string :tags
      t.text :description
      t.string :gameType
      t.numeric :width
      t.numeric :height
      t.string :file
      t.string :cover

      t.timestamps
    end
  end
end
