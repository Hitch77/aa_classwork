require "byebug"
class PolyTreeNode
    attr_reader :value, :children, :parent
    attr_writer :parent
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        #debugger
        # return @parent = nil if node == nil
        #parent = node
        # if !node.children.include?(self)
        #     node.children << self
        # end
        # if @parent != nil
        #     @parent.children.delete(self)
        #     @parent = node
        #     node.children << self
        # end
        # self
        if @parent != nil
            @parent.children.delete(self)
        end
        @parent = node
        if node != nil && !node.children.include?(self) 
            node.children << self
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise_error if !self.children.include?(child_node)
        child_node.parent = nil
    end
    
    def dfs(value)
        return self if self.children.empty? && self.value == value
        return self if self.value == value
        # return nil if self.children.empty? && self.value != value
        self.children.each do |child_node|
            child = child_node.dfs(value)
            # return child_node if child_node.value == value
            return child if !child.nil?
        end
        nil
    end

    def bfs(value)
        queue = [self]
        while queue.length > 0
            first_node = queue.shift
            return first_node if first_node.value == value
            queue += first_node.children
        end
    end
end
