class Tweet < ActiveRecord::Base
 attr_accessible(:twitter_user, :tweeted_text, :tweeted_at, :user_id)

  validates(:twitter_user, :presence => true, :uniqueness => true)
  validates(:tweeted_text, :presence => true)
  validates(:tweeted_at, :presence => true)
  validates(:user_id, :presence => true,)

  belongs_to(:user)
  has_and_belongs_to_many(:categories)

  scope(:recent, order('tweeted_at desc'))

  def suggested_categories

    text = tweeted_text.gsub(/#/, '').downcase.split.sort
    titles = Category.all.map(&:title).map(&:downcase)

    c = text & title

    c.map(&:capitalize).sort.join(', ')
  end

  #This is the getter method, it returns a comma separated string of the current
  #category titles.
  def categories_as_string
    categories.map(&:title).sort.join(', ')
  end

  #This is the setter method.  Given a comma separated string of category titles
  #it resets the categories for this tweet to the categories in the string.
  def categories_as_string= (new_categories)
    categories.clear

    new_categories.split(/\s*,\s*/).each do |title|
      cat = Category.where('LOWER(title) = ?', title.downcase).first
      categories << cat if cat
    end
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
