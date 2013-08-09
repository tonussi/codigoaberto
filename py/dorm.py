# -- coding: utf-8


import random, math

# The dorms, each of which has two available spaces
dorms=['Zeus', 'Athena', 'Hercules', 'Bacchus', 'Pluto']

# People, alonge whith their first and second choices
prefs=[ ('Toby', ('Bacchus', 'Hercules')),
        ('Steve', ('Zeus', 'Pluto')),
        ('Andrea', ('Athena', 'Zeus')),
        ('Sarah', ('Zeus', 'Pluto')),
        ('Dave', ('Athena', 'Bacchus')),
        ('Jeff', ('Hercules', 'Pluto')),
        ('Fred', ('Pluto', 'Athena')),
        ('Suzie', ('Bacchus', 'Hercules')),
        ('Laura', ('Bacchus', 'Hercules')),
        ('Neil', ('Hercules', 'Athena'))]

# The domain for searching has to capture this restriction.

# [(0,9),(0,8),(0,7),(0,6),...,(0,0)]
domain=[(0,(len(dorms)*2)-i-1) for i in range(0,len(dorms)*2)]

def printsolution(vec):
    slots=[]
    # Create two slots for each dorm
    for i in range(len(dorms)): slots+=[i,i]

    # Loop over each students assignment
    for i in range(len(vec)):
        x = int(vec[i])
        # Choose the slot from the remaining ones
        dorm=dorms[slots[x]]
        # Show the student and assigned dorm
        print prefs[i][0], dorm
        # Remove this slot
        del slots[x]
    

"""
a funcao custo trabalha de maneira similar a funcao print a lista de lacunas e construida e lacunas sao removidas assim que sao usadas. o custo e calculado atravez da comparacao do dormitorio atual do estudante a suas duas escolhas principais. o custo total ira aumentar 0 se o estudante e atualmente escolhido para a sua escolha principal, aumenta 1 se ele e escolhido para sua segunda opcao e aumenta 3 se ele nao e escolhido para nenhuma de suas escolhas.
"""

def dormcost(vec):
    cost=0
    # Create list a of slots
    slots=[0,0,1,1,2,2,3,3,4,4]
    
    # Loop over each student
    for i in range(len(vec)):
        x=int(vec[i])
        dorm=dorms[slots[x]]
        pref=prefs[i][1]
        # First choice cost 0, second choice costs 1
        if pref[0]==dorm: cost+=0
        elif pref[1]==dorm: cost+=1
        else: cost+=3
        # Not on the list costs 3
        
        # Remove selected slot
        del slots[x]
    return cost

# dorm.printsolution([0,0,0,0,0,0,0,0,0,0])
# reload(dorm)
# s=optimization.randomoptimize(dorm.domain,dorm.dormcost)
# dorm.dormcost(s)
