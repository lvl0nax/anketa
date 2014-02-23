ActiveAdmin.register Page do
  form do |f|
    f.inputs do
      f.input :title
      f.input :content, as: :html_editor
      f.input :seo_title
      f.input :seo_descr
      f.input :seo_keywords
    end

    f.buttons
  end
end
