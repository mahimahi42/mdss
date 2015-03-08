class MDSSExtra
    def self.puts_warn(err)
        puts "WARNING: #{err}"
    end

    def self.puts_err(err)
        puts "ERROR: #{err}. Terminating"
        exit
    end
end
