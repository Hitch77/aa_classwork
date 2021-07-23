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
        # debugger
        return @parent = nil if node == nil
        @parent = node
        if !node.children.include?(self)
            node.children << self
        end
        if @parent != nil
            @parent.children.delete(self)
            parent = node
            node.children << self
        end
    end
end