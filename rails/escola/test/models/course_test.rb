require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  test "a course should not be valid without a name" do
    course = courses(:nameless)
    assert_nil course.name
    refute course.valid?
    assert_equal ["can't be blank"], course.errors.messages[:name]
  end

  test "a course should not be valid without a description" do
    course = courses(:descriptionless)
    assert_nil course.description
    refute course.valid?
    assert_equal ["can't be blank"], course.errors.messages[:description]
  end

  test "a course should not be valid without a classroom" do
    course = courses(:classroomless)
    assert_nil course.classroom
    refute course.valid?
    assert_equal ["must exist"], course.errors.messages[:classroom]
  end

  test "a course with name, description and classroom should be valid" do
    assert courses(:one).valid? # buscando direto das fixtures
  end

  test "must have room for new students if classroom is not empty" do
    course = courses(:two)  # the one with a small classroom
    assert course.has_places?
  end

  test "must error out if classroom is full" do
    course = courses(:empty)  # the one with a small classroom
    refute course.has_places?
  end
end
