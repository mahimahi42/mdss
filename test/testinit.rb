# For unit testing classes
require 'test/unit'
# For using files in the tests
require 'fileutils'
# Our class to test
require_relative '../lib/mdss/init'

class TestMDSSInit < Test::Unit::TestCase
    def setup
        @name = "mdss_test"
        Dir.mkdir(@name)
    end

    def teardown
        FileUtils.rm_rf(@name)        
    end

    def test_init_file
        MDSSInit.init_file(@name, "test.file")
        assert(File.exists?("#{@name}/test.file"), "File not created")
    end

    def test_init_file_with_contents
        MDSSInit.init_file(@name, "file.tmp", ["test1\n", "test2"])
        filename = "#{@name}/file.tmp"
        assert(File.exists?("#{@name}/file.tmp"), "File not created")
        str1 = IO.readlines(filename)[0].chomp!
        str2 = IO.readlines(filename)[1]
        assert_equal("test1", str1, "Contents not written")
        assert_equal("test2", str2, "Contents not continued")
    end

    def test_init_dir
        MDSSInit.init_dir(@name, "img", "Image")
        filename = "#{@name}/img"
        assert(File.exists?(filename), "Directory not created")
    end

    def test_init_dir_with_contents
        MDSSInit.init_dir(@name, "css", "CSS", "styles.css")
        filename = "#{@name}/css"
        assert(File.exists?(filename), "Directory not created")
        assert(File.exists?("#{filename}/styles.css"), 
                            "Directory contents not created")
    end
end
