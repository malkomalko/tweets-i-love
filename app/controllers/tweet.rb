class TweetViewController < UIViewController

  extend IB

  outlet :user_name
  outlet :label
  outlet :profile_image
  outlet :favorite_button

  attr_accessor :tweet, :cached_image

  def viewDidLoad
    super
  end

  def viewWillAppear(animated)
    super

    fill_in_tweet
    toggle_favorite_button
  end

  def fill_in_tweet
    label.text = tweet.text
    user_name.text = tweet.from_user
    profile_image.image = UIImage.imageWithData(cached_image)
  end

  def toggle_favorite_button
    @not_a_fav = Models::MMTweet.one({ id_str: tweet.id_str }).nil?

    if @not_a_fav
      favorite_button.setImage("love_tweet_280x74.png".uiimage, forState:0)
    else
      favorite_button.setImage("remove_tweet_280x74.png".uiimage, forState:0)
    end
  end

  def add_to_favorites(sender)
    if @not_a_fav
      Models::MMTweet.create(tweet.to_hash)
    else
      Models::MMTweet.one({ id_str: tweet.id_str }).delete
    end

    toggle_favorite_button
  end

end
