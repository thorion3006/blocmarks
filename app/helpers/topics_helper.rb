module TopicsHelper
  def paginate
    @topic.bookmarks.each_slice(4).to_a
  end

  def disabled
    @topic.bookmarks.empty? ? '' : 'disabled'
  end
end
