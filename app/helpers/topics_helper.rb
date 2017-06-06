module TopicsHelper
  def disabled
    @topic.bookmarks.empty? ? '' : 'disabled'
  end

  def edit_disabled
    policy(@bookmark).update? ? '' : 'disabled'
  end
end
