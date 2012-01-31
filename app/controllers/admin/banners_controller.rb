class Admin::BannersController < Admin::AdminController

  active_scaffold :banners do |c|
    c.columns = [ :banner_type, :image_filename, :order, :name, :url ]
    c.columns[:banner_type].form_ui = :select
    c.columns[:image_filename].form_ui = :select

    c.columns[:banner_type].description = '<br/>Is this a "Donor", "Partner" or "Project" banner?'
    c.columns[:image_filename].description = '<br/>Banner image size should be 164x123 pixels.'
    c.columns[:url].description = '<br/>Full address of the link (for example "http://www.seznam.cz")'
    c.columns[:name].description = '<br/>Name of the referred page'
    c.columns[:order].description = '<br/>The lower the number, the sooner the image will be present in the slideshow of all banners of the same type.'

    c.columns[:banner_type].options = Banner.banner_type_select_options
  end

  # must be included after the 'active_scaffold' call to work
  include LanguageAware

  prepare_image_filename_select

  def do_new
    super
    @image_filename_select_options ||= @@image_filename_select_options
  end

  def do_edit
    super
    @image_filename_select_options ||= @@image_filename_select_options
  end

end
