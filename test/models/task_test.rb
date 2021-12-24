require_relative '../test_helper'


class Tasktest < ActiveSupport::TestCase
  test 'should create proper tasks' do
    default_password_digest = '24hfornjav 4ngrv'
    a = User.create!(name: 'A', password_digest: default_password_digest, access_level: 3)
    b = User.create!(name: 'B', password_digest: default_password_digest, access_level: 1)
    c = User.create!(name: 'C', password_digest: default_password_digest, access_level: 1)

    task = Task.create(title: 'Seed task',
                       description: 'Test Task Description',
                       creator: a,
                       access_level: 1)
    b.assignments << Assignment.new(task: task)
    b.save!
    c.assignments << Assignment.new(task: task)
    c.save!

    task.review = Review.new(text: 'Well done', reviewer: a)

    assert_equal 2, task.users.count, 'Users are not assigned to the task properly'
    assert_equal 1, a.reviews.count,  "User can't access his reviews"
    assert_equal a, task.creator, 'Creator is not assigned properly'
  end


  test 'should check access level' do
    default_password_digest = '24hfornjav 4ngrv'
    a = User.create!(name: 'A', password_digest: default_password_digest, access_level: 3)
    b = User.create!(name: 'B', password_digest: default_password_digest, access_level: 1)

    task = Task.create(title: 'Seed task',
                       description: 'Test Task Description',
                       creator: a,
                       access_level: 2)
    b.assignments << Assignment.new(task: task)

    refute b.save
  end
end