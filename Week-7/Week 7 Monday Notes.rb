# Rigid apps = every change causes a cascade of related changes.
# Fragile apps = distant and apparently unrelated code breaks after every change
# Immobile apps = code is hopelessly tangled, but can't reuse anything.
# Viscous apps = behaving badly is the most attractive alternative

# Dependencies in apps will kill! Designs can save.

SOLID apps are end-game, longlasting apps = 

Single Responsibility - no more than 1 reason for class to change
Open/Close - module should be open for extension but closed for modification
Liskov Substitution - Subclasses should be substitutable for other Subclasses
Interface Segregation - 
Dependency Inversion - Depend on abstractions, not concretions.

# To avoid dependencies, code should be:
# -loosely coupled
# -highly cohesive
# -easily composable
# -context independent

Achieving independence:

Interfaces aren't used in ruby, so segregation isn't important.

# Mock objects = only mock those that I own
# Don't mock/stub the object under test

# Resistance is a resource
# -Don't be attached to the first idea
# -Embrace friction
# -Fix the problem

# If testing is hard - examine design.
# TDD will punish you if you don't understand design.


# When you make something depend on another, it is called Coupling, or connascence. An app should only have one dependency at most. 
