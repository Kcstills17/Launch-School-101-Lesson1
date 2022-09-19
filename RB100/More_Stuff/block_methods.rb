def execute(&block)
  block
end
 p execute{puts "hello from inside the execute method"}
#nothing is shown here because nothing is actually called.  The method returns a Proc object #<Proc:0x0000564fd5419300



# make the above block method execute properly

def execute2(&block)
  block.call  # we have to call a block method like any other. so this is the way of achieving this.
end

execute2  {puts "hello from inside the execute method"} # we can now execute the block method! also a do end block also works the same way

# execute2 do
#puts "hello from inside the execute method"
#end

