
Examples:

    require "rake_exception_hook"
    RakeExceptionHook.start do
        puts "start"
    end

    RakeExceptionHook.finish do
        puts "finish"
    end

    RakeExceptionHook.except do
        puts "except"
    end


