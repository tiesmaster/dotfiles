namespace(:janus) do
  VIMDIR = ".vim"

  file VIMDIR do
    system "git clone https://github.com/carlhuda/janus.git #{VIMDIR}"
  end

  desc "Download janus"
  task :download => VIMDIR

  desc "Build janus"
  task :build => :download do
    Dir.chdir VIMDIR
    system "rake"
  end

  desc "Clean dotfiles from the Janus installation"
  task :clean do
    rm_r VIMDIR
  end
end

task :default => "janus:build"
