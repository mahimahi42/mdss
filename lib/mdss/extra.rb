class MDSSExtra
    def puts_warn(err)
        puts "WARNING: #{err}"
    end

    def puts_err(err)
        puts "ERROR: #{err}. Terminating"
        exit
    end
end
