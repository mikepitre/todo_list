require_relative "../db/setup.rb"
require_relative "todo"


class TodoList

  def start
    loop do
      @todos = Todo.all
      system('clear')

      puts "---- Todo_List.rb ----"

      view_todos

      puts
      puts "What would you like to do?"
      puts "1) Exit 2) Add Todo 3) Mark Todo As Complete"
      print " > "
      action = gets.chomp.to_i
      case action
      when 1 then exit
      when 2 then add_todo
      when 3 then mark_todo
      else
        puts "\a"
        puts "Not a valid choice"
      end
    end
  end

  def view_todos
    @todos.each do |item|
      puts "#{item.id.to_s} | #{item.entry} | #{item.completed}"
    end
  end

  def add_todo
    puts "Name of Todo > "
    Todo.create(entry: get_input)
  end

  def mark_todo
    puts "Which todo have you finished?"
    Todo.update(get_input, completed: true)
  end


  private
  def get_input
    gets.chomp
  end

  # def save!

  # end
end

TodoList.new.start
