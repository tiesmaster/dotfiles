namespace(:janus) do

	BACKUP_DIR = ".vim/backup"
	directory BACKUP_DIR

	file "janus" do
		`git clone https://github.com/carlhuda/janus.git`
	end

	desc "Download janus"
	task :download => "janus"

	desc "Build janus"
	task :build => :download do
		Dir.chdir "janus"
		system "rake"
	end
end

task :default => [BACKUP_DIR, "janus:build"]
