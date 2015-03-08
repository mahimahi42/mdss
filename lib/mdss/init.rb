require 'fileutils'
require_relative 'extra'

class MDSSInit
    def self.mdss_init(name)
        MDSSExtra.new.puts_err("Directory exists") if File.exists?(name)
        
        Dir.mkdir(name)

        File.open("#{name}/.mdss.cfg", 'w+') do |cfg|
            cfg.write("name=#{name}")
        end

        self.css(name)
        self.img(name)
        self.js(name)        
    end

    def self.css(name)
        if File.exists?("#{name}/css")
            MDSSExtra.new.puts_warn("CSS folder exists, skipping")
        else
            Dir.mkdir("#{name}/css")
            FileUtils.touch("#{name}/css/styles.css")
        end
    end

    def self.img(name)
        if File.exists?("#{name}/img")
            MDSSExtra.new.puts_warn("Image folder exists, skipping")
        else
            Dir.mkdir("#{name}/img")
        end
    end

    def self.js(name)
        if File.exists?("#{name}/js")
            MDSSExtra.new.puts_warn("JavaScript folder exists, skipping")
        else
            Dir.mkdir("#{name}/js")
            FileUtils.touch("#{name}/js/scripts.js")
        end
    end
end
