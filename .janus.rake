skip_vim_plugin "link_vimrc"

# redefine the update docs task for Windows, we don't have here documents there
if RUBY_PLATFORM =~ /(win|w)32$/

	task :update_docs do
		puts "Updating VIM Documentation... Fixed version on win32"
		IO.popen("vim -e -s", "r+") do |f|
			f.puts ":helptags ~/.vim/doc\n:quit\n"
		end
	end

end
