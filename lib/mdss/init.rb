# To create empty files
require 'fileutils'
# For helper methods
require_relative 'extra'

=begin rdoc
MDSSInit serves to create new simple static sites.
=end
class MDSSInit
    # Instance of our helper methods class
    @@helper = MDSSExtra.new

=begin rdoc
call-seq:
    MDSSInit.mdss_init(name) => nil

Create a new simple static site in the directory specified by name. If a directory with the specified name exists, it tries to create the necessary files and directories with #init_dir.
=end
    def self.mdss_init(name)
        if File.exists?(name)
            MDSSExtra.new.puts_warn("Directory exists") 
        else
            Dir.mkdir(name)
        end

        self.init_file(name, ".mdss.cfg", ["name=#{name}"])
        self.init_file(name, "index.md")

        self.init_dir(name, "css", "CSS", "styles.css")
        self.init_dir(name, "js", "JavaScript", "scripts.js")
        self.init_dir(name, "img", "Image")
    end

=begin rdoc
call-seq:
    MDSSInit.init_dir(name, dirname, warn) => nil
    MDSSInit.init_dir(name, dirname, warn, file) => nil

Create a new directory for the simple static site. warn is used to specify the name of the folder for the warning message if the directory specified by dirname exists. If a filename is specified, that file is created within the directory.
=end
    def self.init_dir(name, dirname, warn, file = nil)
        if File.exists?("#{name}/#{dirname}")
            helper.puts_warn("#{warn} folder exists, skipping")
        else
            Dir.mkdir("#{name}/#{dirname}")
            FileUtils.touch("#{name}/#{dirname}/#{file}") unless file.nil?
        end
    end

=begin rdoc
call-seq:
    MDSSInit.init_file(name, file) => nil
    MDSSInit.init_file(name, file, contents) => nil

Create a new file in the parent directory for the site. If contents are specified as an array of strings, they are written to the file, else a blank file is created.
=end
    def self.init_file(name, file, contents = nil)
        if contents.nil?
            FileUtils.touch("#{name}/#{file}")
        else
            File.open("#{name}/#{file}", "w+") do |file|
                contents.each do |line|
                    file.write(line)
                end
            end
        end
    end
end
