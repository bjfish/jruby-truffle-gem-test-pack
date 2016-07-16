extend Algebrick::Matching                         # => main

# Simple data structures like trees
Tree = Algebrick.type do |tree|
  variants Tip  = type,
           Node = type { fields value: Object, left: tree, right: tree }
end                                                # => Tree(Tip | Node)

module Tree
  def depth
    match self,
          Tip.to_m >> 0,
          Node.(any, ~any, ~any) >-> left, right do
            1 + [left.depth, right.depth].max
          end
  end
end 

tree = Node[2,
            Tip,
            Node[5,
                 Node[4, Tip, Tip],
                 Node[6, Tip, Tip]]]
    # => Node[value: 2, left: Tip, right: Node[value: 5, left: Node[value: 4, left: Tip, right: Tip], right: Node[value: 6, left: Tip, right: Tip]]]
tree.depth                                         # => 3

# Whenever you find yourself to pass around too many fragile Hash-Array structures
# e.g. for menus.
Menu = Algebrick.type do |menu|
  Item = Algebrick.type do
    variants Delimiter = atom,
             Link      = type { fields! label: String, url: String },
             Group     = type { fields! label: String, submenu: menu }
  end

  fields! item: Item, next: menu
  variants None = atom, menu
end                                                # => Menu(None | Menu(item: Item, next: Menu))
None                                               # => None
Item                                               # => Item(Delimiter | Link | Group)

module Link
  def self.new(*fields)
    super(*fields).tap { |menu| valid! menu.url }
  end

  def self.valid!(url)
    # stub
  end
end 

module Item
  def draw_menu(indent = 0)
    match self,
          Delimiter >-> { [' '*indent + '-'*10] },
          Link.(label: ~any) >-> label { [' '*indent + label] },
          (on ~Group do |(label, sub_menu)|
            [' '*indent + label] + sub_menu.draw_menu(indent + 2)
          end)
  end
end 

module Menu
  def self.build(*items)
    items.reverse_each.reduce(None) { |menu, item| Menu[item, menu] }
  end

  include Enumerable

  def each(&block)
    it = self
    loop do
      break if None === it
      block.call it.item
      it = it.next
    end
  end

  def draw_menu(indent = 0)
    map { |item| item.draw_menu indent }.reduce(&:+)
  end
end 

sub_menu = Menu.build Link['Red Hat', '#red-hat'],
                      Delimiter,
                      Link['Ubuntu', '#ubuntu'],
                      Link['Mint', '#mint']
    # => Menu[item: Link[label: Red Hat, url: #red-hat], next: Menu[item: Delimiter, next: Menu[item: Link[label: Ubuntu, url: #ubuntu], next: Menu[item: Link[label: Mint, url: #mint], next: None]]]]

menu = Menu.build Link['Home', '#home'],
                  Delimiter,
                  Group['Linux', sub_menu],
                  Link['About', '#about']
    # => Menu[item: Link[label: Home, url: #home], next: Menu[item: Delimiter, next: Menu[item: Group[label: Linux, submenu: Menu[item: Link[label: Red Hat, url: #red-hat], next: Menu[item: Delimiter, next: Menu[item: Link[label: Ubuntu, url: #ubuntu], next: Menu[item: Link[label: Mint, url: #mint], next: None]]]]], next: Menu[item: Link[label: About, url: #about], next: None]]]]

menu.draw_menu.join("\n")
    # => "Home\n----------\nLinux\n  Red Hat\n  ----------\n  Ubuntu\n  Mint\nAbout"


#     Group['Products',
#           Menu[]],
#     Link['About', '#about']
#]]
