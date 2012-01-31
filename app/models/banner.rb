class Banner < ActiveRecord::Base
  belongs_to :language
  validates_presence_of :url, :image_filename, :name, :language, :banner_type

  def self.find_by_language(lang)
    find(:all, :conditions => [ 'language_id = ?', lang.id ], :order => 'banners.order ASC')
  end

  def self.banner_type_select_options
    [ ['Donor', 'donor'], ['Partner', 'partner'], ['Our project', 'project'] ]
  end
end
