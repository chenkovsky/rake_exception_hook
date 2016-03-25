module RakeExceptionHook
    VERSION = "3.14"
    @@start_hook = nil
    @@finish_hook = nil
    @@except_hook = nil

    def self.start &block
        @@start_block = block
    end

    def self.finish &block
        @@finish_block = block 
    end

    def self.except &block
        @@except_block = block
    end

    def self.start_hook
        @@start_block
    end

    def self.finish_hook
        @@finish_block
    end

    def self.except_hook
        @@except_block
    end
end


module Rake
    class Application
        def top_level
            run_with_threads do
                if options.show_tasks
                  display_tasks_and_comments
                elsif options.show_prereqs
                  display_prerequisites
                else
                    if RakeExceptionHook.start_hook
                        RakeExceptionHook.start_hook.call
                    end
                    top_level_tasks.each { |task_name| invoke_task(task_name) }
                    if RakeExceptionHook.finish_hook
                        RakeExceptionHook.finish_hook.call
                    end
                end
            end
        end
        alias_method :old_display_error_message, :display_error_message
        def display_error_message(ex)
            if RakeExceptionHook.except_hook
                RakeExceptionHook.except_hook.call ex
            end
            old_display_error_message ex
        end
    end
end