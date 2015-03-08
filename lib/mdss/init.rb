require_relative 'extra'

class MDSSInit
    def self.mdss_init(name)
        MDSSExtra.new.puts_err("Directory exists") if File.exists?(name)
        
        Dir.mkdir(name)

        File.open("#{name}/.mdss.cfg", 'w+') do |cfg|
            cfg.write("name=#{name}")
        end        
    end
end
