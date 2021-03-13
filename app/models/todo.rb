class Todo < ActiveRecord::Base
  belongs_to :user

  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id} #{due_date.to_s(:long)} #{todo_text} #{is_completed}"
  end

  def self.overdue
    all.where("due_date < ? and completed =?", Date.today, false)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end
end
