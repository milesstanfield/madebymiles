namespace :sprites do
  task :build do
    SpriteBuilder.new.build
  end
end
