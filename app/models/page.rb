class Page < ActiveRecord::Base
  attr_accessible :content, :seo_descr, :seo_keywords, :seo_title, :title
end
