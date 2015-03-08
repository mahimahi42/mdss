require 'mdss/extra'
require 'mdss/init'

class MDSS
    def self.get_extra
        MDSSExtra.new
    end

    def self.mdss_init(name)
        MDSSInit.mdss_init name
    end
end
