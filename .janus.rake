# FIXME: don't use an exclude list to remove everything, but remove all plugins
# except for an include list

skip_vim_plugin "color-sampler"
skip_vim_plugin "conque"
skip_vim_plugin "git"
skip_vim_plugin "haml"
skip_vim_plugin "indent_object"
skip_vim_plugin "javascript"
skip_vim_plugin "jslint"
skip_vim_plugin "nerdtree"
skip_vim_plugin "nerdcommenter"
skip_vim_plugin "surround"
skip_vim_plugin "taglist"
skip_vim_plugin "vividchalk"
skip_vim_plugin "solarized"
skip_vim_plugin "supertab"
skip_vim_plugin "cucumber"
skip_vim_plugin "textile"
skip_vim_plugin "rails"
skip_vim_plugin "rspec"
skip_vim_plugin "zoomwin"
skip_vim_plugin "snipmate"
skip_vim_plugin "markdown"
skip_vim_plugin "align"
skip_vim_plugin "unimpaired"
skip_vim_plugin "searchfold"
skip_vim_plugin "endwise"
skip_vim_plugin "irblack"
skip_vim_plugin "vim-coffee-script"
skip_vim_plugin "syntastic"
skip_vim_plugin "puppet"
skip_vim_plugin "scala"
skip_vim_plugin "gist-vim"
skip_vim_plugin "hammer"
skip_vim_plugin "command_t"
skip_vim_plugin "janus_themes"
skip_vim_plugin "molokai"
skip_vim_plugin "mustache"
skip_vim_plugin "arduino"
skip_vim_plugin "vwilight"

skip_vim_plugin "link_vimrc"

def override_install_task(task_name)
   Rake::Task["#{task_name}:install"].actions.clear
   subdirs = VIM::Dirs

   name = task_name
   cwd = File.expand_path("../.vim", __FILE__)
   if RUBY_PLATFORM =~ /(win|w)32$/
      cwd = File.expand_path("../vimfiles", __FILE__)
   end
   dir = File.expand_path("tmp/#{name}")

   namespace(name) do
      task :install => [:pull] + subdirs do
         Dir.chdir dir do
            if File.exists?("Rakefile") and `rake -T` =~ /^rake install/
               sh "rake install"
            elsif File.exists?("install.sh")
               sh "sh install.sh"
            else
               subdirs.each do |subdir|
                  if File.exists?(subdir)
                     sh "cp -RfL #{subdir}/* #{cwd}/#{subdir}/"
                  end
               end
            end
         end

         yield if block_given?
      end
   end
end

override_install_task "fugitive"

# redefine the update docs task for Windows, we don't have here documents there
if RUBY_PLATFORM =~ /(win|w)32$/

	task :update_docs do
		puts "Updating VIM Documentation... Fixed version on win32"
		IO.popen("vim -e -s", "r+") do |f|
			f.puts ":helptags ~/.vim/doc\n:quit\n"
		end
	end

end
