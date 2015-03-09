# Get our helper functions
require 'mdss/extra'
# Get the MDSS initializer
require 'mdss/init'

=begin rdoc
MDSS will serve as the main class for the gem, providing the hooks to the inner working classes as needed.
=end
class MDSS

=begin rdoc
call-seq:
    MDSS.get_extra => MDSSExtra

Provides an instance of MDSSExtra for helper functions throughout the MDSS gem.
=end
    def self.get_extra
        MDSSExtra.new
    end

=begin rdoc
call-seq:
    MDSS.mdss_init(name) => nil

Creates a new simple static site in the directory specified by name. If the directory exists, it will attempt to setup a simple static site within it anyway.
=end
    def self.mdss_init(name)
        MDSSInit.mdss_init name
    end
end
