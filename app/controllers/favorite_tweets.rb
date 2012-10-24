class FavoriteTweetsTableViewController < UITableViewController

  extend IB

  def viewDidLoad
    super

    @selected_tweet = App.storyboard.initController("CurrentTweet")
    setup_events
  end

  def viewWillAppear(animated)
    super

    @collection = Models::MMTweet.all
    view.reloadData
  end

  def setup_events
    App.notification_center.observe("tweets:favorite") do |notification|
      view.cached_images = {}
    end
  end

  # table view delegates

  def tableView(table_view, cellForRowAtIndexPath:index_path)
    tweet = @collection[index_path.row]
    cell = table_view.dequeueReusableCellWithIdentifier("TweetFromSearch")

    url = tweet.profile_image_url
    table_view.image_from_url(url, cell.profile_image, index_path)

    cell.label.text = tweet.text
    cell
  end

  def tableView(table_view, numberOfRowsInSection:section)
    @collection.length
  end

  def tableView(table_view, didSelectRowAtIndexPath:index_path)
    tweet = @collection[index_path.row]

    @selected_tweet.tweet = tweet
    @selected_tweet.cached_image = table_view.cached_images[index_path.row]
    App.nav_controller << @selected_tweet
  end

end
