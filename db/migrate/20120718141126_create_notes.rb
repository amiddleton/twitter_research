class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text(:note_text, :null => false)
      t.integer(:user_id, :null => false)
      t.integer(:tweet_id, :null => false)
      t.timestamps
    end
    add_index(:notes, :user_id)
    add_index(:notes, :tweet_id)
  end
end
