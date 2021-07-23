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
        self.children.each do |child_node|
            return child_node if child_node.value == value
            child_node.dfs(value)
        end
        nil
    end
end
