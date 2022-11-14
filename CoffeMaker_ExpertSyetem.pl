guess:-
guessfor(Coffee),
write('I think your favorite coffee '),
write(Coffee),
nl,
undo.
 
/* hypotheses to be tested */
guessfor(mecchiato):- mecchiato,!.
guessfor(iced_shaken_mocha):- iced_shaken_mocha,!.
guessfor(cappuccino-vanilla):- cappuccino-vanilla,!.
guessfor(cappuccino-nestle):- cappuccino-nestle,!.
guessfor(flat_white):- flat_white,!.
guessfor(espresso):- espresso,!.
guessfor(americano):- americano,!.
guessfor(americano_and_chocolate_donut):- americano_and_chocolate_donut,!.
guessfor(espresso_and_croissant):- espresso_and_croissant,!.
guessfor(mocha):- mocha,!.
guessfor(iced_americano_whit_milk):- iced_americano_whit_milk,!.
guessfor(iced_spanish_latte):- iced_spanish_latte,!.
guessfor(v60):- v60,!.
guessfor(not_in_my_Memory).

typecoffe:- guesscoffe(original_coffee).
   
mecchiato:-
guesscoffe(hot_Drink),
guesscoffe(milk),
guesscoffe(sugar),
guesscoffe(small_size),
guesscoffe(low-fat_milk),
guesscoffe(out_flavor),
typecoffe.  


mecchiato-and-chocolate-donut:-
guesscoffe(hot_Drink),
guesscoffe(milk),
guesscoffe(sugar),
guesscoffe(small_size),
guesscoffe(full-fat_milk),
guesscoffe(chocolate-donut),
guesscoffe(original_coffee).  



cappuccino-vanilla:-
guesscoffe(hot_Drink),
guesscoffe(milk),
guesscoffe(sugar),
guesscoffe(mediem_size),
guesscoffe(full-fat_milk),
guesscoffe(vanilla_flavor),
guesscoffe(original_coffee).




cappuccino-nestle:-
guesscoffe(hot_Drink),
guesscoffe(milk),
guesscoffe(sugar),
guesscoffe(mediem_size),
guesscoffe(full-fat_milk),
guesscoffe(nestle_flavor),
guesscoffe(original_coffee). 



flat_white:-
guesscoffe(hot_Drink),
guesscoffe(milk),
guesscoffe(out_sugar),
guesscoffe(medium_size),
guesscoffe(full-fat_milk),
guesscoffe(out_flavor),
guesscoffe(original_coffee).  


flat_white:-
guesscoffe(hot_Drink),
guesscoffe(milk),
guesscoffe(no_sugar),
guesscoffe(larg_size),
guesscoffe(full-fat_milk),
guesscoffe(out_flavor),
guesscoffe(original_coffee).   


flat_white:-
guesscoffe(hot_Drink),
guesscoffe(milk),
guesscoffe(sugar),
guesscoffe(larg_size),
guesscoffe(full-fat_milk),
guesscoffe(out_flavor),
guesscoffe(original_coffee). 


espresso:-
guesscoffe(hot_Drink),
guesscoffe(no_milk),
guesscoffe(no_serger),
guesscoffe(small_size),
guesscoffe(ethiopian_coffee), 
guesscoffe(no-side-dishes).

americano:-
guesscoffe(hot_Drink),
guesscoffe(no_milk),
guesscoffe(no_serger),
guesscoffe(larg_size),
guesscoffe(ethiopian_coffee), 
guesscoffe(no-side-dishes).


americano_and_chocolate_donut:-
guesscoffe(hot_Drink),
guesscoffe(no_milk),
guesscoffe(no_serger),
guesscoffe(larg_size),
guesscoffe(ethiopian_coffee), 
guesscoffe(chocolate-donut).


espresso_and_croissant:-
guesscoffe(hot_Drink),
guesscoffe(no_milk),
guesscoffe(no_serger),
guesscoffe(small_size),
guesscoffe(ethiopian_coffee), 
guesscoffe(croissant).




mocha:-
guesscoffe(hot_Drink),
guesscoffe(milk),
guesscoffe(sugar),
guesscoffe(larg_size),
guesscoffe(full-fat_milk),
guesscoffe(cooclate_flavor),
guesscoffe(original_coffee).



iced_americano_whit_milk:-
guesscoffe(cold_Drink),
guesscoffe(milk),
guesscoffe(sugar),
guesscoffe(larg_size),
guesscoffe(full-fat_milk),
guesscoffe(original_coffee). 




iced_spanish_latte:-
guesscoffe(cold_Drink),
guesscoffe(milk),
guesscoffe(nestle),
guesscoffe(medim_size),
guesscoffe(coconut_milk),
guesscoffe(colombia_coffee).



iced_shaken_mocha:-
guesscoffe(cold_Drink),
guesscoffe(milk),
guesscoffe(caraml-flaver),
guesscoffe(medim_size),
guesscoffe(almond_milk),
guesscoffe(espresso_coffee). 




v60:-
guesscoffe(cold_Drink),
guesscoffe(larg_size),
guesscoffe(salvador_coffee).
    

/* how to ask questions */ 
ask(Question) :- 
        write('Does the coffee have the following attribute: '), 
        write(Question), write('? '), 
         read(Response), nl, 
         ( (Response == yes ; Response == y) 
         -> assert(yes(Question)) ; 
         assert(no(Question)), fail). 
:- dynamic yes/1,no/1. 
/* How to guess something */ 
guesscoffe(S) :- (yes(S) -> true ; (no(S) -> fail ; ask(S))). 

/* undo all yes/no assertions */ 
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail. 
undo. 
