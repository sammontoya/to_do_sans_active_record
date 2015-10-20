require 'spec_helper'

describe Task do
  it 'is initialized with a name and a task ID and completed = false' do
    task = Task.new('learn SQL', 1, false)
    task.should be_an_instance_of Task
  end

  it 'tells you its name' do
    task = Task.new('learn SQL', 1, false)
    task.name.should eq 'learn SQL'
  end

  it 'tells you its list ID' do
    task = Task.new('learn SQL', 1, false)
    task.list_id.should eq 1
  end

  it 'tells you if its not completed' do
    task = Task.new('learn SQL', 1, false)
    task.completed.should eq false
  end

  it 'tells you if its completed' do
    task = Task.new('learn SQL', 1, true)
    task.completed.should eq true
  end

  it 'starts off with no tasks' do
    Task.all.should eq []
  end

  it 'lets you save tasks to the database' do
    task = Task.new('learn SQL', 1, false)
    task.save
    Task.all.should eq [task]
    savedTask = Task.all.first
    savedTask.name.should eq 'learn SQL'
    savedTask.list_id.should eq 1
    savedTask.completed.should eq false
  end

  it 'is the same task if it has the same name and list ID' do
    task1 = Task.new('learn SQL', 1, false)
    task2 = Task.new('learn SQL', 1, false)
    task1.should eq task2
  end

  it 'should return true if a task is completed' do
    task = Task.new('learn SQL', 1, true)
    task.completed.should eq true
  end

  it 'should return false if a task is not completed' do
    task = Task.new('learn SQL', 1, false)
    task.completed.should eq false
  end

  it 'should return true if a task has had set_completed called' do
    task = Task.new('learn SQL', 1, false)
    task.set_completed
    task.completed.should eq true
  end
end
