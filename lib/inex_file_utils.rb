module InexFileUtils
  #
  # same as ftools::makedirs except that this version allows creating directories
  # with write-enabled access rights for groups
  #
  def self.makedirs_gw(*dirs)
    verbose = if dirs[-1].is_a? String then false else dirs.pop end
    mode = 0775  # this is the change...
    for dir in dirs
      parent = File::dirname(dir)
      next if parent == dir or File::directory? dir
      InexFileUtils.makedirs_gw parent unless File::directory? parent
      $stderr.print "mkdir ", dir, "\n" if verbose
      if File::basename(dir) != ""
        begin
          Dir.mkdir dir, mode
        rescue SystemCallError
          raise unless File::directory? dir
        end
      end
    end
  end

end