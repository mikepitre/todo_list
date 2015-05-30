class TodoList

  def initialize(file_name)
    @file_name = file_name
  end

  def start
    loop do
      system('clear')

      puts "---- TODO.rb ----"

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

  def todos
    @todos
  end

  def view_todos
    counter = 0
    puts "Unfinished"
    unfinished_todos = @todos.select { |todo| todo["completed"] == "no" }
    unfinished_todos.each do |row|
      counter += 1
      puts "#{counter}) #{row["name"]}"
    end
    puts "Completed"
  end

  def add_todo
    puts "Name of Todo > "
    @todos << [get_input, "no"]
    save!
  end

  def mark_todo
    puts "Which todo have you finished?"
    @todos[get_input.to_i - 1]["completed"] = "yes"
    save!
  end


  private
  def get_input
    gets.chomp
  end

  # def save!

  # end
end
