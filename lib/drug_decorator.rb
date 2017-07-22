# the concrete component we would like to decorate, a car in our example
class BasicDrug
    def initialize(c, m, age)
        @cost = c
        @firm = m
        @age = age
        @description = "basic drug"
    end
    
    # getter method
    def cost 
        return @cost
    end
    
    # a method which returns a string representation of the object of type BasicDrug
    def details
        return @description + "; " + @firm + "; " + @age + ": " + "#{@cost}"
    end
    
    # getter method
    def age
        return @age
    end
    
    # getter method
    def firm 
        return @firm
    end
    
end # ends the BasicDrug class



# decorator class -- this serves as the superclass for all the concrete decorators
# the base/super class decorator (i.e. no actual decoration yet), each concrete decorator (i.e. subclass) will add its own decoration
class DrugDecorator < BasicDrug
    def initialize(basic_drug)
        #basic_drug is a real car, i.e. the component we want to decorate
        @basic_drug = basic_drug
        super(@basic_drug.cost, @basic_drug.firm, @basic_drug.age)
        @extra_cost = 0
        @description = "no extra drug"
    end
    
    # override the cost method to include the cost of the extra feature	
    def cost        
        return @extra_cost + @basic_drug.cost
    end
    
    # override the details method to include the description of the extra feature
    def details
        return  @description + ": " + "#{@extra_cost}" + ". " + @basic_drug.details
    end
    
end # ends the CarDecorator class


# a concrete decorator --  define an extra feature


# another concrete decorator -- define an extra feature
class ElectricWindowsDecorator < DrugDecorator
    def initialize(basic_drug)
        super(basic_drug)
        @extra_cost = 2
        @description = "Biotene"
    end
    
end # ends the ElectricWindowsDecorator class


# another concrete decorator -- define an extra feature
class PanadolsDecorator < DrugDecorator
    def initialize(basic_drug)
        super(basic_drug)
        @extra_cost = 6
        @description = "Panadol"
    end
    
end # ends the ElectricWindowsDecorator class


