module ApplicationHelper

  def get_page_title 
    @content_for_title
  end

  def set_page_title(title)
    @content_for_title = title
  end



end
