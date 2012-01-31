module BannersHelper

  def render_banners
    banners = Banner.find_by_language(@current_language)

    ret = content_tag(:div, :id => 'banners') do
      inner1 = ""
      %w(donor partner project).each do |banner_type|
        inner1 << content_tag(:div, :class => "banner") do
          inner2 = content_tag(:p, bt("banner_type_#{banner_type}"), :class => 'banner_title')
          inner2 << content_tag(:ul, :id => "banner_#{banner_type}") do
            inner3 = ""
            z_index = 100
            banners.each do |banner|
              next unless banner.banner_type == banner_type

              #  FIXME - avoid usage of magic constants!
              image = image_tag "/data/articleimages/#{banner.image_filename}", :size => '164x123', :alt => banner.name
              inner3 << content_tag(:li, link_to(image, banner.url, :title => banner.name, :target => :blank), :style => "z-index:#{z_index}")
              z_index -= 1
            end
            inner3
          end
        end
      end
      inner1 << "\n"
    end

    ret
  end

end
