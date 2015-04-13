# -*- encoding : utf-8 -*-
module ApplicationHelper
  #Returns the full title on per-page basis.
  def full_title(page_title)
    base_title = "117号车酷酒吧烧烤"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end    
end
