module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Civil War Tracker"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def print_dates(obj)
    if obj.end_date
      "#{obj.begin_date.to_formatted_s(:long)} - #{obj.end_date.to_formatted_s(:long)}"
    else
      "#{obj.begin_date.to_formatted_s(:long)} - end"
    end
  end

end
