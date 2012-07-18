require 'test_helper'

class TweetTest < ActiveSupport::TestCase

  setup do
    %w(Football Huskers 2013 Politics Hiking).each do |title|
      Category.create!(title: title)
    end
  end

  test("suggested categories works correctly") do
    tweet = Tweet.new do |t|
      t.tweeted_text = "huskers #Football will rock in 2013"
    end

    assert_equal("2013, Football, Huskers", tweet.suggested_categories)
  end
end
