skip_vim_plugin "link_vimrc"

vim_plugin_task "vcscommand.vim",   "http://www.vim.org/scripts/download_script.php?src_id=16616"

# redefine the update docs task for Windows, we don't have here documents there
if RUBY_PLATFORM =~ /(win|w)32$/

  task :update_docs do
    puts "Updating VIM Documentation... Fixed version on win32"
    IO.popen("vim -e -s", "r+") do |f|
      f.puts ":helptags ~/.vim/doc\n:quit\n"
    end
  end

end

# move update docs to end of the dependency list
skip_vim_plugin "update_docs"
task :default => :update_docs
