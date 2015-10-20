require 'pg'

class Task
  def initialize(name, list_id, completed)
    @name = name
    @list_id = list_id
    @completed = completed
  end

  def name
    @name
  end

  def list_id
    @list_id
  end
  
  def completed
    @completed
  end

  def save
    DB.exec("INSERT INTO tasks (name, list_id, completed) VALUES ('#{@name}', #{@list_id}, #{@completed});")
  end

  def self.all
    results = DB.exec("SELECT * FROM tasks;")
    tasks = []
    results.each do |result|
      name = result['name']
      list_id = result['list_id'].to_i
      # if result['completed'] == 't'
      #   completed = true
      # else
      #   completed = false
      # end
      completed = (result['completed'] == 't')
      tasks << Task.new(name, list_id, completed)
    end
    tasks
  end

  def ==(another_task)
    self.class == another_task.class && self.name == another_task.name && self.list_id == another_task.list_id && self.completed == another_task.completed
  end

  def set_completed
    if @completed == false
      @completed = true
    end
  end
end
