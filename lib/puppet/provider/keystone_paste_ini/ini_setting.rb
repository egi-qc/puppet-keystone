Puppet::Type.type(:keystone_paste_ini).provide(
  :ini_setting,
  :parent => Puppet::Type.type(:ini_setting).provider(:ruby)
) do

  def section
    resource[:name].split('/', 2).first
  end

  def setting
    resource[:name].split('/', 2).last
  end

  def separator
    '='
  end

  def self.file_path
    '/etc/keystone/keystone-paste.ini'
  end

  # this needs to be removed. This has been replaced with the class method
  def file_path
    case Facter.value(:osfamily)
    when 'RedHat'
      '/usr/share/keystone/keystone-dist-paste.ini'
    else
      '/etc/keystone/keystone-paste.ini'
    end
  end

end
