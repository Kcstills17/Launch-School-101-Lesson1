# created todo items class

# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.
require 'pry'
class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


#create a ToDo list class that meets certain functionalities

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title
  attr_reader :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def each
    todos.each do |todo|

      yield(todo)
    end
    self
  end

  def select
    list = TodoList.new(title)

    each do |todo|

      list.add(todo) if yield(todo)
    end
    list

  end

  def add(todo_item)
    if todo_item.class == Todo
      todos << todo_item
    else
      raise TypeError, "Can only add Todo objects"
    end
  end

  def <<(todo_item)
    add(todo_item)
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.to_a
  end

  def done?
    todos.all? {|todo| todo.done}
  end

  def item_at(idx)
    if idx <= todos.size - 1
    todos[idx]
    else
      raise IndexError
  end
end

def mark_done_at(idx)
  if idx <= todos.size - 1
    todos[idx].done!
  else
    raise IndexError
  end
end

def mark_undone_at(idx)
  if idx <= todos.size - 1
    todos[idx].undone!
  else
    raise IndexError
  end
end

def done!
  todos.map {|item| item.done!}
end

def shift
   todos.shift
end

def pop
  todos.pop
end

def remove_at(idx)
  if idx <= todos.size - 1
    todos.delete_at(idx)
  else
    raise IndexError
  end
end

def find_by_title(str)
  chosen = select  {|todo| todo.title == str }
  chosen.first
end

def all_done
  new_list = TodoList.new(title)
  select {|item| new_list.add(item) if item.done}
end


def all_not_done
  new_list = TodoList.new(title)
  select {|item| new_list.add(item) if !item.done}
end

def mark_done(str)
 selected =  select do  |item|
  str == item.title && item.done
 end
 selected
end

def mark_all_done
  each {|item| item.done!}
end

def mark_all_undone
  each {|item| item.undone!}
end


def to_s
  text = "---- #{title} ----\n"
  text << @todos.map(&:to_s).join("\n")
  text
end
end


=begin

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Buy milk")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo                   # calls Todo#to_s
end


#creating a ToDoList#Select method implementation and block functionality



todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

results.inspect
list.select { |todo| todo.done? }.class
list.find_by_title('Buy milk')
list.all_done
list.all_not_done
list.mark_done("Buy milk")
list.mark_all_undone



=end
