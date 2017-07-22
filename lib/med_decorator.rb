# the concrete component we would like to decorate, a car in our example
class BasicMed
    def initialize(c, m, color)
        @cost = c
        @firstname = m
        @lastname = color
        
    end
    
    # getter method
    def cost 
        return @cost
    end
    
    # a method which returns a string representation of the object of type BasicMed

    
    # getter method
    def color
        return @color
    end
    
    # getter method
    def firstname 
        return @firstname
    end
    
end # ends the BasicMed class



# decorator class -- this serves as the superclass for all the concrete decorators
# the base/super class decorator (i.e. no actual decoration yet), each concrete decorator (i.e. subclass) will add its own decoration
class MedDecorator < BasicMed
    def initialize(basic_med)
        #basic_med is a real car, i.e. the component we want to decorate
        @basic_med = basic_med
        super(@basic_med.cost, @basic_med.firstname)
        @extra_cost = 0
        
    end
    
    # override the cost method to include the cost of the extra feature	
    def cost        
        return @extra_cost + @basic_med.cost
    end
    
    # override the details method to include the description of the extra feature
   
    
end # ends the CarDecorator class


# a concrete decorator --  define an extra feature
class MirrorDecorator < MedDecorator
    def initialize(basic_med)
        super(basic_med)
        @extra_cost = 1
        @description = "anti glare rear view mirror"
    end
    
end # ends the MirrorDecorator class




