require 'test_helper'

class ClassroomTest < ActiveSupport::TestCase
  test "should not be valid without a number" do
    @room = classrooms(:number_nil)
    assert_nil @room.number
    refute @room.valid?
  end

  test "should be valid with a number" do
    @room = classrooms(:one)
    refute_nil @room.number
    assert @room.valid?
  end

  test "should not be valid without a capacity set" do
    @room = classrooms(:capacity_nil)
    assert_nil @room.capacity
    refute @room.valid?
  end

  test "should be valid with a capacity" do
    @room = classrooms(:one)
    refute_nil @room.capacity
    assert @room.valid?
  end
end
