class MediaFileImage < MediaFile

  belongs_to :media_album  

  def displayable?
    true
  end

  def browser_name
    "browser_image"
  end
  
  def thumbnail?(w,h)
    File.exists? absolute_filename(w, h)
  end

  def thumbnail!(w,h)
    return if File.exists? absolute_filename(w, h)
    thumb = Thumber::make_thumbnail(absolute_filename, w, h)
    previous_umask = File.umask(0002) # set group write perms
    File::makedirs(media_album.absolute_path(w, h))
    thumb.write(absolute_filename(w, h))
    File.umask(previous_umask)
  end

end