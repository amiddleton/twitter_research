class Tweet < ActiveRecord::Base
 attr_accessible(:twitter_user, :tweeted_text, :tweeted_at, :user_id)

  validates(:twitter_user, :presence => true, :uniqueness => true)
  validates(:tweeted_text, :presence => true)
  validates(:tweeted_at, :presence => true)
  validates(:user_id, :presence => true,)

  belongs_to(:user)
  has_and_belongs_to_many(:categories)

  def suggested_categories

    text = tweeted_text.gsub(/#/, '').downcase.split.sort
    titles = Category.all.map(&:title).map(&:downcase)

    c = text & titles

    c.map(&:capitalize).sort.join(', ')
  end
end


#String#split
#String#downcase
#Array#join

#titles.include?(t)
#text.inject([]) do |collector, word|
#match = categories.detect {|c| c.title_match?(t)}
#collector << match.title if match
#collector
#t = text.downcase.split.sort
#c.sort.join(', ')
