class TweetsSearchTableViewController < UITableViewController

  extend IB

  outlet :search_bar

  def viewDidLoad
    super
    @collection = [*"a".."z"]
  end

  def tableView(table_view, cellForRowAtIndexPath:index_path)
    item = @collection[index_path.row]
    cell = table_view.dequeueReusableCellWithIdentifier("TweetFromSearch")
    cell.label.text = item
    cell
  end

  def tableView(table_view, numberOfRowsInSection:section)
    @collection.length
  end

  def tableView(table_view, didSelectRowAtIndexPath:index_path)
    selected_row = index_path.row
  end

  def tableView(table_view, viewForHeaderInSection:section)
    search_bar
  end

  def tableView(table_view, heightForHeaderInSection:section)
    44
  end

end
