class Menu

  attr_accessor :type, :options, :father, :label, :index, :place, :action, :travel, :talk, :choose

 def initialize
   self.options = []
   self.father = nil
 end

 def add_option option
   # option.father = self
   option.index =   self.options.size + 1
   self.options << option
 end

 def root?
   return self.father == nil
 end

 def place?
   self.type == "place"
 end

 def interactive?
   self.type == "interactive"
 end

 def talk?
   self.type == "talk"
 end

 def buy?
   self.type == "buy"
 end

 def travel?
   self.travel == true
 end

 def choose?
   self.choose == true
 end

 def include? option
   return (self.get_option(option) != nil)
 end

 def get_option value
   self.options.each do |option|
     label = (option.travel?) ? option.place.name : option.label
     if (value == label ||
         value == option.index.to_s)
      return option
     end
   end
   return nil
 end

 def show
   # Print new line before menu
   puts ""

   # Print menu options to user
   self.options.each do |option|
     label = (option.travel?) ? option.place.name : option.label
     print_menu_item option.index, label
   end

   # Print back buttom
   if not self.root?
     print_menu_item "V", "Voltar"
   end
 end

 def print_menu_item option, label
   puts "(#{option}) - #{label}"
 end
end
