class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.column(:title, :string, null: false)
      t.timestamps
    end

    create_table(:categories_tweets, id: false) do |t|
      t.integer(:category_id, null: false)
      t.integer(:tweet_id, null: false)
    end

    add_index(:categories_tweets, :category_id)
    add_index(:categories_tweets, :tweet_id)
  end
end
