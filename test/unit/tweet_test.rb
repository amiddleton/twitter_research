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

  def test_setting_categories_from_a_string
    tweet = Tweet.new
    cat = Category.where(title: "2013").first
    assert(cat)

    tweet.categories << cat
    assert_equal(1, tweet.categories.size)

    tweet.categories_as_string = "Football, Huskers"
    assert_equal(2, tweet.categories.size)
    assert_equal(%w(Football Huskers), tweet.categories.map(&:title).sort)

  end
end
