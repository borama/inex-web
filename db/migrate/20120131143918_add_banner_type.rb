class AddBannerType < ActiveRecord::Migration
  def self.up
    add_column :banners, :banner_type, :string, :null => false, :default => 'donor', :length => 20
    Banner.update_all("banner_type = 'project'")

    BuiltinText.new(:name => 'banner_type_donor', :body => 'Donors',:language => Language.find_by_code('en') ).save
    BuiltinText.new(:name => 'banner_type_donor', :body => 'Donoři',:language => Language.find_by_code('cs') ).save
    BuiltinText.new(:name => 'banner_type_partner', :body => 'Partners',:language => Language.find_by_code('en') ).save
    BuiltinText.new(:name => 'banner_type_partner', :body => 'Partneři',:language => Language.find_by_code('cs') ).save
    BuiltinText.new(:name => 'banner_type_project', :body => 'Our projects',:language => Language.find_by_code('en') ).save
    BuiltinText.new(:name => 'banner_type_project', :body => 'Naše projekty',:language => Language.find_by_code('cs') ).save

  end

  def self.down
    remove_column :banners, :banner_type
    BuiltinText.find(:all, :conditions => [ 'name = ?', 'banner_type_donor' ]).each { |c| c.destroy }
    BuiltinText.find(:all, :conditions => [ 'name = ?', 'banner_type_partner' ]).each { |c| c.destroy }
    BuiltinText.find(:all, :conditions => [ 'name = ?', 'banner_type_project' ]).each { |c| c.destroy }
  end
end
