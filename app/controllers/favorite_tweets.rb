class FavoriteTweetsTableViewController < UITableViewController

  extend IB

  def viewDidLoad
    super
  end

  def viewWillAppear(animated)
    super

    @collection = Models::MMTweet.all
    view.reloadData
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
  end

end
