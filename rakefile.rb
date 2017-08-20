task :default do
    FileList["./test/node_test.rb", "./test/linked_list_test.rb", "./test/wagon_train_test.rb"].each { |file| ruby file }
end
