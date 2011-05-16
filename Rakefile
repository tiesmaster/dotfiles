file "janus" do
	system "git clone https://github.com/carlhuda/janus.git"
end

file :deploy_janus => "janus"

task :build_janus => :deploy_janus do
	Dir.chdir 'janus'
	system 'rake'
end

task :default => :build_janus
