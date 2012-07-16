class Tweet < ActiveRecord::Base
 attr_accessible(:twitter_user, :tweeted_text, :tweeted_at, :user_id)

  validates(:twitter_user, :presence => true, :uniqueness => true)
  validates(:tweeted_text, :presence => true)
  validates(:tweeted_at, :presence => true)
  validates(:user_id, :presence => true,)

  belongs_to(:user)
end
