require 'pry-byebug'
class IterativeLinkedList

  attr_reader :head_node

  def count
    if head_node.nil?
      0
    else
      count = 1
      current_node = head_node
      while current_node.next_node
        count += 1
        current_node = current_node.next_node
      end
      count
    end
  end

  def push(word)
    node = Node.new(word)
    if head_node.nil?
      @head_node = node
    else
      last_node.next_node = node
    end
  end

  def last_node
    if head_node.nil?
      nil
    else
      current_node = head_node
      while current_node.next_node
        current_node = current_node.next_node
      end
      current_node
    end
  end

  def pop
    if head_node.nil?
      nil
    elsif head_node.next_node.nil?
      popped = head_node
      @head_node = nil
      popped.data
    else
      popped = last_node
      current_node = head_node
      while current_node.next_node != last_node
        current_node = current_node.next_node
      end
      current_node.next_node = nil
      popped.data
    end
  end

  def delete(word)
    if head_node.nil?
      nil
    elsif head_node.data == word
      if head_node.next_node
        @head_node = head_node.next_node
      else
        @head_node = nil
      end
    else
      current_node = head_node
      while current_node.data != word && current_node.next_node
        checked_node = current_node.next_node
        if checked_node.data == word
          current_node.next_node = checked_node.next_node
          checked_node.next_node = nil
        else
          current_node = current_node.next_node
        end
      end
    end
  end

  def include?(word)
   if find(word)
     true
   else
     false
   end
  end
 
  def find(word)
   current_node = head_node
   if current_node.data == word
     return current_node
   else
     while current_node.data != word && current_node.next_node
       checked_node = current_node.next_node
       if checked_node.data == word
        return checked_node
       else
         current_node = current_node.next_node
       end
     end
   end
  end
 
  def insert(position, word)
    current_node = head_node
    index = position - 1
    index.times do 
      current_node = current_node.next_node
    end
    checked_node = current_node.next_node if current_node.next_node
    current_node.next_node = Node.new(word, checked_node)
  end

  def index(word)
    index_count = 0
    current_node = head_node
    if current_node.data == word
      index_count
    else
      while current_node.next_node
        if current_node.data == word
         return index_count
        else
          index_count += 1
          current_node = current_node.next_node
        end
      end
    end
  end

  def insert_after(existing_word, new_word)
    exsisting_word_index = index(existing_word)
    insert(exsisting_word_index, new_word)
  end

  def to_a
    array = []
    current_node = head_node
    while current_node
      array << current_node.data
      current_node = current_node.next_node
    end
    array
  end

  class Node

    attr_reader :data
    attr_accessor :next_node

    def initialize(word, reference = nil)
      @data = word
      @next_node = reference
    end

  end

end
