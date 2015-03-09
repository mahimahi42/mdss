=begin rdoc
Wrapper class around helper methods.
=end
class MDSSExtra
=begin rdoc
call-seq:
    puts_warn(err) => nil

Output a warning message to STDOUT.
=end
    def puts_warn(err)
        puts "WARNING: #{err}"
    end

=begin rdoc
call-seq:
    puts_err(err) => nil

Output an error message to STDOUT and terminate.
=end
    def puts_err(err)
        puts "ERROR: #{err}. Terminating"
        exit
    end
end
