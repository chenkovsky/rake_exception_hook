require_relative "../lib/rake_exception_hook.rb"

desc "step0"
task "step0" do
    puts "step0 begin"
    sleep 1
    puts "step0 end"
end

desc "step1"
task "step1" do
    puts "step1 begin"
    sleep 1
    puts "step1 end"
end

desc "step2"
task "step2" => ["step1", "step0"] do
    sleep 1
    puts "step2"
end

desc "step3"
task "step3" => ["step1"] do
    sh "err_command"
end

#begin
#monkey patch
#use this monkey patch to init cluster and deinit cluster and cp files between s3 and hadoop
RakeExceptionHook.start do
    puts "start"
end

RakeExceptionHook.finish do
    puts "finish"
end

RakeExceptionHook.except do
    puts "except"
end


