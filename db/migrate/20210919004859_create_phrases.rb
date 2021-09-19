class CreatePhrases < ActiveRecord::Migration[5.2]
  def change
    create_table :phrases do |t|
      t.string :singer
      t.string :title
      t.string :lyric
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
