module TopicsHelper
  def disabled
    @topic.bookmarks.empty? ? '' : 'disabled'
  end
end
