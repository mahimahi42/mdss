require 'fileutils'
require_relative 'extra'

class MDSSInit
    @@helper = MDSSExtra.new

    def self.mdss_init(name)
        MDSSExtra.new.puts_err("Directory exists") if File.exists?(name)
        
        Dir.mkdir(name)

        File.open("#{name}/.mdss.cfg", 'w+') do |cfg|
            cfg.write("name=#{name}")
        end
        FileUtils.touch("#{name}/index.md")

        self.init_dir(name, "css", "CSS", "styles.css")
        self.init_dir(name, "js", "JavaScript", "scripts.js")
        self.init_dir(name, "img", "Image")
    end

    def self.init_dir(name, dirname, warn, file = nil)
        if File.exists?("#{name}/#{dirname}")
            helper.puts_warn("#{warn} folder exists, skipping")
        else
            Dir.mkdir("#{name}/#{dirname}")
            FileUtils.touch("#{name}/#{dirname}/#{file}") unless file.nil?
        end
    end
end
